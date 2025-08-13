# 📊 Online Sales Data Analysis (MySQL)

This project demonstrates how to **import, clean, and analyze** an online sales dataset using **MySQL**.  
It covers data loading, date formatting, grouping, filtering, and generating insights such as monthly revenue and order volumes.

---

## 📂 Dataset Description

| Column Name       | Description                               | Example Value     |
|-------------------|-------------------------------------------|-------------------|
| transaction_id    | Unique ID for each order                  | T1001             |
| order_date        | Date of transaction (formatted as DATE)   | 2024-01-01        |
| product_category  | Product category name                     | Electronics       |
| product_name      | Name of the product                       | Laptop            |
| units_sold        | Quantity sold                             | 3                 |
| unit_price        | Price per unit                            | 500               |
| total_revenue     | Total revenue for the order               | 1500              |
| region            | Region where the product was sold         | North             |
| payment_method    | Payment type                              | Credit Card       |

---

## 🛠️ Steps Performed

### 1️⃣ **Data Import**
- Imported CSV data into MySQL.
- Converted `order_date` from `DD/MM/YYYY` format to proper `DATE` type.

---

### 2️⃣ **Use `EXTRACT(MONTH FROM order_date)` for Month**
- **Purpose:** Extracts month from `order_date` to analyze monthly patterns.
- **Expected Output:** A list showing month numbers (1–12) for each record.

---

### 3️⃣ **Group Data by Year and Month**
- **Purpose:** Groups sales records by year and month for aggregation.
- **Expected Output:** Each row represents a unique `(year, month)` combination.

---

### 4️⃣ **Use `SUM()` for Revenue**
- **Purpose:** Calculates total revenue for each month.
- **Expected Output:** Table with `year`, `month`, and total monthly revenue.

---

### 5️⃣ **Use `COUNT(DISTINCT order_id)` for Volume**
- **Purpose:** Counts unique orders per month.
- **Expected Output:** Table showing number of distinct orders for each month.

---

### 6️⃣ **Use `ORDER BY` for Sorting**
- **Purpose:** Sorts results in chronological order or by highest revenue.
- **Expected Output:** Ordered list of months either ascending or descending.

---

### 7️⃣ **Limit Results for Specific Time Periods**
- **Purpose:** Filters sales data for a chosen date range (e.g., Mar–Jun 2024).
- **Expected Output:** Only months within that period, with corresponding revenue and volume.

---

## 📈 Insights from the Analysis
- 💰 **Revenue Trends:** Identified peak months for earnings.
- 📦 **Order Volumes:** Found months with highest order counts.
- 🗓️ **Seasonal Insights:** Filtered and compared specific time periods.

---

## 🚀 How to Run
1. Install MySQL Server on your machine.
2. Create a database and table as per dataset columns.
3. Run the `LOAD DATA` command to import CSV data.
4. Execute analysis queries to generate insights.

---

