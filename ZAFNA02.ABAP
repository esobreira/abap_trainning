*&---------------------------------------------------------------------*
*& Report  ZAFNA02
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZAFNA02.

DATA: V_RESULT TYPE P DECIMALS 2.

PARAMETERS: P_VALOR1 TYPE P DECIMALS 2,
  P_OPERA TYPE C OBLIGATORY,
  P_VALOR2 TYPE P DECIMALS 2.

PARAMETERS: P_SOMA RADIOBUTTON GROUP RAD1,
  P_SUBT RADIOBUTTON GROUP RAD1,
  P_MULT RADIOBUTTON GROUP RAD1,
  P_DIVI RADIOBUTTON GROUP RAD1.

PARAMETERS: P_CHK AS CHECKBOX.

* Evento - Verificar tela de seleção.
AT SELECTION-SCREEN.

  IF P_OPERA NE '-' AND
    P_OPERA NE '+' AND
    P_OPERA NE '/' AND
    P_OPERA NE '*'.

    MESSAGE ID 'ZTXMSGNA' TYPE 'E' NUMBER '000'.

  ENDIF.

  IF P_OPERA EQ '/' AND P_VALOR2 IS INITIAL.

    MESSAGE ID 'ZTXMSGNA' TYPE 'E' NUMBER '001'.

  ENDIF.

START-OF-SELECTION.

  CASE P_OPERA.

    WHEN '+'.
      V_RESULT = P_VALOR1 + P_VALOR2.

    WHEN '-'.
      V_RESULT = P_VALOR1 - P_VALOR2.

    WHEN '/'.
      V_RESULT = P_VALOR1 / P_VALOR2.

    WHEN '*'.
      V_RESULT = P_VALOR1 * P_VALOR2.

  ENDCASE.

  WRITE: / 'Valor 1: ', P_VALOR1,
  / 'Operador: ', P_OPERA,
  / 'Valor 2: ', P_VALOR2,
  / '------------------------',
  / 'Resultado: ', V_RESULT.

  MESSAGE ID 'ZTXMSGNA' TYPE 'I' NUMBER '003' WITH P_VALOR1 P_OPERA P_VALOR2 V_RESULT.