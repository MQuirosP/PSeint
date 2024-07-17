Funcion nombreEscolaridad = ObtieneNombreEscolaridad(idNivel)
	Definir nombreEscolaridad Como Caracter;
	Segun idNivel Hacer
		1: nombreEscolaridad <- "Primaria         ";
		2: nombreEscolaridad <- "Secundaria       ";
		3: nombreEscolaridad <- "Técnico          ";
		4: nombreEscolaridad <- "Bachiller Univ.  ";
		5: nombreEscolaridad <- "Licenciado       ";
		6: nombreEscolaridad <- "Maestría         ";
		7: nombreEscolaridad <- "Doctorado        ";
		De Otro Modo:
			nombreEscolaridad <- "Desconocido";
	FinSegun
FinFuncion

Funcion nombreMes = ObtieneNombreMes(idMes)
	Definir nombreMes Como Caracter;
	Segun idMes Hacer
		1: nombreMes <- "ENE";
		2: nombreMes <- "FEB";
		3: nombreMes <- "MAR";
		4: nombreMes <- "ABR";
		5: nombreMes <- "MAY";
		6: nombreMes <- "JUN";
		7: nombreMes <- "JUL";
		8: nombreMes <- "AGO";
		9: nombreMes <- "SEP";
		10: nombreMes <- "OCT";
		11: nombreMes <- "NOV";
		12: nombreMes <- "DIC";
		De Otro Modo:
			nombreMes <- "Desconocido";
	FinSegun
FinFuncion

Funcion promedio = CalcularPromedio(sumaInversiones, sumaInversionistas)
	Definir promedio Como Real;
    
    Si sumaInversionistas > 0 Entonces
        promedio = sumaInversiones / sumaInversionistas;
    Sino
        promedio = 0;  // O el valor que desees manejar en caso de no haber inversionistas
    FinSi
FinFuncion

SubProceso Inicializa_matrices(CI, CM, matriz_inversiones, matriz_inversionistas)
	Definir i, j Como Entero;
	Para i = 0 Hasta CI-1 Con Paso 1 Hacer
		Para j = 0 Hasta CM-1 Con Paso 1 Hacer
			matriz_inversiones[i, j] = Aleatorio(1, 800);
			matriz_inversionistas[i, j] = Aleatorio(1, 30);
		FinPara
	FinPara
FinSubProceso

SubProceso Presenta_datos_matrices(nombreMatriz, CI, CM, matriz)
	Definir i, j Como Entero;
	Escribir "Datos de la matriz ", nombreMatriz, ":";
	// titulos columnas (meses)
	Escribir Sin Saltar "                  ";
	Para j = 0 Hasta CM-1 Con Paso 1 Hacer
		Escribir Sin Saltar ObtieneNombreMes(j+1), " ";
	FinPara
	Escribir "";
	// datos en filas
	Para i = 0 Hasta CI-1 Con Paso 1 Hacer
		Escribir Sin Saltar ObtieneNombreEscolaridad(i+1), " ";
		Para j = 0 Hasta CM-1 Con Paso 1 Hacer
			Si matriz[i, j] < 10 Entonces
				Escribir Sin Saltar matriz[i, j], "   ";
			SiNo
				Si matriz[i, j] < 100 Entonces
					Escribir Sin Saltar matriz[i, j], "  ";
				SiNo
					Escribir Sin Saltar matriz[i, j], " ";
				FinSi
			FinSi
		FinPara
		Escribir "";
	FinPara
FinSubProceso

SubProceso Presenta_inversiones_acumuladas_por_mes_por_escolaridad(CI, CM, matriz_inversiones)
	Definir i, j Como Entero;
	Escribir "Inversiones acumuladas por mes por escolaridad:";
	// titulos columnas (meses)
	Escribir Sin Saltar "                  ";
	Para j = 0 Hasta CM-1 Con Paso 1 Hacer
		Escribir Sin Saltar ObtieneNombreMes(j+1), " ";
	FinPara
	Escribir "";
	// inversiones por escolaridad y por mes
	Para i = 0 Hasta CI-1 Hacer
		Escribir Sin Saltar ObtieneNombreEscolaridad(i+1), " ";
		Para j = 0 Hasta CM-1 Hacer
			Si matriz_inversiones[i, j] < 10 Entonces
				Escribir Sin Saltar matriz_inversiones[i, j], "   ";
			SiNo
				Si matriz_inversiones[i, j] < 100 Entonces
					Escribir Sin Saltar matriz_inversiones[i, j], "  ";
				SiNo
					Escribir Sin Saltar matriz_inversiones[i, j], " ";
				FinSi
			FinSi
		FinPara
		Escribir "";
	FinPara
