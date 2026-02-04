
/* =========================================================
   SUPERTAILS – KPI VIEWS & INSIGHTS SQL
   Author: Rahul P
   Purpose:
   - KPI views for dashboarding
   - Insight queries for business analysis
   ========================================================= */

/* =========================
   KPI VIEWS
   ========================= */

/* Topline KPIs */
CREATE OR REPLACE VIEW vw_topline_kpis AS
SELECT
    COUNT(*) AS total_orders,
    SUM(order_value) AS gmv,
    AVG(order_value) AS aov
FROM orders;

/* On-time Delivery % */
CREATE OR REPLACE VIEW vw_on_time_delivery AS
SELECT
    COUNT(CASE WHEN actual_delivery_date <= promised_delivery_date THEN 1 END)::FLOAT
    / COUNT(*) AS on_time_delivery_pct
FROM orders;

/* RTO % */
CREATE OR REPLACE VIEW vw_rto_rate AS
SELECT
    COUNT(CASE WHEN rto_flag = TRUE THEN 1 END)::FLOAT
    / COUNT(*) AS rto_pct
FROM supply_chain;

/* Repeat Purchase % */
CREATE OR REPLACE VIEW vw_repeat_purchase AS
SELECT
    COUNT(DISTINCT customer_id)::FLOAT
    / (SELECT COUNT(DISTINCT customer_id) FROM orders) AS repeat_purchase_pct
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

/* Average Delivery TAT */
CREATE OR REPLACE VIEW vw_avg_delivery_tat AS
SELECT
    AVG(EXTRACT(EPOCH FROM (actual_delivery_date - order_date)) / 3600)
    AS avg_delivery_tat_hours
FROM orders;

/* Support KPIs */
CREATE OR REPLACE VIEW vw_support_csat AS
SELECT AVG(csat_score) AS avg_csat
FROM support_tickets;

CREATE OR REPLACE VIEW vw_support_resolution_time AS
SELECT
    AVG(
        EXTRACT(EPOCH FROM (resolved_at::TIMESTAMP - created_at::TIMESTAMP)) / 3600
    ) AS avg_resolution_time_hours
FROM support_tickets;

CREATE OR REPLACE VIEW vw_support_escalation AS
SELECT
    COUNT(CASE WHEN resolution_status <> 'Resolved' THEN 1 END)::FLOAT
    / COUNT(*) AS escalation_rate
FROM support_tickets;

/* Vet Adoption */
CREATE OR REPLACE VIEW vw_vet_adoption AS
SELECT
    COUNT(DISTINCT user_id)::FLOAT
    / (SELECT COUNT(DISTINCT user_id) FROM vet_calls) AS vet_adoption_pct
FROM vet_calls;

/* WhatsApp O2C Connect % */
CREATE OR REPLACE VIEW vw_whatsapp_o2c AS
SELECT
    COUNT(CASE WHEN connection_status = 'Connected' THEN 1 END)::FLOAT
    / COUNT(*) AS whatsapp_o2c_connect_rate
FROM communication_logs;

/* =========================
   INSIGHT ANALYSIS QUERIES
   (Exploratory – NOT views)
   ========================= */

/* Insight 1: GMV by City */
SELECT
    city,
    COUNT(*) AS total_orders,
    SUM(order_value) AS gmv,
    AVG(order_value) AS aov
FROM orders
GROUP BY city
ORDER BY gmv DESC;

/* Insight 2: On-time Delivery by City */
SELECT
    city,
    AVG(
        CASE WHEN actual_delivery_date <= promised_delivery_date THEN 1 ELSE 0 END
    ) AS on_time_delivery_pct
FROM orders
GROUP BY city
ORDER BY on_time_delivery_pct ASC;

/* Insight 3: Support Load */
SELECT
    resolution_status,
    COUNT(*) AS ticket_count
FROM support_tickets
GROUP BY resolution_status;
