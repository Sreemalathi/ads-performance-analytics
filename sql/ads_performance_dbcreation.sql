USE campaign_analytics;

-- Drop the old table
DROP TABLE IF EXISTS global_ads_performance;

-- Create table without ad_id so it matches your CSV exactly
CREATE TABLE global_ads_performance (
    date DATE,
    platform VARCHAR(50),
    campaign_type VARCHAR(50),
    industry VARCHAR(50),
    country VARCHAR(50),
    impressions INT,
    clicks INT,
    ctr DECIMAL(8,4),
    cpc DECIMAL(10,2),
    ad_spend DECIMAL(12,2),
    conversions INT,
    cpa DECIMAL(10,2),
    revenue DECIMAL(12,2),
    roas DECIMAL(10,2)
);

ALTER TABLE global_ads_performance 
ADD COLUMN ad_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

SELECT 
    COUNT(*) AS total_rows,
    MIN(date) AS min_date,
    MAX(date) AS max_date
FROM global_ads_performance;