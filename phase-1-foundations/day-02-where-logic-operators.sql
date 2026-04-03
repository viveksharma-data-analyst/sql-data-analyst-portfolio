/*
================================================================================
  FILE    : day-02-where-logic-operators.sql
  AUTHOR  : Vivek Sharma
  DATE    : 03-04-2026
  TOPIC   : WHERE Clause | Logical Operators | SQL Execution Order
  DATASET : bigquery-public-data.thelook_ecommerce
  PLATFORM: Google BigQuery Sandbox

  WHAT I LEARNED TODAY:
  - SQL does NOT execute in the order you write it
  - The correct logical execution order is:
      1. FROM       → Which table am I reading?
      2. JOIN       → Combine tables (Day 11)
      3. WHERE      → Filter rows BEFORE any grouping
      4. GROUP BY   → Group rows into buckets (Day 7)
      5. HAVING     → Filter groups AFTER grouping (Day 7)
      6. SELECT     → Choose which columns to show
      7. DISTINCT   → Remove duplicates from result
      8. ORDER BY   → Sort the final output
      9. LIMIT      → Trim how many rows are returned

  KEY INSIGHT: Because SELECT runs AFTER WHERE (step 6 vs step 3),
  you CANNOT use a SELECT alias inside a WHERE clause.
  This is one of the most common beginner SQL bugs in production.

  BUSINESS CONTEXT:
  All queries simulate real analyst tasks at Indian e-commerce companies.
  Dataset uses USD — $30 is treated as a proxy for ₹2,500 throughout.
================================================================================
*/


-- ============================================================================
-- SECTION 1: UNDERSTANDING EXECUTION ORDER
-- (Predict exercises — thinking before running)
-- ============================================================================

/*
  PREDICT EXERCISE 1: Trace the execution order mentally first.

  Question: What rows does WHERE eliminate?
            At which step does LIMIT 5 trim the output?

  My prediction before running:
  - Step 1 (FROM)  : Load ALL rows from orders table
  - Step 3 (WHERE) : Keep ONLY rows where status = 'Complete'
                     (thousands of Cancelled/Processing/Shipped rows are GONE)
  - Step 6 (SELECT): Show only the status and created_at columns
  - Step 9 (LIMIT) : From the already-filtered result, show only 5 rows

  KEY INSIGHT: LIMIT does NOT filter first. It trims last.
  If a table has 100,000 orders and 60,000 are 'Complete',
  WHERE processes all 100,000 rows first, keeps 60,000,
  THEN LIMIT shows just 5 of those 60,000.
*/

SELECT status, created_at
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Complete'
LIMIT 5;


/*
  PREDICT EXERCISE 2: How many conditions must be TRUE simultaneously?

  Query uses AND — so BOTH conditions must be true at the same time:
    Condition 1: num_of_item > 2  (order has 3 or more items)
    Condition 2: status = 'Shipped'

  My prediction: Using OR would give more rows because OR only
  needs ONE condition to be true. AND is stricter — it needs both.
*/

SELECT user_id
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE num_of_item > 2
  AND status = 'Shipped'
LIMIT 10;


/*
  PREDICT EXERCISE 3: ORDER BY changes WHAT the LIMIT captures.

  Without ORDER BY → LIMIT grabs arbitrary rows (whatever order
  they sit on disk). Results are non-deterministic.

  With ORDER BY country → rows are sorted alphabetically FIRST
  (step 8), THEN LIMIT cuts the top 20 (step 9).
  Since 'China' < 'India' alphabetically, the top 20 will be
  almost entirely Chinese users.

  ANALYST RULE: If you use LIMIT to answer a business question,
  ALWAYS pair it with ORDER BY. Otherwise your result is random.
*/

-- Version 1: Without ORDER BY (random mix — not useful for analysis)
SELECT gender, country
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE country = 'India'
   OR country = 'China'
LIMIT 20;

-- Version 2: With ORDER BY (structured, deterministic — analyst standard)
SELECT gender, country
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE country = 'India'
   OR country = 'China'
ORDER BY country
LIMIT 20;


-- ============================================================================
-- SECTION 2: THE ALIAS TRAP — Most Common Beginner Bug
-- ============================================================================

/*
  ERROR EXERCISE: Why does this query FAIL?

  BROKEN QUERY (do not run in production):
  ----------------------------------------
  SELECT sale_price AS discounted_price
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE discounted_price < 20;   ← ERROR: Unrecognized name: discounted_price
  ----------------------------------------

  WHY IT FAILS:
  - 'discounted_price' is an alias created at Step 6 (SELECT)
  - WHERE runs at Step 3 — the alias does not exist yet
  - SQL panics: "I have never heard of discounted_price"

  THE FIX: Always use the ORIGINAL column name in WHERE,
  not the alias. The alias is only for display in final output.

  REAL ANALOGY: Your name is "Rajesh" but friends call you "Raju."
  If the government asks for your name on a form, you write "Rajesh."
  The government doesn't know who "Raju" is.
*/

-- CORRECT VERSION
SELECT sale_price AS discounted_price      -- alias created here (step 6)
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE sale_price < 20;                     -- original column name used (step 3)


-- ============================================================================
-- SECTION 3: HANDS-ON EXERCISES — Real Business Scenarios
-- ============================================================================

