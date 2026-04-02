-- ============================================================================
-- 📅 DAY 01: SELECT · FROM · LIMIT
-- 🎯 SQL for Data Analytics — 40-Day Learning Journey
-- 👤 Author: Vivek Sharma
-- 📆 Date: 02-04-2026
-- 🔧 Platform: Google BigQuery
-- 📂 Dataset: bigquery-public-data.thelook_ecommerce
-- ============================================================================
-- 🧠 CONCEPTS COVERED TODAY:
--    • Relational databases store data in tables (rows = records, columns = fields)
--    • Tables connect through keys (primary key → unique identifier, foreign key → reference)
--    • SQL is the language to *ask questions* of a database — the engine answers
--    • BigQuery hierarchy: Project → Dataset → Table
--    • SELECT * returns every column; SELECT col1, col2 returns only what you choose
--    • LIMIT restricts the number of rows returned — essential for previewing data
--    • INFORMATION_SCHEMA — the metadata catalog to explore any database smartly
--
-- 💡 KEY TAKEAWAY:
--    In production, NEVER use SELECT * — always specify the columns you need.
--    SELECT * is only for quick exploration; it wastes compute and exposes you
--    to schema changes that can silently break dashboards and pipelines.
-- ============================================================================


-- ════════════════════════════════════════════════════════════════════════════
-- 🟢 EXERCISE 1 (EASY): Quick Data Preview for Your Manager
-- ════════════════════════════════════════════════════════════════════════════
-- 📋 Business Scenario:
--    Your first day as a junior analyst at an e-commerce company.
--    Manager says: "Can you pull up the orders table quickly so I can see
--    what data we're working with?"
--
-- 🎯 Objective: Return all columns from orders, limited to the first 5 rows
-- 📊 Expected Output: 5 rows × all columns
--    Columns: order_id, user_id, status, gender, created_at,
--             returned_at, shipped_at, delivered_at, num_of_item
-- ────────────────────────────────────────────────────────────────────────────

SELECT
  *
FROM
  `bigquery-public-data.thelook_ecommerce.orders`
LIMIT 5;

-- 📝 WHY LIMIT 5 (not just column names)?
--    Column names alone don't tell you HOW the data looks.
--    • Is `status` stored as "Shipped" or as a number like 3?
--    • Is `created_at` formatted as "2026-04-01" or "April 1, 2026"?
--    • Are there NULLs hiding in shipped_at or delivered_at?
--    A 5-row sample answers all of this instantly — zero guesswork.


-- ════════════════════════════════════════════════════════════════════════════
-- 🟡 EXERCISE 2 (MEDIUM): Specific Column Selection for Product Team
-- ════════════════════════════════════════════════════════════════════════════
-- 📋 Business Scenario:
--    The product team asks: "What information do we track for each product?
--    Show me just the name, brand, category, and retail price — first 20
--    products."
--
-- 🎯 Objective: Return exactly 4 columns, 20 rows — nothing more
-- 📊 Expected Output: 20 rows × 4 columns (name, brand, category, retail_price)
--
-- 💡 Why this matters:
--    In real work, you ALWAYS select only the columns you need.
--    • Reduces data scanned (saves cost in BigQuery — billed per byte)
--    • Makes results readable for non-technical stakeholders
--    • Proves you understand the question before writing the query
-- ────────────────────────────────────────────────────────────────────────────

SELECT
  name,
  brand,
  category,
  retail_price
FROM
  `bigquery-public-data.thelook_ecommerce.products`
LIMIT 20;


-- ════════════════════════════════════════════════════════════════════════════
-- 🔴 EXERCISE 3 (HARD): Rapid Requirement Changes from Marketing
-- ════════════════════════════════════════════════════════════════════════════
-- 📋 Business Scenario:
--    The marketing team makes three back-to-back requests. Each one changes
--    what they actually want. This is VERY common in real jobs — requirements
--    shift mid-task. The skill is adapting quickly without frustration.
--
-- 📂 Dataset: bigquery-public-data.thelook_ecommerce.users
-- ────────────────────────────────────────────────────────────────────────────

-- 🔹 Request 1: "Show all columns for the first 15 users"
--    (Manager wants the full picture first)

SELECT
  *
FROM
  `bigquery-public-data.thelook_ecommerce.users`
LIMIT 15;


-- 🔹 Request 2: "Actually, just show first name, last name, city, country, and age"
--    (They realized all columns was too noisy for their slide deck)

SELECT
  first_name,
  last_name,
  city,
  country,
  age
FROM
  `bigquery-public-data.thelook_ecommerce.users`
LIMIT 15;


-- 🔹 Request 3: "Forget the name — just gender and country"
--    (Now they want demographic segmentation data only)

SELECT
  gender,
  country
FROM
  `bigquery-public-data.thelook_ecommerce.users`
LIMIT 15;

-- 📝 LESSON LEARNED:
--    Requirements WILL change. A good analyst doesn't get annoyed —
--    they iterate fast. The ability to edit a query in 10 seconds
--    and re-run it is a superpower in stakeholder meetings.


-- ════════════════════════════════════════════════════════════════════════════
-- 🏢 REAL-WORLD ANALYST TASK: First Day at a D2C Fashion Startup
-- ════════════════════════════════════════════════════════════════════════════
-- 📋 Business Scenario:
--    You just joined a D2C fashion startup in Bengaluru as a junior analyst.
--    Your manager drops a Slack message:
--    "Can you quickly check what columns we have in the events table?
--     I want to understand what user actions we're tracking before our
--     product review."
--
-- 📂 Dataset: bigquery-public-data.thelook_ecommerce.events
-- ────────────────────────────────────────────────────────────────────────────

-- Step 1: Pull a quick sample to see columns AND actual data values

