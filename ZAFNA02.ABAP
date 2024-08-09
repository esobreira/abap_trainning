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
  P_VALOR2 TYPE P DECIMALS 2.

PARAMETERS: P_SOMA RADIOBUTTON GROUP RAD1,
  P_SUBT RADIOBUTTON GROUP RAD1,
  P_MULT RADIOBUTTON GROUP RAD1,
  P_DIVI RADIOBUTTON GROUP RAD1.

* Evento - Verificar tela de seleção.
AT SELECTION-SCREEN.

START-OF-SELECTION.

    IF P_SOMA EQ 'X'.
      V_RESULT = P_VALOR1 + P_VALOR2.
    ENDIF.

    IF P_SUBT EQ 'X'.
      V_RESULT = P_VALOR1 - P_VALOR2.
    ENDIF.

    IF P_DIVI EQ 'X'.
      V_RESULT = P_VALOR1 / P_VALOR2.
    ENDIF.

    IF P_MULT EQ 'X'.
      V_RESULT = P_VALOR1 * P_VALOR2.
    ENDIF.

  WRITE: / 'Valor 1: ', P_VALOR1,
  / 'Valor 2: ', P_VALOR2,
  / '------------------------',
  / 'Resultado: ', V_RESULT.

  MESSAGE ID 'ZTXMSGNA' TYPE 'I' NUMBER '003' WITH P_VALOR1 P_VALOR2 V_RESULT.