# Premier League 2020/21 — Player Performance Analysis

Analysis of 532 players (475 with 90+ minutes) from the English Premier League 2020/21 season.
Built to identify top performers, club dominance, and shooting efficiency using real match data.

## Tools & Technologies
- Python (pandas, matplotlib)
- SQL (SQLite)
- Jupyter Notebook
- DB Browser for SQLite

## Dataset
Source: [Kaggle — English Premier League 2020/21](https://www.kaggle.com/datasets/rajatrc1705/english-premier-league202021)

Contains: player stats including goals, assists, minutes played, pass accuracy, xG, xA, cards.

---

## Key Findings

### 1. Top Performers
| Player | Club | Goals | Assists | Performance Index |
|---|---|---|---|---|
| Harry Kane | Tottenham Hotspur | 23 | 14 | 126.51 |
| Mohamed Salah | Liverpool FC | 22 | 5 | 106.32 |
| Bruno Fernandes | Manchester United | 18 | 12 | 100.46 |
| Son Heung-min | Tottenham Hotspur | 17 | 10 | 95.67 |
| Patrick Bamford | Leeds United | 17 | 7 | 88.13 |

### 2. Club Dominance
- **Manchester City** ranked #1 in avg Performance Index (26.61) with 82 total goals
- **Sheffield United** ranked last — relegated that season, confirmed by data
- Strong correlation between total goals and total assists across all clubs

### 3. Performance by Position
| Position | Avg Goals/90 | Avg Assists/90 | Avg Pass Accuracy |
|---|---|---|---|
| FW | 0.278 | 0.144 | 74.5% |
| MF | 0.095 | 0.093 | 81.3% |
| DF | 0.041 | 0.040 | 80.9% |
| GK | 0.001 | 0.002 | 69.7% |

Players with combined positions (e.g. `FW,MF`) are grouped by the first listed position. Min. 90 minutes.

### 4. xG Analysis — Over- and Underperformers

> Note: xG in this dataset is per 90 minutes. Season total was calculated as:
> `xG_total = xG × Minutes / 90`

| Player | Goals | xG Total | Difference |
|---|---|---|---|
| Son Heung-min | 17 | 10.38 | +6.62 |
| Gareth Bale | 11 | 5.32 | +5.68 |
| Joe Willock | 8 | 3.59 | +4.41 |
| Kelechi Iheanacho | 12 | 7.78 | +4.22 |
| İlkay Gündoğan | 13 | 9.02 | +3.98 |
| Sadio Mané | 11 | 15.30 | -4.30 |
| Richarlison | 7 | 11.44 | -4.44 |
| Jamie Vardy | 15 | 19.56 | -4.56 |
| Neal Maupay | 8 | 12.84 | -4.84 |
| Timo Werner | 6 | 11.85 | -5.85 |

Forwards and midfielders only, min. 500 minutes.

- **Son Heung-min** was the biggest overperformer — scored 6.62 goals above xG
- **Timo Werner** was the biggest underperformer (-5.85) — known for missing chances at Chelsea, confirmed by data

---

## How to Run
1. Download dataset from Kaggle link above
2. Place `EPL_20_21.csv` in the `data/` folder
3. Open `football_analysis.ipynb` in VS Code or Jupyter
4. Run all cells