FinSubProceso

SubProceso Presenta_inversionistas_por_escolaridad_por_mes(CI, CM, matriz_inversionistas)
	Definir i, j Como Entero;
	Escribir "Cantidad de inversionistas por escolaridad por mes:";
	// titulos columnas (meses)
	Escribir Sin Saltar "                  ";
	Para j = 0 Hasta CM-1 Con Paso 1 Hacer
		Escribir Sin Saltar ObtieneNombreMes(j+1), " ";
	FinPara
	Escribir "";
	// inversionistas por escolaridad y por mes
	Para i = 0 Hasta CI-1 Hacer
		Escribir Sin Saltar ObtieneNombreEscolaridad(i+1), " ";
		Para j = 0 Hasta CM-1 Hacer
			si matriz_inversionistas[i,j] < 10 Entonces
				Escribir Sin Saltar matriz_inversionistas[i, j], "   ";
			SiNo
				Escribir Sin Saltar matriz_inversionistas[i, j], "  ";
			FinSi
			
		FinPara
		Escribir "";
	FinPara
FinSubProceso

SubProceso Presenta_reporte_inversiones_acumuladas_por_escolaridad(CI, CM, matriz_inversiones, matriz_inversionistas)
	Definir i, j, sumaInversionesEscolaridad, sumaInversionistasEscolaridad Como Entero;
	Definir promedioInversionesEscolaridad Como Real;
	Dimension sumaInversionesEscolaridad[CI];
	Dimension sumaInversionistasEscolaridad[CI];
	Dimension promedioInversionesEscolaridad[CI];
	
	Para i = 0 Hasta CI-1 Hacer
		sumaInversionesEscolaridad[i] = 0;
		sumaInversionistasEscolaridad[i] = 0;
		Para j = 0 Hasta CM-1 Hacer
			sumaInversionesEscolaridad[i] = sumaInversionesEscolaridad[i] + matriz_inversiones[i, j];
			sumaInversionistasEscolaridad[i] = sumaInversionistasEscolaridad[i] + matriz_inversionistas[i, j];
		FinPara
		promedioInversionesEscolaridad[i] = CalcularPromedio(sumaInversionesEscolaridad[i], sumaInversionistasEscolaridad[i]);
	FinPara
	
	Escribir "Reporte de Inversiones acumuladas por Escolaridad:";
	Escribir "Escolaridad         Monto Inversiones         Cantidad Inversionistas         Promedio";
	Para i = 0 Hasta CI-1 Hacer
		Escribir ObtieneNombreEscolaridad(i+1), "          ", sumaInversionesEscolaridad[i], "                    ", sumaInversionistasEscolaridad[i], "                        ",  promedioInversionesEscolaridad[i];
	FinPara
FinSubProceso

SubProceso Presenta_datos_meses(CI, CM, matriz_inversiones, matriz_inversionistas)
	Definir i, j, sumaInversionesMes, sumaInversionistasMes Como Entero;
	Definir promedioInversionesMes Como Real;
	Dimension sumaInversionesMes[CM];
	Dimension sumaInversionistasMes[CM];
	Dimension promedioInversionesMes[CM];
	
	// Calcular sumas por mes
	Para j = 0 Hasta CM-1 Hacer
		sumaInversionesMes[j] = 0;
		sumaInversionistasMes[j] = 0;
		Para i = 0 Hasta CI-1 Hacer
			sumaInversionesMes[j] = sumaInversionesMes[j] + matriz_inversiones[i, j];
			sumaInversionistasMes[j] = sumaInversionistasMes[j] + matriz_inversionistas[i, j];
		FinPara
		promedioInversionesMes[j] = CalcularPromedio(sumaInversionesMes[j], sumaInversionistasMes[j]);
	FinPara
	
	// reporte de inversiones por mes
	Escribir "Reporte de Inversiones por Mes:";
	
	// reporte de inversiones acumuladas por mes procesado
	Escribir "Reporte de Inversiones Acumuladas por Mes Procesado:";
	Escribir "Mes Procesado    Monto Inversiones    Cantidad Inversionistas    Promedio";
	Para j = 0 Hasta CM-1 Hacer
		Si sumaInversionistasMes[j] < 100 Entonces
			Escribir ObtieneNombreMes(j+1), "                   ", sumaInversionesMes[j], "                  ", sumaInversionistasMes[j], "                   ", promedioInversionesMes[j];
		SiNo
			Escribir ObtieneNombreMes(j+1), "                   ", sumaInversionesMes[j], "                  ", sumaInversionistasMes[j], "                  ", promedioInversionesMes[j];
		FinSi
	FinPara
