-- ========================================================
-- INSURANCE CLAIMS ANALYSIS - SQL QUERIES
-- ========================================================

-- Query 1: Total Claims by Type
-- Shows claim count and total amount for each claim type
SELECT 
    claim_type,
    COUNT(*) as total_claims,
    SUM(claim_amount) as total_amount,
    ROUND(AVG(claim_amount), 2) as avg_claim_amount
FROM insurance_claims
GROUP BY claim_type
ORDER BY total_amount DESC;

-- ========================================================

-- Query 2: Approval Rate by Region
-- Shows approval rate percentage for each region
SELECT 
    region,
    COUNT(*) as total_claims,
    SUM(CASE WHEN approved = 'Yes' THEN 1 ELSE 0 END) as approved_claims,
    SUM(CASE WHEN approved = 'No' THEN 1 ELSE 0 END) as rejected_claims,
    ROUND(SUM(CASE WHEN approved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as approval_rate_percent
FROM insurance_claims
GROUP BY region
ORDER BY approval_rate_percent DESC;

-- ========================================================

-- Query 3: Average Processing Days by Claim Type
-- Shows how long each claim type takes to process
SELECT 
    claim_type,
    COUNT(*) as total_claims,
    ROUND(AVG(processing_days), 2) as avg_processing_days,
    MAX(processing_days) as max_days,
    MIN(processing_days) as min_days
FROM insurance_claims
GROUP BY claim_type
ORDER BY avg_processing_days DESC;

-- ========================================================

-- Query 4: High Value Claims (> 8000)
-- Shows all claims above $8000
SELECT 
    claim_id,
    customer_id,
    claim_amount,
    claim_type,
    region,
    approved,
    processing_days
FROM insurance_claims
WHERE claim_amount > 8000
ORDER BY claim_amount DESC;

-- ========================================================

-- Query 5: Age Group Analysis
-- Segments customers by age and analyzes claim behavior
SELECT 
    CASE 
        WHEN age < 30 THEN '20-29'
        WHEN age >= 30 AND age < 40 THEN '30-39'
        WHEN age >= 40 AND age < 50 THEN '40-49'
        ELSE '50+'
    END as age_group,
    COUNT(*) as count,
    ROUND(AVG(claim_amount), 2) as avg_claim_amount,
    SUM(claim_amount) as total_amount,
    ROUND(SUM(CASE WHEN approved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as approval_rate
FROM insurance_claims
GROUP BY 
    CASE 
        WHEN age < 30 THEN '20-29'
        WHEN age >= 30 AND age < 40 THEN '30-39'
        WHEN age >= 40 AND age < 50 THEN '40-49'
        ELSE '50+'
    END
ORDER BY age_group;

-- ========================================================

-- Query 6: Top 5 Customers by Claim Amount
-- Shows which customers have claimed the most
SELECT 
    TOP 5 customer_id,
    COUNT(*) as claim_count,
    SUM(claim_amount) as total_claimed,
    ROUND(AVG(claim_amount), 2) as avg_claim
FROM insurance_claims
GROUP BY customer_id
ORDER BY total_claimed DESC;

-- ========================================================

-- Query 7: Claims by Vehicle Type
-- Analyzes auto claims by vehicle type
SELECT 
    vehicle_type,
    COUNT(*) as total_claims,
    SUM(claim_amount) as total_amount,
    ROUND(AVG(claim_amount), 2) as avg_amount,
    ROUND(SUM(CASE WHEN approved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as approval_rate
FROM insurance_claims
WHERE vehicle_type != 'N/A'
GROUP BY vehicle_type
ORDER BY total_amount DESC;

-- ========================================================

-- Query 8: Claims Summary Statistics
-- Overall project statistics
SELECT 
    COUNT(*) as total_claims,
    SUM(claim_amount) as total_amount_claimed,
    ROUND(AVG(claim_amount), 2) as average_claim,
    MAX(claim_amount) as highest_claim,
    MIN(claim_amount) as lowest_claim,
    ROUND(AVG(processing_days), 2) as avg_processing_days,
    ROUND(SUM(CASE WHEN approved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as overall_approval_rate
FROM insurance_claims;

-- ========================================================
