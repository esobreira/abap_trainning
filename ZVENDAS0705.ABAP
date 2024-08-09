*&---------------------------------------------------------------------*
*& Report  ZVENDAS705
*&
*&---------------------------------------------------------------------*
*& Descrição: Relatório de Vendas
*& Autor: Eberton Sobreira - 07/08/2024
*&---------------------------------------------------------------------*

REPORT zvendas0705.

* Tabelas
TABLES: vbak,
      vbap.

* VBAK - Documento de vendas: dados de cabeçalho
* VBAP - Documento de vendas: dados de item

TYPES: BEGIN OF ty_vbak,
    vbeln TYPE vbak-vbeln,
    ernam TYPE vbak-ernam,
    augru TYPE vbak-augru,
    matnr TYPE vbap-matnr,
    arktx TYPE vbap-arktx,
    netwr TYPE vbap-netwr,
    END OF ty_vbak.

DATA wa_vbak TYPE ty_vbak.

DATA ti_vbak TYPE TABLE OF ty_vbak.

DATA: wx_vbeln(10) TYPE c,
    wx_ernam TYPE vbak-ernam,
    wx_augru  TYPE vbak-augru,
    wx_matnr TYPE vbap-matnr,
    wx_arktx TYPE vbap-arktx,
    wx_netwr TYPE vbap-netwr.

SELECT-OPTIONS s_vbeln FOR vbak-vbeln.

*Evento - Inicial
START-OF-SELECTION.

  SELECT k~vbeln
         k~ernam
         k~augru
         p~matnr
      p~arktx
        p~netwr
    FROM vbak AS k
    INNER JOIN vbap AS p
    ON k~vbeln = p~vbeln
    INTO TABLE ti_vbak
    WHERE k~vbeln IN s_vbeln.

WRITE: / TEXT-T01,  "Documento de vendas
TEXT-T02, "Nome do responsável
TEXT-T03, "Motivo da ordem
TEXT-T04, "Nº do material
TEXT-T05, "Texto breve do item da ordem do cliente
TEXT-T06. "Valor líquido do item da ordem na moeda do documento

  LOOP AT ti_vbak INTO wa_vbak.

    WRITE: / wa_vbak-vbeln,
      wa_vbak-ernam,
      wa_vbak-augru,
      wa_vbak-matnr,
      wa_vbak-arktx,
      wa_vbak-netwr.

  ENDLOOP.