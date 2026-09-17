# Daikibo Factory Telemetry Analysis (SQL)

## Objective
Analyzed IoT sensor data from Daikibo's factories (Japan, Germany, China) to identify 
which machines, machine types, and factories have the highest rates of "unhealthy" 
status readings, supporting predictive maintenance decisions.

## Dataset
160,704 telemetry readings from 9 machine types across 4 factories, sourced from the 
Deloitte Australia Data Analytics Job Simulation (Forage).

## Business Questions Answered
- Which factory has the highest rate of unhealthy machine readings?
- Which machine type is least reliable?
- Does temperature correlate with unhealthy status?
- Which specific machines need urgent maintenance attention?

## SQL Concepts Used
GROUP BY, conditional aggregation (CASE WHEN), ROUND, ORDER BY, LIMIT, ANY_VALUE

## Key Insights
- Only 103 of 160,704 readings (0.06%) were unhealthy overall — machine failures are rare but not evenly distributed.
- Seiko (Japan) and Shenzhen (China) factories had the highest unhealthy rates (0.12% and 0.10%), roughly 4x higher than Berlin (0.005%).
- Average temperature was nearly identical for healthy (24.99°C) vs unhealthy (24.88°C) readings, ruling out temperature as a driver of failure.
- Almost all unhealthy readings trace back to just 2 specific machines (one LaserWelder in Seiko, one LaserCutter in Shenzhen), not a systemic issue with those machine types. This points to targeted maintenance rather than fleet-wide inspection.

## Files
- `queries.sql` — all SQL queries used
- `daikibo_telemetry_clean.csv` — dataset
- Screenshots of key query outputs

## Source
Data originally provided as JSON via the Deloitte Australia Data Analytics Job 
Simulation on Forage; converted to CSV and loaded into MySQL for this analysis.
