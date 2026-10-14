# 🌍 Climate Variability and Comparative Climatology Analysis (Poland, 1951–2024)

> A rigorous spatiotemporal statistical analysis, long-term Ordinary Least Squares (OLS) trend evaluation, and regional cross-station correlation modeling of monthly air temperatures and precipitation sums. This repository contrasts a lowland meteorological regime (**Wrocław-Strachowice**, 120 m a.s.l.) with an alpine/subpolar microclimate (**Śnieżka Peak**, 1602 m a.s.l.) using **R** (`tidyverse`, `ggplot2`).

[![R](https://img.shields.io/badge/Language-R-276DC3?style=for-the-badge&logo=r&logoColor=white)]()
[![Tidyverse](https://img.shields.io/badge/Ecosystem-Tidyverse_%7C_ggplot2-1A6954?style=for-the-badge)]()
[![Domain](https://img.shields.io/badge/Domain-Climatology_%26_Spatial_Statistics-orange?style=for-the-badge)]()

---

## 📌 Executive Summary & Project Objectives

Climate change manifests differently across diverse topographical gradients. This repository houses two comprehensive climatological studies based on multi-year synoptic observation data (1951–2024/2025) sourced from the Institute of Meteorology and Water Management (IMGW-PIB)[cite: 120, 137]:

1. **Project 1 (Śnieżka Peak Climatology):** Single-station deep dive into the harsh, subpolar-like environment of the highest peak in the Sudetes. It examines thermal stability, precipitation skewness, empirical distribution shapes via histograms, and decadal shifts[cite: 119].
2. **Project 2 (Lowland vs. Alpine Comparative Analysis):** A dual-station regional study linking the rain-shadow lowland station of **Wrocław-Strachowice** with the orographically forced alpine station of **Śnieżka**. It evaluates large-scale atmospheric synchronicity through parametric and non-parametric correlation matrices while highlighting regional trend divergences, notably the onset of spring *mountain droughts*[cite: 136, 149].

---

## 📂 Repository Structure

- 📄 **[`PDŚ_Projekt1_Zespół2.pdf`](./PDŚ_Projekt1_Zespół2.pdf)** — Full academic report for Project 1, complete with descriptive statistics tables, boxplot evaluations, and physical interpretations[cite: 119].
- 📄 **[`Projekt2_PDŚ_KB_MG_KD.pdf`](./Projekt2_PDŚ_KB_MG_KD.pdf)** — Full academic report for Project 2, featuring comparative analysis, scatter matrices, and formal statistical significance tests[cite: 136].
- 💻 **[`01_analiza_klimatyczna.R`](./01_analiza_klimatyczna.R)** — Production-ready R script for Project 1: data cleaning, descriptive metrics (`mean`, `median`, `IQR`, `sd`), multi-panel boxplots, seasonal histograms, and temporal linear trends[cite: 121, 122, 123].
- 💻 **[`02_wroclaw_sniezka_analiza.R`](./02_wroclaw_sniezka_analiza.R)** — Production-ready R script for Project 2: multi-station data wrangling, comparative boxplots, OLS regression models, scatter plots with confidence intervals, Pearson/Spearman correlation engines, and `cor.test` evaluations[cite: 138, 139, 140].
- 📊 **[`sumy_opadow.txt`](./sumy_opadow.txt)** — Raw monthly precipitation sums time-series dataset (1951–2025)[cite: 120, 153].
- 📈 **[`temperatury.txt`](./temperatury.txt)** — Raw mean monthly air temperatures time-series dataset (1951–2025)[cite: 120, 154].

---

## 🧮 Methodology & Statistical Workflow

The analytical pipeline was fully built within **RStudio** leveraging the tidyverse ecosystem:

1. **Data Wrangling & Formatting (`dplyr`, `readr`):** 
   - Automated ingestion of raw text datasets, isolation of temporal windows (1951–2024), and type-safe numerical conversion across monthly matrices.
2. **Exploratory Data Analysis & Descriptive Statistics:** 
   - Calculation of central tendency measures (mean, median), dispersion metrics (standard deviation, interquartile range), and non-parametric quantiles to assess thermal and precipitation variance.
3. **Distribution Analysis (Boxplots & Histograms):** 
   - Visualization of annual thermal cycles versus highly skewed, heavy-tailed precipitation distributions across representative seasonal months: **February (Winter)**, **May (Spring)**, **August (Summer)**, and **November (Autumn)**.
4. **Trend Detection & Significance Testing (OLS & `lm`):** 
   - Fitting Ordinary Least Squares linear regression models via `geom_smooth(method = "lm")` to calculate decadal rates of change ($\Delta$ per 10 years) and testing null hypotheses via Student's $t$-tests ($\alpha = 0.05$).
5. **Regional Correlation Modeling (Pearson & Spearman):** 
   - Evaluating large-scale atmospheric connectivity through parametric **Pearson's $r$** (linear dependence) and non-parametric **Spearman's $\rho$** (monotonic ranking) matrices backed by exact $p$-value significance tests (`cor.test`).

---

## 📈 Key Scientific Findings & Insights

- **Synchronous Warming Trend:** Both lowland and alpine stations exhibit statistically significant ($p < 0.05$) positive temperature trends across all seasons. The strongest warming occurs in **August** ($\approx +0.45^\circ\text{C}$ to $+0.50^\circ\text{C}$ per decade), translating to a cumulative temperature surge of over $3^\circ\text{C}$ over the 74-year study period.
- **The "Mountain Drought" Phenomenon (Precipitation Divergence):** While lowland precipitation in Wrocław remained largely stable, Śnieżka experienced a sharp, statistically significant decrease in spring precipitation during **May** ($\approx -10.5\text{ mm}$ per decade, $p < 0.001$). This highlights an alarming hydrological vulnerability: alpine ecosystems are drying out during critical vegetative windows despite rising temperatures.
- **Thermal vs. Precipitation Coupling:** 
  - *Temperature* is governed by macro-scale synoptic pressure systems, yielding near-perfect correlation coefficients ($r > 0.9$ in summer) between lowland and mountain stations.
  - *Precipitation* exhibits much higher stochasticity and local autonomy ($r \approx 0.5 - 0.6$), driven by localized convective storms and orographic lifting, proving that extreme precipitation events do not scale uniformly across topographic boundaries.

---

## 🛠️ Tech Stack & Libraries
- **Language:** `R` (version 4.x)
- **Data Manipulation:** `dplyr`, `readr`, `tidyverse`
- **Statistical Inference:** Base R (`stats`: `lm`, `cor`, `cor.test`), `broom`
- **Data Visualization:** `ggplot2` (layered grammar of graphics, custom themes, regression bands)

---

## 👥 Authors
- **Mateusz Grodzki**
- **Kamila Bodziony**
- **Kamila Dziewa**
