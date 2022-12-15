Some first code to analyse the Mängelmelder data

## Installation
1. Clone Repo
2. Initialize environment. This requires the package "renv" to be installed.
``` 
renv::init()
```

https://rstudio.github.io/renv/articles/renv.html


### Columns:

- ID = Kennung der Meldung
- Text = Vom Melder eingefügte Beschreibung des Problems
- Kategorie = Zuordnung des Mangels zu einer der Mängelmelder-Kategorien
- Automatisch ermittelte Adresse = Ort der Meldung
- Gruppe = Zugewiesene Zuständigkeit / Aufgabenbereich
- lon = Koordinatenangabe: Längengrad
- lat = Koordinatenangabe: Breitengrad
- Jahr
- Monat
- Gemeldet am = Datum des Meldungseingangs
- Freigegeben am = Datum der Bearbeitungsfreigabe
- Geprüft am = Datum der Prüfung des Problems vor Ort
- Freigabe in = Anzahl der Tage, die zwischen Meldung und Freigabe vergangen sind
- Stadtteil = Stadtteil, in welchem der Mangel zu finden ist

### Mögliche Fragen:
- Verteilung auf Stadtteile
- Zeit: Wann viele Meldungen? Wann viele Meldungen bestimmter Kategorien? Korrelation mit Events?
- In welchem Stadtteil gibt es die meisten Meldungen?
- Welcher Abteilung/Amt löst die meisten Mängel?
- Verteilung auf Kategorien
- Wie lange brauchen Meldungen durchschnittlich, bis sie fertig bearbeitet werden? -> Statusupdates nicht in Daten
  verfügbar
- Bessere Karte, auf der man Cluster erkennen kann.
- Korrelation Geschwindigkeit der Abarbeitung/Häufigkeit von Meldungen und Wahlen
- Korrelation Anzahl Meldungen mit Zuzug/Wegzug Stadtteil
- Mängel vorhersagen? z.B. bestimmte Menge an Regen -> Gulli verstopft /jemand beschwert sich über Pfütze?