-- ----------------------------------------------------------------------------
-- EXERCISE 1 (EASY): Jeans Inventory Report
-- Business Request: Find all Jeans priced over ₹2,500 for inventory review
-- ----------------------------------------------------------------------------
/*
  Business context: Inventory manager wants products in 'Jeans'
  category priced above $30 (proxy for ₹2,500).
  Sorted highest-to-lowest so the most expensive appear first.

  COMMENT TYPES USED HERE:
  Single-line comment: --  (invisibility cloak for one line)
  Multi-line comment : /* ... */  (for longer explanations)

  STRING RULE (critical for beginners):
  Column names → No quotes:    category
  Numbers      → No quotes:    30
  Text values  → Single quotes: 'Jeans'
  Forgetting quotes on text throws: "Unrecognized name: Jeans"
*/

-- Business Request: Jeans priced above ₹2,500 (USD proxy: $30)
-- Note: Dataset uses USD. $30 ≈ ₹2,500 at standard conversion.
SELECT
  name,
  brand,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price > 30          -- ₹2,500 proxy in USD
  AND category = 'Jeans'         -- text values always need single quotes
ORDER BY retail_price DESC;      -- DESC = highest to lowest (most expensive first)


-- ----------------------------------------------------------------------------
-- EXERCISE 2 (HARD): Multi-Condition User Segmentation
-- Business Request: Young users from India/Brasil for growth campaign
-- ----------------------------------------------------------------------------
/*
  This query demonstrates the critical AND vs OR precedence rule:

  THE MISTAKE (without parentheses):
  WHERE age < 30 AND country = 'India' OR country = 'Brasil'
  SQL reads this as: "Must be a young Indian... OR can just be
  from Brasil (any age)." This is WRONG for our use case.

  THE FIX (with parentheses):
  WHERE age < 30 AND (country = 'India' OR country = 'Brasil')
  SQL reads this as: "Must be under 30 AND from India or Brasil."

  THE PRO SHORTCUT (using IN operator):
  WHERE age < 30 AND country IN ('India', 'Brasil')
  Same result, cleaner code, zero parenthesis confusion.

  RULE: AND = superglue (both must be true)
        OR  = giant loophole (either can be true)
        AND always evaluates before OR (like × before + in math)
*/

-- Clean version using IN operator (recommended style)
SELECT
  first_name,
  last_name,
  country,
  age,
  traffic_source
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE age < 30
  AND country IN ('India', 'Brasil')   -- IN replaces messy OR chaining
ORDER BY age ASC,                      -- primary sort: youngest first
         country ASC                   -- secondary sort: alphabetical within same age
LIMIT 50;


-- ============================================================================
-- SECTION 4: REAL-WORLD ANALYST TASK
-- Scenario: Junior Analyst at Flipkart Warehouse Operations
-- ============================================================================
/*
  Manager's Slack message:
  "Can you pull all orders with more than 3 items that are still
  in Processing status? We need to flag them for manual
  warehouse review by EOD."

  MY TRANSLATION PROCESS (before writing SQL):
  ┌─────────────────────────────────────────────────────┐
  │ Step 1 — Which table? orders (has status + items)   │
  │ Step 2 — Filter 1: num_of_item > 3                  │
  │ Step 3 — Filter 2: status = 'Processing'            │
  │ Step 4 — Operator: AND (both must be true together) │
  │ Step 5 — Output: all columns (*) for warehouse team │
  └─────────────────────────────────────────────────────┘

  WHY AND, NOT OR:
  - AND gives us: large orders (>3 items) that are ALSO stuck
    → Only the problematic ones
  - OR would give us: any order with >3 items (even delivered)
    PLUS any processing order (even single-item ones)
    → Useless noise for the warehouse team

  CASE SENSITIVITY WARNING:
  BigQuery is case-sensitive for string values.
  'processing' ≠ 'Processing' ≠ 'PROCESSING'
  Always check how data is stored before filtering.
  Use: SELECT DISTINCT status FROM table to verify exact values.
*/

-- Warehouse Escalation Query — Large stuck orders for manual review
-- OPERATOR: AND (both conditions must be true simultaneously)
-- MISTAKE IF OR: Would return ALL large orders + ALL processing orders
--               regardless of the other condition = useless noise
-- CASE NOTE: Status stored as 'Processing' (capital P) in this dataset

SELECT *
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE num_of_item > 3
  AND status = 'Processing'   -- exact match required, capital P
ORDER BY num_of_item DESC,    -- largest orders first (highest priority)
         created_at ASC;      -- oldest stuck orders within same size first


-- ============================================================================
-- SECTION 5: CONCEPT SUMMARY — Quick Reference
-- ============================================================================

/*
  COMPARISON OPERATORS:
  =    Equal to
  !=   Not equal to  (also written as <>)
  >    Greater than
  <    Less than
  >=   Greater than or equal to
  <=   Less than or equal to

  LOGICAL OPERATORS:
  AND  → Both conditions must be true (narrows results)
  OR   → Either condition can be true (expands results)
  NOT  → Reverses a condition
        NOT status = 'Complete' = status != 'Complete'

  OPERATOR PRECEDENCE:
  AND evaluates BEFORE OR (just like × before + in math)
  Always use parentheses to make your intent clear.

  GOLDEN QUOTING RULE:
  Column names    → No quotes     → category, retail_price
  Numbers         → No quotes     → 30, 100, 2500
  Text/String data → Single quotes → 'Jeans', 'India', 'Processing'

  COMMENT SYNTAX:
  --           Single-line comment (inline or header)
  /* ... */    Multi-line comment (for paragraphs, headers)

  ASC vs DESC:
  ASC  = Low to High  (A→Z, 0→9, oldest→newest) — DEFAULT if not specified
  DESC = High to Low  (Z→A, 9→0, newest→oldest)
*/


-- ============================================================================
-- Next: Day 3 — DISTINCT, ORDER BY deep dive, COUNT basics, data types
-- ============================================================================
