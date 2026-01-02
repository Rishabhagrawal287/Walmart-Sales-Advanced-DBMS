# Walmart Sales DBMS – SQL Server Data Warehouse Project

## 📌 Project Overview
This project implements an end-to-end **SQL Server Data Warehouse** for analyzing Walmart sales data across 45 stores.  
It follows **enterprise-grade data engineering practices**, including staging, ETL pipelines, dimensional modeling, fact tables, indexing, audit triggers, and performance optimization.

**🛠 Technologies Used**
- SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- BULK INSERT (ETL ingestion)
- Indexing & Query Optimization
- Dimensional Modeling (Fact & Dimension Tables)

---

## 🏗 System Architecture
**Flow:**  
CSV → Staging Table → Dimension Tables → Fact Table → Views & Analytics

**Core Concepts Used:**
- Staging-based ETL
- Dimensional Modeling (Star Schema)
- Fact & Dimension Tables
- Audit Triggers
- Stored Procedures & UDFs
- Indexing & Partitioning (documented)
- Cursor usage (educational)

---

## 📂 Project Folder Structure

Walmart-Sales-DBMS/
│
├── sql/
    ├── 01_Schema/ # Core OLTP schema
    ├── 02_Data_insertion/ # Sample transactional data
    ├── 03_Views/ # Analytical views
    ├── 04_Triggers_audit/ # Audit triggers
    ├── 05_Procedures_udf/ # Stored procedures & UDFs
    ├── 06_Cursor/ # Cursor example
    ├── 07_Staging_ETL/ # Staging & ETL scripts
    ├── 08_indexes_partitioning/ # Indexing + partition design
    ├── Bulk_Inserting/ # BULK INSERT logic
    ├── Dimension_table/ # Dim_Store
    ├── Fact_Table/ # Fact_WeeklySales
    ├── Indexes_Fact_Table/ # Fact table indexes
├── docs/
    ├── Walmart-Sales-Advanced-DBMS_README.pdf
    ├── Walmart_Sales_System_Architecture.png
├── datasets/
    ├── walmart-sales-dataset-of-45stores.csv
└── README.md


## ▶ Execution Order (IMPORTANT)

Execute scripts **strictly in this order**:

### 1️⃣ Create Database & Core Schema
01_Schema/

### 2️⃣ Insert Base Transactional Data
02_Data_insertion/

### 3️⃣ Create Views
03_Views/

### 4️⃣ Create Audit Triggers
04_Triggers_audit/

### 5️⃣ Create Procedures & Functions
05_Procedures_udf/

### 6️⃣ Cursor Example (Optional)
06_Cursor/

### 7️⃣ Create Staging Table
07_Staging_ETL/

### 8️⃣ Load CSV into Staging
Bulk_Inserting/

### 9️⃣ Create Dimension Tables
Dimension_table/

### 🔟 Create Fact Table
Fact_Table/

### 1️⃣1️⃣ Load Fact Table (ETL)
ETL scripts inside Fact_Table

### 1️⃣2️⃣ Create Indexes
Indexes_Fact_Table/
08_indexes_partitioning/

**🧩 ER Diagram (Logical Description)**

Products ───┐
            ├── Sales ─── Transactions
Customers ──┘
Stores ─────┘

Dim_Store ─── Fact_WeeklySales

## 🧪 Validation Queries
```sql
SELECT COUNT(*) FROM dbo.WalmartSales_Staging;
SELECT COUNT(*) FROM dbo.Dim_Store;
SELECT COUNT(*) FROM dbo.Fact_WeeklySales;


🔐 Audit Tracking

INSERT, UPDATE, DELETE operations on Sales
Logged automatically in Sales_Audit
Tracks:
    Old values
    New values
    User
    Timestamp


🚀 Skills Demonstrated

SQL Server
Data Warehousing
ETL Design
Indexing & Optimization
Audit & Compliance
Production-ready SQL scripting


📎 Notes

Partitioning scripts are documented for Enterprise Edition
Project runs fully on SQL Server Express / Standard
Designed for resume & interview discussions


👤 Author
Rishabh Agrawal

---

## 5️⃣ Add Files to Git

Run:
```bash
git add .
