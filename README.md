# Insurance Claims Analysis

## Overview
This project analyzes motor insurance policy data to understand claim behaviour and key risk factors. It combines Python-based exploratory data analysis with an interactive Power BI dashboard.

## Dataset
- **Records:** 58,592 policies
- **Target:** `claim_status` (0 = no claim, 1 = claim)
- **Features:** Policy details, vehicle specs, safety features (ESC, airbags, NCAP rating), and customer attributes.
- **Source:** Public motor insurance claims dataset.

## Python Analysis
- Loaded and inspected the dataset (shape, info, missing values).
- Calculated overall claim rate and compared claim vs non-claim profiles.
- Analyzed claim rates by fuel type, segment, and safety ratings.
- Created visuals for claim distribution and claim rate by key categories.

_File:_ `python/analysis.ipynb`

## SQL (Optional Analysis)
- Aggregate queries for claim counts and claim rates by segment, region, and other attributes.
- Age and vehicle-age band analysis.
- High-level risk segmentation using grouped summaries.

_File:_ `sql/queries.sql`

## Power BI Dashboard
The dashboard highlights:
- KPIs for Total Policies, Total Claims, and Claim Rate.
- Claim rate by segment, fuel type, region, and safety rating.
- Comparison of policies vs claims across segments.
- Basic profile differences between claim and non-claim customers.
  
_Files:_
- `powerbi/insurance_dashboard.pbix`
- `images/dashboard_preview.png`

## Tech Stack
- Python (pandas, matplotlib, seaborn)
- Power BI
- SQL
