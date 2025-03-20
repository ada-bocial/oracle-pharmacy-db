CREATE TABLE p_apteka (
    kod_pocztowy   VARCHAR2(6) NOT NULL,
    ulica          VARCHAR2(20) NOT NULL
);

ALTER TABLE p_apteka ADD CONSTRAINT p_apteka_pk PRIMARY KEY ( kod_pocztowy );

CREATE TABLE p_faktura_detale (
    nr_faktury        NUMBER(5) NOT NULL,
    pozycja_faktury   NUMBER(2) NOT NULL,
    kod_produktu      NUMBER(5) NOT NULL,
    ilosc             NUMBER(2) NOT NULL,
    cena_zakupu       NUMBER(7,2) NOT NULL
);

ALTER TABLE p_faktura_detale ADD CONSTRAINT p_faktura_detale_pk PRIMARY KEY ( pozycja_faktury,nr_faktury );

CREATE TABLE p_faktura_naglowek (
    nr_faktury         NUMBER(5) NOT NULL,
    nr_klienta         NUMBER(5) NOT NULL,
    nr_pracownika      NUMBER(5) NOT NULL,
    data_wystawienia   DATE NOT NULL,
    wartosc_faktury    NUMBER(7,2) NOT NULL
);

ALTER TABLE p_faktura_naglowek ADD CONSTRAINT p_faktura_naglowek_pk PRIMARY KEY ( nr_faktury );

CREATE TABLE p_klient (
    nr_klienta   NUMBER(5) NOT NULL,
    nazwisko     VARCHAR2(20),
    email        VARCHAR2(20) NOT NULL
);

ALTER TABLE p_klient ADD CONSTRAINT p_klient_pk PRIMARY KEY ( nr_klienta );

CREATE TABLE p_pracownik (
    nr_pracownika         NUMBER(5) NOT NULL,
    nazwisko              VARCHAR2(20) NOT NULL,
    kod_pocztowy_apteki   VARCHAR2(6) NOT NULL
);

ALTER TABLE p_pracownik ADD CONSTRAINT p_pracownik_pk PRIMARY KEY ( nr_pracownika );

CREATE TABLE p_produkt (
    kod_produktu      NUMBER(5) NOT NULL,
    typ_produktu      VARCHAR2(15) NOT NULL,
    nazwa             VARCHAR2(15) NOT NULL,
    cena_katalogowa   NUMBER(5,2) NOT NULL
);

ALTER TABLE p_produkt ADD CONSTRAINT p_produkt_pk PRIMARY KEY ( kod_produktu );

CREATE TABLE p_przechowuje (
    kod_produktu   NUMBER(5) NOT NULL,
    kod_apteki     VARCHAR2(6) NOT NULL,
    ilosc          NUMBER(4) NOT NULL
);

ALTER TABLE p_przechowuje ADD CONSTRAINT p_przechowuje_pk PRIMARY KEY ( kod_produktu,kod_apteki );

CREATE TABLE p_slownik_adresy (
    kod_pocztowy   VARCHAR2(6) NOT NULL,
    wojewodztwo    VARCHAR2(15) NOT NULL,
    miejscowosc    VARCHAR2(15) NOT NULL
);

ALTER TABLE p_slownik_adresy ADD CONSTRAINT slownik_adresy_pk PRIMARY KEY ( kod_pocztowy );

CREATE TABLE p_slownik_produkt (
    typ_produktu   VARCHAR2(15) NOT NULL,
    stawka_vat     NUMBER(4,2) NOT NULL
);

ALTER TABLE p_slownik_produkt ADD CONSTRAINT slownik_produkt_pk PRIMARY KEY ( typ_produktu );

ALTER TABLE p_apteka
    ADD CONSTRAINT p_apteka_slownik_fk FOREIGN KEY ( kod_pocztowy )
        REFERENCES p_slownik_adresy ( kod_pocztowy );

ALTER TABLE p_faktura_detale
    ADD CONSTRAINT p_detale_faktura_fk FOREIGN KEY ( nr_faktury )
        REFERENCES p_faktura_naglowek ( nr_faktury )
            ON DELETE CASCADE;

ALTER TABLE p_faktura_naglowek
    ADD CONSTRAINT p_faktura_klient_fk FOREIGN KEY ( nr_klienta )
        REFERENCES p_klient ( nr_klienta )
            ON DELETE CASCADE;

ALTER TABLE p_faktura_naglowek
    ADD CONSTRAINT p_faktura_pracownik_fk FOREIGN KEY ( nr_pracownika )
        REFERENCES p_pracownik ( nr_pracownika );

ALTER TABLE p_faktura_detale
    ADD CONSTRAINT p_faktura_produkt_fk FOREIGN KEY ( kod_produktu )
        REFERENCES p_produkt ( kod_produktu );

ALTER TABLE p_pracownik
    ADD CONSTRAINT p_pracownik_apteka_fk FOREIGN KEY ( kod_pocztowy_apteki )
        REFERENCES p_apteka ( kod_pocztowy );

ALTER TABLE p_przechowuje
    ADD CONSTRAINT p_przechowuje_apteka_fk FOREIGN KEY ( kod_apteki )
        REFERENCES p_apteka ( kod_pocztowy )
            ON DELETE CASCADE;

ALTER TABLE p_przechowuje
    ADD CONSTRAINT p_przechowuje_p_produkt_fk FOREIGN KEY ( kod_produktu )
        REFERENCES p_produkt ( kod_produktu );

ALTER TABLE p_produkt
    ADD CONSTRAINT p_slownik_produkt_fk FOREIGN KEY ( typ_produktu )
        REFERENCES p_slownik_produkt ( typ_produktu );