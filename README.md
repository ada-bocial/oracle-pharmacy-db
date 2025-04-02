# Oracle Pharmacy DB

Witaj w projekcie **Oracle Pharmacy DB**! Jest to baza danych stworzona w Oracle SQL, która modeluje system sprzedaży i zarządzania produktami w sieci aptek. Umożliwia monitorowanie transferu produktów (leki, suplementy, kosmetyki), zarządzanie fakturami, klientami, pracownikami oraz aptekami, a także generowanie raportów przychodów za pomocą perspektyw.

## Funkcjonalności

- Tworzenie i zarządzanie tabelami dla aptek, klientów, pracowników, produktów i faktur.
- Monitorowanie stanów magazynowych produktów w aptekach.
- Rejestrowanie faktur z nagłówkami i szczegółami pozycji.
- Automatyczna aktualizacja wartości faktur i stanów magazynowych dzięki triggerowi.
- Generowanie 5 perspektyw analitycznych:
  - Dochód miesięczny.
  - Dochód per pracownik.
  - Dochód per apteka w podziale na lata.
  - Dochód per produkt.
  - Łączna wartość zakupów per klient.
- Procedury do ręcznego i losowego dodawania danych (np. klienci, produkty, faktury).
