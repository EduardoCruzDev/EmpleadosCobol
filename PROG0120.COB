       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROG0010.
       AUTHOR.                    EDUARDO CRUZ.
       INSTALLATION.              CAPACITACION.
       DATE-WRITEEN.              22/03/25.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
       *---------------------------------------------------------------*
       *OBJETIVO: LEER E IMPRIMIR EL ARCHIVO DE LOS EMPREADOS          *
       *          DE LA EMPRESA                                        *
       *---------------------------------------------------------------*

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
       01 WS-AREAS-A-USAR
          05 WS-REG-EMPLEADOS.
             10 WS-NUMERO-EMP      PIC 9(05).
