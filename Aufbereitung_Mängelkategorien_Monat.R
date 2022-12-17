library(readr)
library(datasets)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(panelr)
library(readxl)
library(writexl)

data <- read_csv("data/data.csv")

# Gruppierung der Mängel
data$Mängel <- NA

data$Mängel[which(data$Kategorie == "Pflanzenwuchs > Verkehrsbehindernder Heckenwuchs, Sträucher")] <- "Pflanzenwuchs"

data$Mängel[which(data$Kategorie == "Beleuchtung > Straßenlaternen defekt" |
                    data$Kategorie == "Straßen, Fahrrad & Verkehr > Ampel defekt"|
                    data$Kategorie == "Straßen, Fahrrad & Verkehr > Parkscheinautomat defekt"  )] <- "Technische Defekte"

data$Mängel[which(data$Kategorie == "Müll/Sauberkeit > Altglascontainer überfüllt" |
                    data$Kategorie == "Müll/Sauberkeit > Illegaler Müll"|
                    data$Kategorie == "Müll/Sauberkeit > Mülleimer überfüllt" |
                  data$Kategorie == "Müll/Sauberkeit > verschmutzte Straßen und Plätze"|
                    data$Kategorie == "Öffentliche Orte/Ufer > Freizeitgelände beschädigt / verunreinigt"|
                    data$Kategorie == "Öffentliche Orte/Ufer > Friedhof beschädigt / verunreinigt "|
                    data$Kategorie == "Öffentliche Orte/Ufer > Öffentliche WCs defekt / verunreinigt "|
                    data$Kategorie == "Öffentliche Orte/Ufer > Schulgelände schadhaft / verunreinigt "|
                    data$Kategorie == "Öffentliche Orte/Ufer > Seeufer verschmutzt "|
                    data$Kategorie == "Öffentliche Orte/Ufer > Spielplätze schadhaft / verunreinigt")] <- "Verschmutzung"

data$Mängel[which(data$Kategorie == "Straßen, Fahrrad & Verkehr > Fußwege schadhaft " |
                    data$Kategorie == "Straßen, Fahrrad & Verkehr > Radwege schadhaft"|
                    data$Kategorie == "Straßen, Fahrrad & Verkehr > Straßenschäden"|
                    data$Kategorie == "Straßen, Fahrrad & Verkehr > Gullideckel/ Kanal verstopft"   )] <- "Infrastrukturschäden"

data$Mängel[which(data$Kategorie == "Straßen, Fahrrad & Verkehr > Fahrrad gefunden" |
                    data$Kategorie == "Straßen, Fahrrad & Verkehr > Abgemeldete Fahrzeuge")] <- "Herrenlose Fahrzeuge"

data$Mängel <- as.factor(data$Mängel)

# Time-Variable (YYYY-MM)
data$month <- data$Monat
data$month[which(data$Monat < 10)]<-  paste("0", data$Monat, sep ="")[which(data$Monat < 10)]
data$date <- paste(data$Jahr, data$month, sep ="-")


# Teansformation zu Wide-Panel-Daten
data_table <- data.frame(table(data$date,data$Mängel))
data_table <- rename(data_table,
                     "id" = "Var2",
                     "wave"="Var1"
                     )
data_wide <- widen_panel(panel_data(data_table))

# Anpassung der Variablen-Namen, damit diese als Datums-Werte lesbar sind
names(data_wide) <- sub("Freq_", "", names(data_wide))


# Speichern
write_xlsx(data_wide,file.path(getwd(),"Mängel_Monat.xlsx"))



