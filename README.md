# SQL for Data Analysis — 40-Day Learning Sprint

<div align="center">

![Sprint Progress](https://img.shields.io/badge/Sprint_Progress-Day_0%2F40-yellow?style=flat-square)
![SQL](https://img.shields.io/badge/SQL-BigQuery_%7C_PostgreSQL_%7C_MySQL-4285F4?style=flat-square)
![Status](https://img.shields.io/badge/Status-In_Progress-brightgreen?style=flat-square)

**A structured, daily-documented journey from SQL fundamentals to business-ready analytics.**
**Built entirely on Google BigQuery with real-world public datasets.**
**Every query answers a real business question — not a textbook exercise.**

</div>

---

## 👤 About

I'm **Vivek Sharma**, an aspiring Data Analyst based in Agra, India. This repository documents my 40-day structured SQL sprint — from writing my first `SELECT` statement to building production-quality analytics reports that solve real business problems.

**What makes this different from a typical tutorial repo:**
- Every exercise starts with a real business scenario, not "practice SELECT syntax"
- Every project solves a problem a stakeholder could actually ask
- Every error is documented and debugged — mistakes are part of the learning record
- AI tools (ChatGPT, Claude, Gemini) are used as learning accelerators, not answer generators

---

## 📌 Featured Projects

| # | Project | Business Domain | Key SQL Concepts | Status |
|---|---------|----------------|-------------------|--------|
| 1 | [E-Commerce Pulse](./phase-1-foundations/day-05-project-ecommerce-pulse/) | Retail / D2C | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`, `LIKE`, `COUNT` | 🔜 |
| 2 | [Sales Performance Report](./phase-2-core-sql/day-10-project-sales-performance/) | Revenue Analytics | `GROUP BY`, `HAVING`, `CASE WHEN`, `EXTRACT`, Conditional Aggregation | 🔜 |
| 3 | [Customer Purchase Intelligence](./phase-3-joins-subqueries/day-15-project-customer-purchase-intelligence/) | Customer Analytics | Multi-table JOINs, Subqueries, Anti-Join Pattern, `EXISTS` | 🔜 |
| 4 | [CTE Refactoring Lab](./phase-4-ctes-advanced-filtering/day-18-project-cte-refactoring-lab/) | Code Quality | CTEs, Nested CTEs, `COALESCE`, `NULLIF`, Set Operations | 🔜 |
| 5 | [Ranking & Trend Analysis](./phase-5-window-functions/day-25-project-ranking-trend-analysis/) | Performance Analytics | `ROW_NUMBER`, `RANK`, `LAG`, `LEAD`, Running Totals | 🔜 |
| 6 | [Customer Lifecycle Analytics](./phase-6-business-analytics/day-30-project-customer-lifecycle-analytics/) | Growth / Retention | Cohort, Funnel, Retention, Revenue Analytics | 🔜 |
| 7 | [E-Commerce Retention Analysis](./phase-7-portfolio-projects/project-1-ecommerce-retention/) | Cohort / Retention | End-to-End Case Study | 🔜 |
| 8 | [Financial Performance Metrics](./phase-7-portfolio-projects/project-2-financial-metrics/) | Finance / KPIs | End-to-End Case Study | 🔜 |
| 9 | [Marketing Funnel Optimization](./phase-7-portfolio-projects/project-3-marketing-funnel/) | Marketing / Growth | End-to-End Case Study | 🔜 |

> *Projects 1–6 are phase capstones built during learning. Projects 7–9 are end-to-end portfolio case studies.*

---

## 🏗️ Repository Architecture

```
sql-data-analyst-portfolio/
│
├── phase-1-foundations/              ← Days 1–5: SQL basics + first project
├── phase-2-core-sql/                 ← Days 6–10: Aggregations & grouping
├── phase-3-joins-subqueries/         ← Days 11–15: Multi-table operations
├── phase-4-ctes-advanced-filtering/  ← Days 16–18: CTEs & set operations
├── phase-5-window-functions/         ← Days 19–25: Window functions deep dive
├── phase-6-business-analytics/       ← Days 26–30: Real-world analytics patterns
├── phase-7-portfolio-projects/       ← Days 31–35: 3 end-to-end case studies
└── README.md
```

| Phase | Days | Focus | Capstone Project |
|-------|------|-------|--------------------|
| [Phase 1](./phase-1-foundations/) | 1–5 | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`, `LIKE` | E-Commerce Pulse |
| [Phase 2](./phase-2-core-sql/) | 6–10 | Aggregations, `GROUP BY`, `HAVING`, `CASE WHEN` | Sales Performance Report |
| [Phase 3](./phase-3-joins-subqueries/) | 11–15 | JOINs, Subqueries, `EXISTS`, `UNION` | Customer Purchase Intelligence |
| [Phase 4](./phase-4-ctes-advanced-filtering/) | 16–18 | CTEs, `COALESCE`, `NULLIF`, Set Operations | CTE Refactoring Lab |
| [Phase 5](./phase-5-window-functions/) | 19–25 | `ROW_NUMBER`, `RANK`, `LAG`, `LEAD`, Running Totals | Ranking & Trend Analysis |
| [Phase 6](./phase-6-business-analytics/) | 26–30 | Cohort, Funnel, Retention, Revenue Analytics | Customer Lifecycle Analytics |
| [Phase 7](./phase-7-portfolio-projects/) | 31–35 | 3 End-to-End Analytics Case Studies | 3 Portfolio Projects |

---

## 🧠 SQL Concepts Covered

| Category | Concepts |
|----------|----------|
| **Fundamentals** | `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`, `LIKE`, `BETWEEN`, `IN`, `AND`/`OR`/`NOT` |
| **Aggregations** | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`, `COUNT(DISTINCT)` |
| **Logic & Cleaning** | `CASE WHEN`, `COALESCE`, `NULLIF`, `IS NULL`, `CAST`, `EXTRACT`, `CONCAT` |
| **Multi-Table** | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`, Self Join |
| **Subqueries** | `WHERE` subquery, `FROM` subquery (Derived Tables), `EXISTS`, `NOT EXISTS`, Correlated |
| **CTEs** | Single CTE, Nested CTEs, CTE + Aggregation Patterns |
| **Window Functions** | `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`, `LAG`, `LEAD`, Running Totals, Moving Averages |
| **Business Analytics** | Cohort Analysis, Funnel Analysis, Retention Rates, Revenue Analytics, Customer Segmentation |
| **Set Operations** | `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT` |

---

## 📅 40-Day Sprint Tracker

<details>
<summary><strong>Click to expand full daily progress log</strong></summary>

<br>

| Day | Date | Topic | Phase | Status |
|-----|------|-------|-------|--------|
| 0 | Mar 30 | Environment setup | Setup | ✅ Complete |
| 1 | Apr 02 | `SELECT`, `FROM`, `LIMIT` | Phase 1 | ⬜ |
| 2 | Apr 03 | `WHERE`, `AND`/`OR`/`NOT`, Execution order | Phase 1 | ⬜ |
| 3 | Apr 04 | `DISTINCT`, `ORDER BY`, `COUNT`, `LIKE` | Phase 1 | ⬜ |
| 4 | Apr 05 | `BETWEEN`, `IN`, Business translation | Phase 1 | ⬜ |
| 5 | Apr 06 | 🏗️ **Project: E-Commerce Pulse** | Phase 1 | ⬜ |
| 6 | Apr 07 | Advanced `WHERE`, NULL handling | Phase 2 | ⬜ |
| 7 | Apr 08 | Aggregate functions (`SUM`, `AVG`, `MIN`, `MAX`) | Phase 2 | ⬜ |
| 8 | Apr 09 | `GROUP BY`, `HAVING` | Phase 2 | ⬜ |
| 9 | Apr 10 | `CASE WHEN`, `COALESCE`, Date functions | Phase 2 | ⬜ |
| 10 | Apr 11 | 🏗️ **Project: Sales Performance Report** | Phase 2 | ⬜ |
| 11 | Apr 12 | `INNER JOIN` fundamentals | Phase 3 | ⬜ |
| 12 | Apr 13 | `LEFT JOIN`, `RIGHT JOIN`, Anti-join pattern | Phase 3 | ⬜ |
| 13 | Apr 14 | `FULL OUTER`, `CROSS JOIN`, Self joins | Phase 3 | ⬜ |
| 14 | Apr 15 | Subqueries, `EXISTS`, `UNION` | Phase 3 | ⬜ |
| 15 | Apr 16 | 🏗️ **Project: Customer Purchase Intelligence** | Phase 3 | ⬜ |
| 16 | Apr 17 | CTE fundamentals | Phase 4 | ⬜ |
| 17 | Apr 18 | Nested CTEs, Set operations | Phase 4 | ⬜ |
| 18 | Apr 19 | 🏗️ **Project: CTE Refactoring Lab** | Phase 4 | ⬜ |
| 19 | Apr 20 | `ROW_NUMBER`, `RANK` | Phase 5 | ⬜ |
| 20 | Apr 21 | `DENSE_RANK`, `NTILE` | Phase 5 | ⬜ |
| 21 | Apr 22 | `LAG`, `LEAD` | Phase 5 | ⬜ |
| 22 | Apr 23 | Running totals, Moving averages | Phase 5 | ⬜ |
| 23 | Apr 24 | Advanced window combinations | Phase 5 | ⬜ |
| 24 | Apr 25 | Combined window patterns | Phase 5 | ⬜ |
| 25 | Apr 26 | 🏗️ **Project: Ranking & Trend Analysis** | Phase 5 | ⬜ |
| 26 | Apr 27 | Cohort analysis | Phase 6 | ⬜ |
| 27 | Apr 28 | Funnel analysis | Phase 6 | ⬜ |
| 28 | Apr 29 | Retention, Customer segmentation | Phase 6 | ⬜ |
| 29 | Apr 30 | Revenue analytics, Period comparisons | Phase 6 | ⬜ |
| 30 | May 01 | 🏗️ **Project: Customer Lifecycle Analytics** | Phase 6 | ⬜ |
| 31 | May 02 | 🚀 Portfolio Project 1: E-Commerce Retention | Phase 7 | ⬜ |
| 32 | May 03 | Portfolio Project 1 *(continued)* | Phase 7 | ⬜ |
| 33 | May 04 | 🚀 Portfolio Project 2: Financial Metrics | Phase 7 | ⬜ |
| 34 | May 05 | Portfolio Project 2 *(continued)* | Phase 7 | ⬜ |
| 35 | May 06 | 🚀 Portfolio Project 3: Marketing Funnel | Phase 7 | ⬜ |
| 36 | May 07 | Timed SQL challenges | Practice | ⬜ |
| 37 | May 08 | Company-specific patterns (TCS / Amazon / Razorpay) | Practice | ⬜ |
| 38 | May 09 | MySQL / PostgreSQL dialect switching | Practice | ⬜ |
| 39 | May 10 | Explain-your-thinking drills | Practice | ⬜ |
| 40 | May 11 | Mock interview simulations | Practice | ⬜ |

> *Days 36–40 are interview preparation practiced on external platforms (StrataScratch, LeetCode, HackerRank). No repo artifacts for these days.*

</details>

---

## 🛠️ Tools & Environment

| Category | Tools |
|----------|-------|
| **Primary Database** | Google BigQuery (Sandbox — free tier) |
| **SQL Dialect** | Standard SQL (BigQuery), with MySQL / PostgreSQL awareness |
| **Primary Dataset** | `bigquery-public-data.thelook_ecommerce` |
| **Additional Datasets** | `austin_bikeshare`, `chicago_crime` |
| **Practice Platforms** | StrataScratch, LeetCode SQL 50, HackerRank |
| **Version Control** | Git + GitHub |
| **Learning Sources** | Coursera (UC Davis, IBM, Google, Michigan, Vanderbilt) |
| **Documentation** | Notion (daily log, query library, error log) |
| **AI Tools** | ChatGPT (dataset generation) · Claude (query debugging) · Gemini (BigQuery-native help) |

---

## 📖 Learning Approach

Every exercise in this repository follows a specific workflow:

1. **Business question first** — each query starts with a real stakeholder request
2. **Think before code** — plan the table, filters, columns, and sort before writing SQL
3. **Run, observe, document** — note what surprised me, what broke, what I learned
4. **Error-first learning** — I deliberately predict errors, run broken code, and debug

---

## 📬 Connect With Me

- **LinkedIn:** linkedin.com/in/viveksharma-data-analyst
- **Email:** viveksharma.data.analyst@gmail.com
- **Location:** Agra, India

**Open to Data Analyst roles and internship opportunities.**

---

<div align="center">

**Current Status:** 🟡 `Day 0 Complete — Sprint begins April 2, 2026`

</div>
