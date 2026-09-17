-- 1. Overall health snapshot
SELECT status, COUNT(*) AS total_readings
FROM telemetry
GROUP BY status;

-- 2. Which factory has the most unhealthy readings
SELECT factory, 
       COUNT(*) AS total_readings,
       SUM(CASE WHEN status = 'unhealthy' THEN 1 ELSE 0 END) AS unhealthy_count,
       ROUND(100.0 * SUM(CASE WHEN status = 'unhealthy' THEN 1 ELSE 0 END) / COUNT(*), 4) AS unhealthy_pct
FROM telemetry
GROUP BY factory
ORDER BY unhealthy_pct DESC;

-- 3. Which machine type fails most often
SELECT deviceType,
       COUNT(*) AS total_readings,
       SUM(CASE WHEN status = 'unhealthy' THEN 1 ELSE 0 END) AS unhealthy_count,
       ROUND(100.0 * SUM(CASE WHEN status = 'unhealthy' THEN 1 ELSE 0 END) / COUNT(*), 4) AS unhealthy_pct
FROM telemetry
GROUP BY deviceType
ORDER BY unhealthy_pct DESC;

-- 4. Average temperature: healthy vs unhealthy machines
SELECT status, ROUND(AVG(temperature), 2) AS avg_temp
FROM telemetry
GROUP BY status;

-- 5. Top 5 worst individual machines
SELECT deviceID, ANY_VALUE(deviceType) AS deviceType, ANY_VALUE(factory) AS factory,
       SUM(CASE WHEN status = 'unhealthy' THEN 1 ELSE 0 END) AS unhealthy_count
FROM telemetry
GROUP BY deviceID
ORDER BY unhealthy_count DESC
LIMIT 5;