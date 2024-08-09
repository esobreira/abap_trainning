*&---------------------------------------------------------------------*
*& Report  ZFUNCAO0805
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zfuncao0805.

PARAMETERS p_data TYPE sy-datum.

DATA v_dia_semana TYPE dtresr-weekday.

CALL FUNCTION 'DATE_TO_DAY'
  EXPORTING
    date    = p_data
  IMPORTING
    weekday = v_dia_semana.

WRITE: 'O dia da Semana é: ', v_dia_semana.