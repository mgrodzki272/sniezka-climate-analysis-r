# Climate Variability Analysis for Śnieżka Peak (1951–2025)

> Comprehensive statistical analysis and trend visualization of monthly air temperatures and precipitation sums for the synoptic meteorological station on **Śnieżka Peak (1602 m a.s.l., ID: 350150510)**, implemented in **R** (`tidyverse`, `ggplot2`).

[![R](https://img.shields.io/badge/Language-R-276DC3?style=for-the-badge&logo=r&logoColor=white)]()
[![Tidyverse](https://img.shields.io/badge/Ekosystem-Tidyverse_%7C_ggplot2-1A6954?style=for-the-badge)]()
[![Climatology](https://img.shields.io/badge/Domain-Climatology_%26_Statistics-orange?style=for-the-badge)]()

---

## 📌 Project Overview
This project focuses on analyzing 75 years of meteorological data from the highest peak of the Karkonosze Mountains (Sudetes). Due to its elevation and exposure, Śnieżka exhibits subpolar climatic characteristics despite its temperate latitude. 

The analysis investigates:
* Long-term warming trends across different seasons.
* Precipitation regimes, seasonal asymmetry, and extreme weather events.
* Statistical distributions (boxplots, histograms) and decadal variability.

---

## 📂 Repository Structure

* 📄 **[`PDŚ_Projekt1_Zespół2.pdf`](./PDŚ_Projekt1_Zespół2.pdf)** — Full academic report detailing methodology, descriptive statistics tables, and climatological interpretations.
* 💻 **[`01_analiza_klimatyczna.R`](./01_analiza_klimatyczna.R)** — Clean R script for data ingestion, descriptive statistics (`mean`, `sd`, `quantile`), boxplots, histograms, and linear regression trends (`geom_smooth`).
* 📊 **[`sumy_opadow.txt`](./sumy_opadow.txt)** — Monthly precipitation sums dataset (1951–2025) sourced from IMGW-PIB[cite: 120, 153].
* 📈 **[`temperatury.txt`](./temperatury.txt)** — Mean monthly air temperatures dataset (1951–2025) sourced from IMGW-PIB[cite: 120, 154].

---

## 🛠️ Key Methods & R Libraries
* **Data Manipulation:** `dplyr`, `readr` (tidyverse ecosystem for efficient data wrangling and type casting).
* **Statistical Modeling:** Ordinary Least Squares (OLS) linear regression models (`lm`) embedded within `ggplot2` to determine statistical significance of climate trends.
* **Visualization:** Base R graphical devices for multi-panel boxplots and `ggplot2` for high-density histograms and time-series trend lines.

---

## 👥 Authors
* **Mateusz Grodzki**
* **Kamila Bodziony**
* **Kamila Dziewa**
