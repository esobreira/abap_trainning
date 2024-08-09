*&---------------------------------------------------------------------*
*& Report  ZCOMPRAS0605_ALV
*&
*&---------------------------------------------------------------------*
*& Descrição: Relatório de Compras
*& Autor: Eberton Sobreira - 07/08/2024
*&---------------------------------------------------------------------*

REPORT zcompras0605_alv.

* Tabelas
TABLES ekko.

TYPES: BEGIN OF ty_ekko,
    ebeln TYPE ekko-ebeln,
    ebelp TYPE ekpo-ebelp,
    bsart TYPE ekko-bsart,
    bukrs TYPE ekko-bukrs,
    END OF ty_ekko.

DATA: wa_ekko TYPE ty_ekko,
        wa_fieldcat TYPE slis_fieldcat_alv.

DATA: ti_ekko TYPE TABLE OF ty_ekko,
      ti_fieldcat TYPE slis_t_fieldcat_alv.

DATA: ws_layout TYPE slis_layout_alv.

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

* Preenche o Fieldcat

  wa_fieldcat-col_pos = 1.
  wa_fieldcat-fieldname = 'EBELN'.
  wa_fieldcat-outputlen = 10.
  wa_fieldcat-tabname = 'TI_EKKO'.
  wa_fieldcat-seltext_l = 'Nº do documento de compras'.
  APPEND wa_fieldcat TO ti_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-col_pos = 2.
  wa_fieldcat-fieldname = 'ebelp'.
  wa_fieldcat-outputlen = 5.
  wa_fieldcat-tabname = 'TI_EKKO'.
  wa_fieldcat-seltext_l = 'Nº item do documento de compra'.
  APPEND wa_fieldcat TO ti_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-col_pos = 3.
  wa_fieldcat-fieldname = 'bsart'.
  wa_fieldcat-outputlen = 4.
  wa_fieldcat-tabname = 'TI_EKKO'.
  wa_fieldcat-seltext_l = 'Tipo de documento de compras'.
  APPEND wa_fieldcat TO ti_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-col_pos = 4.
  wa_fieldcat-fieldname = 'bukrs'.
  wa_fieldcat-outputlen = 4.
  wa_fieldcat-tabname = 'TI_EKKO'.
  wa_fieldcat-seltext_l = 'Empresa'.
  APPEND wa_fieldcat TO ti_fieldcat.
  CLEAR wa_fieldcat.

  ws_layout-colwidth_optimize = 'X'.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout   = ws_layout
      it_fieldcat = ti_fieldcat
    TABLES
      t_outtab    = ti_ekko.
  .