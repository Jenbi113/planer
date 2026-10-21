# Mein Schulplaner

Eine kleine, für Handy und PC passende Web-App für Hausübungen (HÜ), Tests, MÜs und Schularbeiten (SAs). Der Monatskalender zeigt die Einträge mit farbigen Punkten: HÜ rot, Test blau, MÜ violett und SA gelb. Tippe ein Datum an, um die Aufgaben dieses Tages zu sehen. Aufgaben lassen sich bearbeiten und mit Notizen versehen. Ohne Cloud-Verbindung werden Aufgaben nur im jeweiligen Browser gespeichert. Für echten Sync zwischen Geräten braucht es ein Supabase-Projekt und ein Konto.

## Sofort ausprobieren

Öffne `index.html` in einem aktuellen Browser. Aufgaben bleiben in diesem Browser gespeichert. Für den normalen lokalen Test braucht es weder Installation noch eine Domain.

## Gerätesync einrichten

1. Lege unter [supabase.com](https://supabase.com) ein kostenloses Projekt an.
2. Öffne **SQL Editor**, füge den Inhalt aus `supabase-setup.sql` ein und führe ihn aus. Die Tabelle ist durch Row Level Security so geschützt, dass jedes Konto nur seine eigenen Aufgaben lesen und ändern kann. Falls du das SQL schon früher ausgeführt hast, führe es nach dem App-Update erneut aus, damit die Notizenspalte ergänzt wird.
3. Öffne **Project Settings → API Keys** (oder den Projekt-Connect-Dialog) und kopiere die **Project URL** und den **Publishable Key**. In der App niemals einen Secret- oder `service_role`-Key eintragen.
4. Drücke in der App auf **Synchronisierung**, trage URL und Publishable Key ein, verbinde das Projekt und erstelle ein Konto. Melde dich danach auf jedem Gerät mit denselben Zugangsdaten an.
5. Wenn Supabase E-Mail-Bestätigung verlangt, bestätige die Nachricht vor der ersten Anmeldung.

Die App speichert URL und Publishable Key lokal im Browser. Supabase Auth speichert die Anmeldung; Aufgaben liegen in der Supabase-Datenbank.

## Kostenlos im Web veröffentlichen

Du brauchst keine eigene Domain. Lade diesen Ordner in ein GitHub-Repository hoch und aktiviere unter **Settings → Pages** die Veröffentlichung aus dem `main`-Branch und Ordner `/ (root)`. GitHub stellt dann eine Adresse unter `github.io` bereit. Diese Adresse kannst du auf PCs und am Handy öffnen. Auf unterstützten Geräten kann die Website über das Browsermenü zum Startbildschirm hinzugefügt werden.

Bei einer privaten Planung das GitHub-Repository privat halten; beachte, dass die veröffentlichte Website öffentlich erreichbar sein kann. Die Aufgaben bleiben trotzdem hinter Supabase-Anmeldung und Datenbankregeln geschützt.

## Enthalten

- Aufgaben mit Fach, Typ und Datum
- Monatskalender mit farbigen Markierungen und Tagesdetails
- Aufgaben bearbeiten und Notizen ergänzen
- Offen/erledigt-Status, Filter und Wochenübersicht
- Layout für kleine und große Bildschirme
- Installierbare PWA-Grundlage
- Lokaler Betrieb und optionale Supabase-Synchronisierung
