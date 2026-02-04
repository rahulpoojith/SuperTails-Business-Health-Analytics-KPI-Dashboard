
# Supertails – Business Health & KPI Analytics Dashboard

## 📌 Project Overview
This project focuses on analyzing the overall business health of **Supertails** by designing and evaluating key performance indicators (KPIs) across demand, operations, customer experience, and service adoption.  
The goal was to transform raw, multi-source data into **decision-ready insights** using a structured analytics workflow.

The analysis culminates in an **executive-level Power BI dashboard** supported by reproducible SQL logic and documented business insights.

---

## 🎯 Business Objectives
- Assess overall demand and revenue performance  
- Evaluate logistics and operational efficiency  
- Understand customer experience and support effectiveness  
- Measure adoption of value-added services and communication channels  

---

## 📊 Key KPIs Analyzed
- **Total Orders**
- **GMV (Gross Merchandise Value)**
- **AOV (Average Order Value)**
- **On-time Delivery %**
- **RTO % (Return to Origin)**
- **Repeat Purchase %**
- **Average CSAT**
- **Average Resolution Time**
- **Vet Adoption %**
- **WhatsApp O2C Connect %**

Each KPI is clearly defined and computed using reusable SQL views to ensure transparency and consistency.

---

## 🛠️ Tools & Technologies
- **Python** – Data cleaning, validation, and exploratory data analysis  
- **PostgreSQL** – KPI computation using SQL views and insight queries  
- **Power BI** – Executive KPI dashboard and visualization  
- **DBeaver** – Database management and SQL development  

---

## 🔄 Analytics Workflow
1. **Data Cleaning & Validation**
   - Cleaned and validated raw datasets using Python
   - Ensured consistent data types, missing value handling, and logical integrity

2. **KPI Computation (SQL)**
   - Designed reusable SQL views for all core KPIs
   - Created exploratory SQL queries for insight analysis without polluting production schemas

3. **Visualization**
   - Built an executive-level Power BI dashboard using KPI cards
   - Focused on clarity and decision-readiness due to aggregated data nature

4. **Business Interpretation**
   - Interpreted KPIs to highlight demand trends, operational gaps, and customer experience signals
   - Documented findings in a professional analytical report

---

## 📁 Repository Structure
```
SuperTails-Business-Health-Analytics-KPI-Dashboard/
│
├── SQL/
│   └── supertails_kpi_views_and_insights.sql
│
├── Python/
│   ├── Data_Cleaning.ipynb
│   └── EDA.ipynb
│
├── PowerBI/
│   └── Supertails_Business_Dashboard.pbix
│
├── Documentation/
│   └── Supertails_Assignment_Submission_Professional_Expanded.pdf
│
└── README.md
```

---

## 🧠 Key Insights (High Level)
- Strong demand reflected through Total Orders and GMV  
- Stable AOV indicating consistent customer spending behavior  
- RTO % highlights opportunities for operational optimization  
- On-time Delivery % directly impacts customer satisfaction  
- CSAT and Resolution Time provide visibility into support quality  
- Vet Adoption and WhatsApp Connect % show engagement with value-added services  

---

## 📌 Notes
- The dataset provided was **aggregated at KPI level**, hence the analysis focuses on executive KPIs rather than granular breakdowns.
- The project prioritizes **analytical clarity and business relevance** over unnecessary visual complexity.

---

## 👤 Author
**Rahul P**  
- LinkedIn: https://linkedin.com/in/rahulpoojith  
- GitHub: https://github.com/rahulpoojith  

---

## 📄 License
This project is created for educational and evaluation purposes as part of a Data Analyst assignment.
