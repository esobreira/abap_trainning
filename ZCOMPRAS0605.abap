*&---------------------------------------------------------------------*
*& Report  ZCOMPRAS0605
*&
*&---------------------------------------------------------------------*
*& Descrição: Relatório de Compras
*& Autor: Eberton Sobreira - 07/08/2024
*&---------------------------------------------------------------------*

REPORT zcompras0605.

* Tabelas
TABLES ekko.

TYPES: BEGIN OF ty_ekko,
    ebeln TYPE ekko-ebeln,
    ebelp TYPE ekpo-ebelp,
    bsart TYPE ekko-bsart,
    bukrs TYPE ekko-bukrs,
    END OF ty_ekko.

DATA wa_ekko TYPE ty_ekko.

DATA ti_ekko TYPE TABLE OF ty_ekko.

SELECT-OPTIONS s_ebeln FOR ekko-ebeln.

*Evento - Inicial
START-OF-SELECTION.

  SELECT k~ebeln
         p~ebelp
         k~bsart
         k~bukrs
    FROM ekko AS k
    INNER JOIN ekpo AS p
    ON k~ebeln = p~ebeln
    INTO TABLE ti_ekko
    WHERE k~ebeln IN s_ebeln.

  LOOP AT ti_ekko INTO wa_ekko.

    WRITE: / wa_ekko-ebeln,
      wa_ekko-ebeln,
      wa_ekko-ebelp,
      wa_ekko-bsart,
      wa_ekko-bukrs.

  ENDLOOP.