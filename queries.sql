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

-- Performance by position (first listed position, e.g. "FW,MF" -> FW)
-- Per-90 values rounded to 2 decimals before averaging, same as the notebook
SELECT 
    CASE 
        WHEN instr(Position, ',') > 0 THEN substr(Position, 1, instr(Position, ',') - 1)
        ELSE Position
    END AS Position_Clean,
    COUNT(*) AS player_count,
    ROUND(AVG(ROUND(CAST(Goals AS FLOAT) / Mins * 90, 2)), 3) AS avg_goals_per90,
    ROUND(AVG(ROUND(CAST(Assists AS FLOAT) / Mins * 90, 2)), 3) AS avg_assists_per90,
    ROUND(AVG(Perc_Passes_Completed), 1) AS avg_pass_accuracy
FROM EPL_20_21
WHERE Mins >= 90
GROUP BY Position_Clean
ORDER BY avg_goals_per90 DESC;

-- Players overperforming vs xG (min 500 minutes, attackers only)
-- Note: xG in dataset is per 90 minutes, so we calculate season total first
SELECT 
    Name,
    Club,
    Position,
    Goals,
    Mins,
    ROUND(xG * Mins / 90, 2) AS xG_total,
    ROUND(Goals - (xG * Mins / 90), 2) AS xG_diff
FROM EPL_20_21
WHERE Mins >= 500
    AND xG > 0
    AND (Position LIKE '%FW%' OR Position LIKE '%MF%')
ORDER BY xG_diff DESC
LIMIT 10;

-- Players underperforming vs xG (same filters)
SELECT 
    Name,
    Club,
    Position,
    Goals,
    Mins,
    ROUND(xG * Mins / 90, 2) AS xG_total,
    ROUND(Goals - (xG * Mins / 90), 2) AS xG_diff
FROM EPL_20_21
WHERE Mins >= 500
    AND xG > 0
    AND (Position LIKE '%FW%' OR Position LIKE '%MF%')
ORDER BY xG_diff ASC
LIMIT 10;