SELECT
  *
FROM
  `bigquery-public-data.thelook_ecommerce.events`
LIMIT 5;

-- Step 2 (Bonus): Use INFORMATION_SCHEMA to get just the column names
--    This is how senior analysts explore unfamiliar databases —
--    they query the metadata, not the data itself.

SELECT
  column_name
FROM
  `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name = 'events';

-- ────────────────────────────────────────────────────────────────────────────
-- 💬 SLACK RESPONSE I WOULD SEND TO MY MANAGER:
-- ────────────────────────────────────────────────────────────────────────────
--    "Hey! I just pulled a sample from the events table. We are definitely
--     tracking user actions — the core metric is stored in the `event_type`
--     column. We also have great context attached to those actions, including
--     where the user is located (`city`, `state`) and how they found us
--     (`traffic_source`). Let me know if you'd like me to group the
--     `event_type` column to see exactly which specific actions (like clicks,
--     cart adds, etc.) occur most often!"
--
-- 📝 WHY THIS RESPONSE WORKS:
--    1. ✅ Direct answer   → Points to `event_type` as THE column (saves manager time)
--    2. ✅ Added context   → Mentions `city`, `state`, `traffic_source` (anticipates next question)
--    3. ✅ Pro analyst move → Offers a GROUP BY follow-up (shows initiative + next step)
--
-- ⚡ THE TAKEAWAY:
--    An amateur analyst acts like a dictionary — spits out 13 column names.
--    A professional analyst acts like a guide — finds the specific fact the
--    business needs, translates it to plain English, and offers the next step.
-- ────────────────────────────────────────────────────────────────────────────


-- ════════════════════════════════════════════════════════════════════════════
-- 🧠 INFORMATION_SCHEMA: The Analyst's Secret Weapon
-- ════════════════════════════════════════════════════════════════════════════
-- INFORMATION_SCHEMA is a built-in metadata catalog in every database.
-- Instead of clicking through 200 tables manually, you ASK the database
-- to tell you about itself. Three real-world use cases:
-- ────────────────────────────────────────────────────────────────────────────

-- 🔍 Use Case 1: "Where is that data?" (Find a column across all tables)
--    Example: Manager asks for customer emails, but there are 200 tables.
--    Instead of opening each one, you search for it:

SELECT
  table_name,
  column_name
FROM
  `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS`
WHERE
  column_name LIKE '%email%';

-- 💡 LIKE pattern cheat sheet:
--    '%email'  → ends with "email"    → finds: contact_email, work_email
--    'email%'  → starts with "email"  → finds: email_address, email_id
--    '%email%' → contains "email"     → finds: contact_email, email_address, user_email_id


-- 🔍 Use Case 2: "What do we actually own?" (List all tables in a dataset)

SELECT
  table_name
FROM
  `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.TABLES`;

-- Result: A clean list → customers, orders, products, inventory, events, etc.


-- 🔍 Use Case 3: "Why is my code breaking?" (Check data types)
--    If SUM(amount_paid) throws an error, the column might be STRING, not INT64.

SELECT
  column_name,
  data_type
FROM
  `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name = 'orders'
  AND column_name = 'num_of_item';


-- ════════════════════════════════════════════════════════════════════════════
-- 🤖 AI TOOL TASK: Understanding Table Relationships (Pre-JOIN Foundation)
-- ════════════════════════════════════════════════════════════════════════════
-- 📋 Task: Used ChatGPT to build a mental model of how orders, products,
--    and users tables connect — BEFORE learning JOINs (Day 11).
--
-- 🔗 TABLE RELATIONSHIPS (verified against BigQuery schema):
--
--    ┌──────────┐         ┌──────────┐         ┌──────────┐
--    │  USERS   │         │  ORDERS  │         │ PRODUCTS │
--    │──────────│         │──────────│         │──────────│
--    │ id (PK)  │◄────────│ user_id  │         │ id (PK)  │
--    │ name     │  (FK)   │ order_id │         │ name     │
--    │ email    │         │ status   │         │ brand    │
--    │ city     │         │ gender   │         │ category │
--    │ country  │         │ created  │         │ price    │
--    └──────────┘         └──────────┘         └──────────┘
--
--    • users.id → orders.user_id (one user can have many orders)
--    • order_items table connects orders to products (not explored yet)
--
-- 💼 3 BUSINESS QUESTIONS THAT NEED JOINs (can't answer from one table):
--    1. "What is the average order value by city?" → needs users + orders
--    2. "Which brand has the highest return rate?" → needs products + orders
--    3. "Are younger users buying different categories?" → needs all 3 tables
--
-- ✅ Verification: Confirmed column names exist in BigQuery Schema tab.
--    These questions become my JOIN exercises on Day 11.
-- ════════════════════════════════════════════════════════════════════════════


-- ════════════════════════════════════════════════════════════════════════════
-- 📚 DAY 1 SUMMARY
-- ════════════════════════════════════════════════════════════════════════════
--
--  ✅ Learned: SELECT, FROM, LIMIT — the foundation of every SQL query
--  ✅ Practiced: SELECT * (exploration) vs SELECT col1, col2 (production)
--  ✅ Discovered: INFORMATION_SCHEMA as a metadata exploration tool
--  ✅ Built: Mental model of table relationships (PK/FK) before JOINs
--  ✅ Developed: The habit of writing plain-English business responses
--
--  🔗 Sources:
--     • UC Davis "SQL for Data Science" — Module A (Coursera)
--     • IBM "Databases and SQL for Data Science with Python" — Module A (Coursera)
--     • Google Data Analytics Certificate — Course 3 (Coursera)
--
--  ➡️ NEXT: Day 02 — where-Logic-Operators
-- ════════════════════════════════════════════════════════════════════════════
