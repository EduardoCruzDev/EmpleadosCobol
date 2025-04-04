       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROG0120.
       AUTHOR.                    EDUARDO CRUZ.
       INSTALLATION.              CAPACITACION.
       DATE-WRITTEN.              22/03/25.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
       *>---------------------------------------------------------------*
       *>OBJETIVO: LEER E IMPRIMIR EL ARCHIVO DE LOS EMPREADOS          *
       *>          DE LA EMPRESA                                        *
       *>---------------------------------------------------------------*

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS ASSIGN TO UT-S-EMPLEADO.
           SELECT REPORTE ASSIGN TO UT-S-REPORTE.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLEADOS
          LABEL RECORDS ARE STANDARD
          RECORD CONTAINS 50 CHARACTERS
          BLOCK CONTAINS 0 RECORDS
          DATA RECORD IS REG-EMPLEADOS.
       01 REG-EMPLEADOS            PIC X(50).

       FD REPORTE
          LABEL RECORDS ARE STANDARD
          RECORD CONTAINS 50 CHARACTERS
          BLOCK CONTAINS 0 RECORDS
          DATA RECORD IS REG-REPORTE.
       01 REG-REPORTE              PIC X(50).

       WORKING-STORAGE SECTION.
       01 WS-AREAS-A-USAR.
          05 WS-REG-EMPLEADOS.
             10 WS-NUMERO-EMP      PIC 9(05).
             10 WS-NOMBRE-EMP      PIC X(30).
             10 WS-STATUS-EMP      PIC 9(01).
             10 WS-DEPTO-EMP       PIC 9(03).
             10 WS-PUESTO-EMP      PIC 9(02).
             10 WS-SALARIO-EMP     PIC 9(07)V99.
          05 WS-LEIDOS-EMP         PIC 9(05)    VALUE ZEROS.
          05 WS-IMPRESOS           PIC 9(05)    VALUE ZEROS.
          05 WS-TOTAL-SALARIOS     PIC 9(09)V99 VALUE ZEROS.

       01 WS-TITULO-1.
          05 FILLER                PIC X(28)    VALUE SPACES.
          05 WS-TIT-1              PIC X(23)
                                   VALUE "EMPLEADOS DE LA EMPRESA".
          05 FILLER                PIC X(29)    VALUE SPACES.

       01 WS-DETALLE.
          05 FILLER                PIC X(15)    VALUE SPACES.
          05 WS-DET-TODO           PIC X(50).
          05 FILLER                PIC X(15)    VALUE SPACES.

       01 WS-DETALLE-LEIDOS.
          05 FILLER                PIC X(01).
          05 FILLER                PIC X(29)
                                   VALUE "TOTAL DE EMPLEADOS LEIDOS:".
          05 WS-TOT-LEIDOS         PIC 9(05).
          05 FILLER                PIC X(45)    VALUE SPACES.
       01 WS-DETALLE-IMPRESOS.
          05 FILLER                PIC X(01).
          05 FILLER                PIC X(29)
                                   VALUE "TOTAL DE EMPLEADOS IMPRESOS:".
          05 WS-TOT-IMPRESOS       PIC 9(05).
          05 FILLER                PIC X(45)    VALUE SPACES.

       LINKAGE SECTION.
       01 LK-FECHA.
          05 FILLER                PIC X(02).
          05 LK-DIA                PIC 9(02).
          05 LK-MES                PIC 9(02).
          05 LK-ANIO               PIC 9(04).

       PROCEDURE DIVISION.
       010-INICIO.
           OPEN INPUT  EMPLEADOS
                OUTPUT REPORTE
           WRITE REG-REPORTE FROM WS-TITULO-1.
       020-LEE.
           READ EMPLEADOS INTO WS-REG-EMPLEADOS AT END
                GO TO 100-FIN.
           ADD 1 TO WS-LEIDOS-EMP
           MOVE WS-REG-EMPLEADOS TO WS-DET-TODO
           WRITE REG-REPORTE FROM WS-DETALLE
           ADD 1 TO WS-IMPRESOS
           GO TO 020-LEE.

       100-FIN.
           MOVE WS-LEIDOS-EMP TO WS-TOT-LEIDOS
           WRITE REG-REPORTE FROM WS-DETALLE-LEIDOS
           MOVE WS-IMPRESOS   TO WS-TOT-IMPRESOS
           WRITE REG-REPORTE FROM WS-DETALLE-IMPRESOS
           CLOSE EMPLEADOS
                 REPORTE
           GOBACK.
