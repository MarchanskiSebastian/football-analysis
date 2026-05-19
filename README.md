# Premier League 2020/21 — Player Performance Analysis

Analysis of 532 players from the English Premier League 2020/21 season.
Built to identify top performers, club dominance, and shooting efficiency using real match data.

## Tools & Technologies
- Python (pandas, matplotlib, seaborn)
- SQL (SQLite)
- Jupyter Notebook
- DB Browser for SQLite

## Dataset
Source: [Kaggle — English Premier League 2020/21](https://www.kaggle.com/datasets/rajatrc1705/english-premier-league202021)

Contains: player stats including goals, assists, minutes played, pass accuracy, xG, xA, cards.

---

## Key Findings

### 1. Top Performers
| Player          | Club              | Goals | Assists | Performance Index |
| Harry Kane      | Tottenham Hotspur | 23    | 14      | 126.51            |
| Mohamed Salah   | Liverpool FC      | 22    | 5       | 106.32            |
| Bruno Fernandes | Manchester United | 18    | 12      | 100.46            |
| Son Heung-min   | Tottenham Hotspur | 17    | 10      | 95.67             |
| Patrick Bamford | Leeds United      | 17    | 7       | 88.13             |

### 2. Club Dominance
- Manchester City ranked #1 in avg Performance Index (26.61) with 82 total goals
- Sheffield United ranked last — relegated that season, confirmed by data
- Strong correlation between total goals and total assists across all clubs

### 3. Performance by Position
| Position | Avg Goals/90 | Avg Assists/90 | Avg Pass Accuracy |
|---|---|---|---|
| FW | 0.355 | 0.121 | 73.6% |
| MF | 0.120 | 0.119 | 79.9% |
| DF | 0.043 | 0.042 | 80.8% |
| GK | 0.001 | 0.001 | 69.7% |

### 4. xG Analysis — Who Overperformed?
- Harry Kane scored 22.4 goals above his xG — exceptional finisher
- Mohamed Salah overperformed by +21.39
- Players with low xG_diff had fewer minutes or were in poor form

## How to Run
1. Download dataset from Kaggle link above
2. Place CSV in `/data/` folder
3. Open `football_analysis.ipynb` in VS Code or Jupyter
4. Run all cells