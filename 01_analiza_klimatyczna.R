# =====================================================================
# PEŁNY KOD R: CHARAKTERYSTYKA I CZASOWA ZMIENNOŚĆ KLIMATU (ŚNIEŻKA 1951-2025)
# Autorzy: M. Grodzki, K. Bodziony, K. Dziewa
# =====================================================================

# 1. Załadowanie niezbędnych bibliotek
library(dplyr)
library(ggplot2)
library(readr)

# 2. Wczytanie danych surowych z plików tekstowych
sumy_opadow <- read_delim("sumy_opadow.txt", delim = "\t", show_col_types = FALSE)
Temperatury <- read_delim("temperatury.txt", delim = "\t", show_col_types = FALSE)

# Przygotowanie ramki danych dla opadów (wybór roku i 12 miesięcy, konwersja na liczby)
sumy_opadow <- sumy_opadow %>%  
  select(1:13) %>%
  slice(1:75) %>%
  mutate(across(2:13, as.numeric))

# Przygotowanie ramki danych dla temperatur
Temperatury <- Temperatury %>%  
  select(1:13) %>%
  slice(1:75) %>%
  mutate(across(2:13, as.numeric))

# Etykiety miesięcy do wykresów
etykiety_miesiecy <- c("Sty", "Lut", "Mar", "Kwi", "Maj", "Cze", 
                       "Lip", "Sie", "Wrz", "Paź", "Lis", "Gru")

# =====================================================================
# 3. OBLICZENIE STATYSTYK OPISOWYCH (Dla tabel w sprawozdaniu)
# =====================================================================
# Statystyki dla Temperatur
sapply(Temperatury[, 2:13], function(x) mean(x, na.rm = TRUE))
sapply(Temperatury[, 2:13], function(x) median(x, na.rm = TRUE))
sapply(Temperatury[, 2:13], function(x) quantile(x, 0.25, na.rm = TRUE))
sapply(Temperatury[, 2:13], function(x) quantile(x, 0.75, na.rm = TRUE))
sapply(Temperatury[, 2:13], function(x) min(x, na.rm = TRUE))
sapply(Temperatury[, 2:13], function(x) max(x, na.rm = TRUE))
sapply(Temperatury[, 2:13], function(x) sd(x, na.rm = TRUE))

# Statystyki dla Opadów
sapply(sumy_opadow[, 2:13], function(x) mean(x, na.rm = TRUE))
sapply(sumy_opadow[, 2:13], function(x) median(x, na.rm = TRUE))
sapply(sumy_opadow[, 2:13], function(x) quantile(x, 0.25, na.rm = TRUE))
sapply(sumy_opadow[, 2:13], function(x) quantile(x, 0.75, na.rm = TRUE))
sapply(sumy_opadow[, 2:13], function(x) min(x, na.rm = TRUE))
sapply(sumy_opadow[, 2:13], function(x) max(x, na.rm = TRUE))
sapply(sumy_opadow[, 2:13], function(x) sd(x, na.rm = TRUE))

# =====================================================================
# 4. WIZUALIZACJA OGÓLNEJ CHARAKTERYSTYKI (Wykresy Pudełkowe)
# =====================================================================
# Wykres pudełkowy dla opadów
boxplot(sumy_opadow[, 2:13],
        names = etykiety_miesiecy,
        border = "blue",
        col = "lightblue",
        main = "Rozkłady miesięcznych sum opadów (1951-2025)",
        xlab = "Miesiące", ylab = "Opady [mm]")

# Wykres pudełkowy dla temperatur
boxplot(Temperatury[, 2:13],
        names = etykiety_miesiecy,
        border = "blue",
        col = "lightblue",
        main = "Rozkłady miesięcznych temperatur (1951-2025)",
        xlab = "Miesiące", ylab = "Temperatura [°C]")

