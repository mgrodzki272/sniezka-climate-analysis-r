# =====================================================================
# ANALIZA PORÓWNAWCZA: WROCŁAW-STRACHOWICE vs ŚNIEŻKA (1951-2024)
# Autorzy: M. Grodzki, K. Dziewa, K. Bodziony
# =====================================================================

library(tidyverse)

# Etykiety miesięcy do wykresów
etykiety_miesiecy <- c("Sty", "Lut", "Mar", "Kwi", "Maj", "Cze", 
                       "Lip", "Sie", "Wrz", "Paź", "Lis", "Gru")

# Przygotowanie danych dla stacji Wrocław
sumy_opadow_wro <- sumy_opadow_wro %>%  
  select(1:13) %>%
  slice(1:74) %>%
  mutate(across(2:13, as.numeric))

średnia_temp_wro <- średnia_temp_wro %>%  
  select(1:13) %>%
  slice(1:74) %>%
  mutate(across(2:13, as.numeric))

# Przygotowanie danych dla stacji Śnieżka (zgodnie z poprzednim projektem)
sumy_opadow <- sumy_opadow %>%  
  select(1:13) %>%
  slice(1:74) %>%
  mutate(across(2:13, as.numeric))

Temperatury <- Temperatury %>%  
  select(1:13) %>%
  slice(1:74) %>%
  mutate(across(2:13, as.numeric))


# =====================================================================
# 1. WYKRESY PUDEŁKOWE (BOXPLOTS) - PORÓWNANIE ROZKŁADÓW
# =====================================================================
par(mfrow = c(2, 2))

# Opady - Wrocław
boxplot(sumy_opadow_wro[, 2:13], names = etykiety_miesiecy, border = "blue", col = "lightblue",
        main = "Opady: Wrocław (1951-2024)", xlab = "Miesiące", ylab = "mm")

# Temperatura - Wrocław
boxplot(średnia_temp_wro[, 2:13], names = etykiety_miesiecy, border = "darkred", col = "lightpink",
        main = "Temperatura: Wrocław (1951-2024)", xlab = "Miesiące", ylab = "°C")

# Opady - Śnieżka
boxplot(sumy_opadow[, 2:13], names = etykiety_miesiecy, border = "blue", col = "lightblue",
        main = "Opady: Śnieżka (1951-2024)", xlab = "Miesiące", ylab = "mm")

# Temperatura - Śnieżka
boxplot(Temperatury[, 2:13], names = etykiety_miesiecy, border = "darkred", col = "lightpink",
        main = "Temperatura: Śnieżka (1951-2024)", xlab = "Miesiące", ylab = "°C")

par(mfrow = c(1, 1))


# =====================================================================
# 2. ANALIZA TRENDÓW WIELOLETNICH (Wykresy GGPlot z regresją liniową)
# =====================================================================

# --- PRZYKŁAD: TRENDY TEMPERATUR DLA WROCŁAWIA (Maj, Sierpień, Listopad, Luty) ---
p_wro_temp_V <- ggplot(średnia_temp_wro, aes(Rok, V)) +
  geom_line(color = "orange") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność temperatury - Maj (Wrocław)", x = "Rok badania", y = "Temperatura [°C]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

print(p_wro_temp_V)

# --- PRZYKŁAD: TRENDY OPADÓW DLA ŚNIEŻKI (Maj) ---
p_sniezka_opad_V <- ggplot(sumy_opadow, aes(Rok, V)) +
  geom_line(color = "blue") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Zmienność sum opadów - Maj (Śnieżka)", x = "Rok badania", y = "Suma opadów [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

print(p_sniezka_opad_V)


# =====================================================================
# 3. ANALIZA KORELACJI MIĘDZY STACJAMI (Wrocław vs Śnieżka)
# =====================================================================

# Przygotowanie ramek danych do korelacji (np. dla Maja - kolumna V)
opady_V <- select(sumy_opadow, opady_V = V)
opady_wro_V <- select(sumy_opadow_wro, opady_wro_V = V)
opady_s_wro_V <- data.frame(opady_V, opady_wro_V)

temp_V <- select(Temperatury, temp_V = V)
temp_wro_V <- select(średnia_temp_wro, temp_wro_V = V)
temp_s_wro_V <- data.frame(temp_V, temp_wro_V)

# Wykresy rozrzutu (Scatter plots) z prostą regresji dla Maja
ggplot(opady_s_wro_V, aes(opady_V, opady_wro_V)) +
  geom_point(color = "navy") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Korelacja opadów: Śnieżka vs Wrocław (Maj)", x = "Śnieżka [mm]", y = "Wrocław [mm]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

ggplot(temp_s_wro_V, aes(temp_V, temp_wro_V)) +
  geom_point(color = "darkorange") + geom_smooth(method = "lm", color = "red") +
  labs(title = "Korelacja temperatur: Śnieżka vs Wrocław (Maj)", x = "Śnieżka [°C]", y = "Wrocław [°C]") +
  theme_minimal() + theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Obliczenie współczynników korelacji (Pearson i Spearman) dla Maja
print("--- KORELACJA: MAJ ---")
print("Pearson - Opady:")
print(cor(sumy_opadow$V, sumy_opadow_wro$V, method = "pearson", use = "complete.obs"))
print("Pearson - Temperatury:")
print(cor(Temperatury$V, średnia_temp_wro$V, method = "pearson", use = "complete.obs"))

print("Spearman - Opady:")
print(cor(sumy_opadow$V, sumy_opadow_wro$V, method = "spearman", use = "complete.obs"))
print("Spearman - Temperatury:")
print(cor(Temperatury$V, średnia_temp_wro$V, method = "spearman", use = "complete.obs"))

# Testy istotności statystycznej korelacji Pearsona
print("--- TESTY ISTOTNOŚCI (COR.TEST) ---")
print(cor.test(sumy_opadow$V, sumy_opadow_wro$V, method = "pearson", use = "complete.obs"))
print(cor.test(Temperatury$V, średnia_temp_wro$V, method = "pearson", use = "complete.obs"))
