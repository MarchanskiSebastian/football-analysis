-- Check how many players we have
SELECT COUNT(*) AS total_players
FROM EPL_20_21;

-- Top 10 players by Performance Index (min 500 minutes)
SELECT 
    Name,
    Club,
    Position,
    Goals,
    Assists,
    Mins,
    ROUND(
        Goals * 4 +
        Assists * 2 +
        Perc_Passes_Completed * 0.1 -
        Yellow_Cards * 0.5 -
        Red_Cards * 2
    , 2) AS Performance_Index
FROM EPL_20_21
WHERE Mins >= 500
ORDER BY Performance_Index DESC
LIMIT 10;

-- Average performance by club
SELECT 
    Club,
    COUNT(*) AS player_count,
    SUM(Goals) AS total_goals,
    SUM(Assists) AS total_assists,
    ROUND(AVG(Perc_Passes_Completed), 1) AS avg_pass_accuracy,
    ROUND(AVG(
        Goals * 4 +
        Assists * 2 +
        Perc_Passes_Completed * 0.1 -
        Yellow_Cards * 0.5 -
        Red_Cards * 2
    ), 2) AS avg_performance_index
FROM EPL_20_21
WHERE Mins >= 90
GROUP BY Club
ORDER BY avg_performance_index DESC;

-- Performance by position (primary position only)
SELECT 
    CASE 
        WHEN Position LIKE '%GK%' THEN 'GK'
        WHEN Position LIKE '%DF%' THEN 'DF'
        WHEN Position LIKE '%MF%' THEN 'MF'
        WHEN Position LIKE '%FW%' THEN 'FW'
        ELSE 'Other'
    END AS Position_Clean,
    COUNT(*) AS player_count,
    ROUND(AVG(CAST(Goals AS FLOAT) / Mins * 90), 3) AS avg_goals_per90,
    ROUND(AVG(CAST(Assists AS FLOAT) / Mins * 90), 3) AS avg_assists_per90,
    ROUND(AVG(Perc_Passes_Completed), 1) AS avg_pass_accuracy
FROM EPL_20_21
WHERE Mins >= 90
GROUP BY Position_Clean
ORDER BY avg_goals_per90 DESC;

-- Players overperforming vs xG (min 500 minutes, attackers only)
SELECT 
    Name,
    Club,
    Position,
    Goals,
    ROUND(xG, 2) AS expected_goals,
    ROUND(Goals - xG, 2) AS xG_diff
FROM EPL_20_21
WHERE Mins >= 500
    AND xG > 0
    AND (Position LIKE '%FW%' OR Position LIKE '%MF%')
ORDER BY xG_diff DESC
LIMIT 10;