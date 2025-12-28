# Geo Journal  

## Opis projektu
**Geo Journal** to prosta aplikacja mobilna napisana w **Flutter (Dart)**, umożliwiająca tworzenie wpisów (postów) powiązanych z aktualną lokalizacją użytkownika.

Aplikacja wykorzystuje:
- **natywną funkcję lokalizacji GPS** urządzenia
- **zewnętrzne API Nominatim (OpenStreetMap)** do pobierania nazwy miejsca na podstawie współrzędnych geograficznych

---

## Cel aplikacji
- Pobranie aktualnej lokalizacji użytkownika (latitude, longitude)
- Wyświetlenie nazwy miejsca na podstawie współrzędnych
- Dodawanie wpisów zawierających:
  - tytuł
  - opis
  - współrzędne GPS
  - nazwę miejsca
- Obsługa błędów i stanów pustych

---

## Funkcjonalności

### Natywna funkcja urządzenia
- **Lokalizacja GPS**
  - pobieranie aktualnych współrzędnych
  - obsługa zgody użytkownika
  - komunikat błędu przy braku uprawnień (Permission denied)

### Zewnętrzne API
- **Nominatim (OpenStreetMap) – Reverse Geocoding**
  - endpoint: `reverse`
  - na podstawie `latitude` i `longitude` zwracana jest wartość `display_name`
  - nazwa miejsca jest wyświetlana w poście

> W aplikacji nie ma backendu ani trwałej bazy danych – posty są przechowywane tymczasowo w trakcie działania aplikacji.

---

## Widoki aplikacji

### 1. Welcome screen
- ekran startowy aplikacji
- przejście do głównej części aplikacji
<img width="441" height="835" alt="image" src="https://github.com/user-attachments/assets/6a2e17a3-9e34-4190-b390-99cf896c8570" />


### 2. Location screen
- pobieranie aktualnej lokalizacji użytkownika
<img width="438" height="834" alt="image" src="https://github.com/user-attachments/assets/d3a745de-d47f-43fa-8d14-bc02fde122ed" />

- obsługa stanów:
  - brak zgody na GPS
  <img width="435" height="831" alt="image" src="https://github.com/user-attachments/assets/3bc1849f-7230-46d3-af4a-5fbae7821816" />
  <img width="485" height="924" alt="image" src="https://github.com/user-attachments/assets/7e6eac40-b9b8-4dc5-a7f2-58b68763cd51" />
  - poprawnie pobrana lokalizacja
  <img width="491" height="932" alt="image" src="https://github.com/user-attachments/assets/e71c674c-3e16-445b-afbf-b8307e7ca2e5" />

- przycisk przejścia dalej:
  - **nieaktywny (wyszarzony)** do momentu pobrania lokalizacji

### 3. Your posts
- lista dodanych wpisów
- wyświetlane informacje:
  - tytuł
  - opis
  - współrzędne GPS
  - nazwa miejsca (`display_name` z Nominatim)
  <img width="479" height="928" alt="image" src="https://github.com/user-attachments/assets/fac953ca-0ace-48bd-8aca-35e11f7c7c2e" />
  <img width="1287" height="653" alt="image" src="https://github.com/user-attachments/assets/841b13b1-9ba4-4604-842a-c9ad0c9f95ab" />

- pusty stan: *No posts yet*
<img width="483" height="937" alt="image" src="https://github.com/user-attachments/assets/62cf8a90-2e34-4616-82c9-6a9508fc847b" />

- możliwość dodania nowego posta
<img width="485" height="933" alt="image" src="https://github.com/user-attachments/assets/69e4e2d8-9560-4783-9b0a-61436955c545" />
<img width="480" height="927" alt="image" src="https://github.com/user-attachments/assets/5b876ea3-bccd-4d0b-b655-fb053b5e1ca3" />


---

## Dodawanie posta
- możliwe **dopiero po wcześniejszym pobraniu lokalizacji**
- formularz zawiera:
  - tytuł
  - opis
- po zapisaniu:
  - post pojawia się na liście
  - dane nie są zapisywane trwale (brak persistence)

---

## Obsługa UX i błędów
- brak zgody na lokalizację (Permission denied)
- pusty stan listy postów
- komunikaty informacyjne dla użytkownika
- przyciski aktywne / nieaktywne zależnie od stanu aplikacji

---

## Testowanie lokalne
Aplikacja była testowana na:
- **Android Emulator**
- Android API 36

Podczas testów zaprezentowano:
- pobranie lokalizacji GPS
- obsługę braku zgody na GPS
- dodanie posta
- pobranie nazwy miejsca z Nominatim API
- wyświetlenie wpisów na liście

---

## Technologie
- **Flutter**
- **Dart**
- **Android Emulator**
- **Geolocator (GPS)**
- **Nominatim API (OpenStreetMap)**

### Wymagania
- Flutter SDK (zainstalowany i skonfigurowany)
- Android Studio lub VS Code
- Android Emulator lub fizyczne urządzenie z Androidem
- Dostęp do internetu (wymagany do pobierania danych z Nominatim API)

### Kroki uruchomienia
git clone <adres-repozytorium>
cd geo_journal
flutter pub get
flutter run