# =====================================================================
# 5. HISTOGRAMY DLA WYBRANYCH MIESIĘCY (Luty, Maj, Sierpień, Listopad)
# =====================================================================
# --- OPADY ---
p_opady_V <- ggplot(sumy_opadow, aes(V)) +
  geom_histogram(bins = 8, col = "red", fill = "lightblue", boundary = min(sumy_opadow$V, na.rm = TRUE)) +
  labs(title = "Średnie sumy opadów dla maja", x = "Suma opadów [mm]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

p_opady_VIII <- ggplot(sumy_opadow, aes(VIII)) +
  geom_histogram(bins = 10, col = "red", fill = "lightblue", boundary = min(sumy_opadow$VIII, na.rm = TRUE)) +
  labs(title = "Średnie sumy opadów dla sierpnia", x = "Suma opadów [mm]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

p_opady_XI <- ggplot(sumy_opadow, aes(XI)) +
  geom_histogram(bins = 8, col = "red", fill = "lightblue", boundary = min(sumy_opadow$XI, na.rm = TRUE)) +
  labs(title = "Średnie sumy opadów dla listopada", x = "Suma opadów [mm]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

p_opady_II <- ggplot(sumy_opadow, aes(II)) +
  geom_histogram(bins = 8, col = "red", fill = "lightblue", boundary = min(sumy_opadow$II, na.rm = TRUE)) +
  labs(title = "Średnie sumy opadów dla lutego", x = "Suma opadów [mm]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# --- TEMPERATURY ---
p_temp_V <- ggplot(Temperatury, aes(V)) +
  geom_histogram(bins = 8, col = "purple", fill = "lightpink", boundary = min(Temperatury$V, na.rm = TRUE)) +
  labs(title = "Średnie temperatury dla maja", x = "Temp [°C]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

p_temp_VIII <- ggplot(Temperatury, aes(VIII)) +
  geom_histogram(bins = 8, col = "purple", fill = "lightpink", boundary = min(Temperatury$VIII, na.rm = TRUE)) +
  labs(title = "Średnie temperatury dla sierpnia", x = "Temp [°C]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

p_temp_XI <- ggplot(Temperatury, aes(XI)) +
  geom_histogram(bins = 8, col = "purple", fill = "lightpink", boundary = min(Temperatury$XI, na.rm = TRUE)) +
  labs(title = "Średnie temperatury dla listopada", x = "Temp [°C]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

p_temp_II <- ggplot(Temperatury, aes(II)) +
  geom_histogram(bins = 8, col = "purple", fill = "lightpink", boundary = min(Temperatury$II, na.rm = TRUE)) +
  labs(title = "Średnie temperatury dla lutego", x = "Temp [°C]", y = "Liczba obserwacji") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# =====================================================================
# 6. ANALIZA TRENDÓW WIELOLETNICH (Wykresy liniowe + linia regresji LM)
# =====================================================================
# --- TRENDY OPADÓW ---
t_opady_V <- ggplot(sumy_opadow, aes(Rok, V)) +
  geom_line(color = "blue") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność sum opadów - Maj", x = "Rok badania", y = "Suma opadów [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

t_opady_VIII <- ggplot(sumy_opadow, aes(Rok, VIII)) +
  geom_line(color = "blue") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność sum opadów - Sierpień", x = "Rok badania", y = "Suma opadów [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

t_opady_XI <- ggplot(sumy_opadow, aes(Rok, XI)) +
  geom_line(color = "blue") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność sum opadów - Listopad", x = "Rok badania", y = "Suma opadów [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

t_opady_II <- ggplot(sumy_opadow, aes(Rok, II)) +
  geom_line(color = "blue") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność sum opadów - Luty", x = "Rok badania", y = "Suma opadów [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# --- TRENDY TEMPERATUR ---
t_temp_V <- ggplot(Temperatury, aes(Rok, V)) +
  geom_line(color = "orange") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność temperatury - Maj", x = "Rok badania", y = "Temperatura [°C]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

t_temp_VIII <- ggplot(Temperatury, aes(Rok, VIII)) +
  geom_line(color = "orange") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność temperatury - Sierpień", x = "Rok badania", y = "Temperatura [°C]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

t_temp_XI <- ggplot(Temperatury, aes(Rok, XI)) +
  geom_line(color = "orange") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność temperatury - Listopad", x = "Rok badania", y = "Temperatura [°C]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

t_temp_II <- ggplot(Temperatury, aes(Rok, II)) +
  geom_line(color = "orange") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność temperatury - Luty", x = "Rok badania", y = "Temperatura [°C]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# =====================================================================
# 7. ANALIZA ZMIENNOŚCI DEKADOWEJ
# =====================================================================
# Przypisanie lat do dekad dla opadów
sumy_opadow <- sumy_opadow %>%
  mutate(
    Dekada = case_when(
      Rok >= 1951 & Rok <= 1960 ~ "1951-1960",  
      Rok >= 1961 & Rok <= 1970 ~ "1961-1970",
      Rok >= 1971 & Rok <= 1980 ~ "1971-1980",
      Rok >= 1981 & Rok <= 1990 ~ "1981-1990",
      Rok >= 1991 & Rok <= 2000 ~ "1991-2000",
      Rok >= 2001 & Rok <= 2010 ~ "2001-2010",
      Rok >= 2011 & Rok <= 2020 ~ "2011-2020"
    )
  )

# Przypisanie lat do dekad dla temperatur
Temperatury <- Temperatury %>%
  mutate(
    Dekada = case_when(
      Rok >= 1951 & Rok <= 1960 ~ "1951-1960",  
      Rok >= 1961 & Rok <= 1970 ~ "1961-1970",
      Rok >= 1971 & Rok <= 1980 ~ "1971-1980",
      Rok >= 1981 & Rok <= 1990 ~ "1981-1990",
      Rok >= 1991 & Rok <= 2000 ~ "1991-2000",
      Rok >= 2001 & Rok <= 2010 ~ "2001-2010",
      Rok >= 2011 & Rok <= 2020 ~ "2011-2020"
    )
  )

# Wykresy dekadowe dla opadów (np. sierpień)
srednie_dek_opady_VIII <- sumy_opadow %>%
  filter(!is.na(Dekada)) %>%  
  group_by(Dekada) %>%   
  summarise(Srednia_VIII = mean(VIII, na.rm = TRUE))

dek_opady_plot <- ggplot(srednie_dek_opady_VIII, aes(Dekada, Srednia_VIII)) + 
  geom_point(size = 3, color = "blue") + geom_line(group = 1, color = "blue") +
  labs(title = "Średnia suma opadów w sierpniu dla dekad", x = "Dekada", y = "Suma opadów [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

print(dek_opady_plot)