FinSubProceso

Proceso InversionesTotales
    Definir CI, CM Como Entero;
    Definir inicializado Como Logico;
    Definir matriz_inversiones, matriz_inversionistas Como Entero;
    Definir opcionTexto como Cadena;
    inicializado = Falso;
	
    Definir digitosPermitidos Como Caracteres;
    Definir esNumero Como Logico;
    Definir i, j Como Entero;
	
    digitosPermitidos = "12345"; // inicializo cadena con los digitos permitidos a evaluar
	
    Repetir
        Escribir "Digite cantidad de Tipos de escolaridad que se van a procesar (1-7): " Sin Saltar;
        Leer CI;
    Hasta Que CI > 0 Y CI <= 7;
	
    Repetir
        Escribir "Digite cantidad de meses que se van a procesar (1-12): " Sin Saltar;
        Leer CM;
    Hasta Que CM > 0 Y CM <= 12;
	
    Dimension matriz_inversiones[CI, CM];
    Dimension matriz_inversionistas[CI, CM];
	
    Repetir
        Borrar Pantalla;
        Escribir "Menú de opciones:";
        Escribir "1. Inicialización de las matrices";
        Escribir "2. Presentar datos de Inversiones por escolaridad";
        Escribir "3. Presentar datos de Inversiones por meses procesados";
        Escribir "4. Salir";
        Leer opcionTexto;
		
        esNumero = Verdadero;
		
        // verifico si la opción ingresada contiene solo dígitos permitidos
        Para i = 0 Hasta Longitud(opcionTexto) Hacer
            esNumero = Falso;
            Para j = 0 Hasta Longitud(digitosPermitidos) Hacer
                Si Subcadena(opcionTexto, i, j) = Subcadena(digitosPermitidos, j, j) Entonces
                    esNumero = Verdadero;
                    j = Longitud(digitosPermitidos); // rompo el bucle interno al alcanzar un valor coincidente
                FinSi
            FinPara
            Si No esNumero Entonces
                i = Longitud(opcionTexto);  // rompo el bucle externo
            FinSi
        FinPara
		
        Si esNumero Entonces
            Segun ConvertirANumero(opcionTexto) Hacer
                1:
                    Inicializa_matrices(CI, CM, matriz_inversiones, matriz_inversionistas);
                    Presenta_datos_matrices("Inversiones", CI, CM, matriz_inversiones);
                    Presenta_datos_matrices("Inversionistas", CI, CM, matriz_inversionistas);
                    inicializado = Verdadero;
                    Escribir "Matrices inicializadas correctamente. Digite enter para continuar.";
                    Esperar tecla;
                2:
                    Si inicializado Entonces
                        Presenta_inversiones_acumuladas_por_mes_por_escolaridad(CI, CM, matriz_inversiones);
                        Presenta_inversionistas_por_escolaridad_por_mes(CI, CM, matriz_inversionistas);
                        Presenta_reporte_inversiones_acumuladas_por_escolaridad(CI, CM, matriz_inversiones, matriz_inversionistas);
                        Escribir "Reporte presentado correctamente. Digite enter para continuar.";
                        Esperar tecla;
                    SiNo
                        Escribir "Debe inicializar las matrices antes de esta opción. Digite enter para continuar.";
                        Esperar tecla;
                    FinSi
                3:
                    Si inicializado Entonces
                        Presenta_datos_matrices("Inversiones", CI, CM, matriz_inversiones);
                        Presenta_datos_matrices("Inversionistas", CI, CM, matriz_inversionistas);
                        Presenta_datos_meses(CI, CM, matriz_inversiones, matriz_inversionistas);
                        Escribir "Reporte presentado correctamente. Digite enter para continuar.";
                        Esperar tecla;
                    SiNo
                        Escribir "Debe inicializar las matrices antes de esta opción. Digite enter para continuar.";
                        Esperar tecla;
                    FinSi
                4:
                    Escribir "Saliendo del sistema. Hasta luego.";
                De Otro Modo:
                    Escribir "Opción no válida. Digite enter para continuar.";
                    Esperar tecla;
            FinSegun
        SiNo
            Escribir "La opción escogida no es permitida. Digite enter para continuar.";
            Esperar tecla;
        FinSi
		
    Hasta Que opcionTexto = "4"
FinProceso
