-- Which platform gives the best return on ad spend?

SELECT 
    platform,
    COUNT(*) AS total_campaigns,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / NULLIF(SUM(ad_spend), 0), 2) AS overall_roas,
    ROUND(SUM(ad_spend) / NULLIF(SUM(conversions), 0), 2) AS avg_cpa
FROM global_ads_performance
GROUP BY platform
ORDER BY overall_roas DESC;


SELECT 
    industry,
    platform,
    COUNT(*) AS total_campaigns,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / NULLIF(SUM(ad_spend), 0), 2) AS roas,
    ROUND(SUM(ad_spend) / NULLIF(SUM(conversions), 0), 2) AS cpa
FROM global_ads_performance
GROUP BY industry, platform
ORDER BY industry ASC, roas DESC;

-- Platform performance by Country
SELECT 
    country,
    platform,
    COUNT(*) AS total_campaigns,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / NULLIF(SUM(ad_spend), 0), 2) AS roas,
    ROUND(SUM(ad_spend) / NULLIF(SUM(conversions), 0), 2) AS cpa
FROM global_ads_performance
GROUP BY country, platform
ORDER BY country ASC, roas DESC;

-- Platform performce by Campaigntype
SELECT 
    campaign_type,
    platform,
    COUNT(*) AS total_campaigns,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / NULLIF(SUM(ad_spend), 0), 2) AS roas,
    ROUND(SUM(ad_spend) / NULLIF(SUM(conversions), 0), 2) AS cpa
FROM global_ads_performance
GROUP BY campaign_type, platform
ORDER BY campaign_type ASC, roas DESC;


SELECT 
    MONTH(date) AS month,
    platform,
    COUNT(*) AS total_campaigns,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / NULLIF(SUM(ad_spend), 0), 2) AS monthly_roas,
    ROUND(SUM(ad_spend) / NULLIF(SUM(conversions), 0), 2) AS monthly_cpa
FROM global_ads_performance
GROUP BY MONTH(date), platform
ORDER BY month ASC, platform ASC;