Funcion nombreEscolaridad = ObtieneNombreEscolaridad(idNivel)  // recibe un numero entero
	Definir nombreEscolaridad Como Caracter;
	
	// según el entero recibido asigna la cadena que corresponda
	Segun idNivel Hacer
		1: nombreEscolaridad <- "Primaria         ";
		2: nombreEscolaridad <- "Secundaria       ";
		3: nombreEscolaridad <- "Técnico          ";
		4: nombreEscolaridad <- "Bachiller Univ.  ";
		5: nombreEscolaridad <- "Licenciado       ";
		6: nombreEscolaridad <- "Maestría         ";
		7: nombreEscolaridad <- "Doctorado        ";
		De Otro Modo:
			nombreEscolaridad <- "Desconocido      ";
	FinSegun
FinFuncion

Funcion nombreMes = ObtieneNombreMes(idMes)  // recibe un entero
	Definir nombreMes Como Caracter;
	// según el entero recibido asigna la cadena que corresponda
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

// Función para calcular promedios
Funcion promedio = CalcularPromedio(sumaInversiones, sumaInversionistas)  // Recibe dos enteros
	Definir promedio Como Real;
    
    Si sumaInversionistas > 0 Entonces
        promedio = sumaInversiones / sumaInversionistas;
    Sino
        promedio = 0;  // O el valor que desees manejar en caso de no haber inversionistas
    FinSi
FinFuncion

Funcion validarNumero = ValidarEsNumeroValido(opcionTexto)  // recibe una cadena para evaluar si es un número
	Definir digitosPermitidos Como Caracteres;
	Definir validarNumero Como Logico;
	Definir i, j Como Entero;
	
	digitosPermitidos = "1234567890"; // inicializo cadena con los digitos permitidos a evaluar
	
	Para i = 0 Hasta Longitud(opcionTexto) Hacer
		validarNumero = Falso;
		Para j = 0 Hasta Longitud(digitosPermitidos) Hacer
			Si Subcadena(opcionTexto, i, j) = Subcadena(digitosPermitidos, j, j) Entonces
				validarNumero = Verdadero;
				j = Longitud(digitosPermitidos); // rompo el bucle interno al alcanzar un valor coincidente
			FinSi
		FinPara
		Si No validarNumero Entonces
			i = Longitud(opcionTexto);  // rompo el bucle externo
		FinSi
	FinPara
FinFuncion

// método para asignar valores aleatorios a las matrices
SubProceso InicializaMatrices(CI, CM, matrizInversiones, matrizInversionistas)
	Definir i, j Como Entero;
	Para i = 0 Hasta CI-1 Con Paso 1 Hacer
		Para j = 0 Hasta CM-1 Con Paso 1 Hacer
			matrizInversiones[i, j] = Aleatorio(1, 800);
			matrizInversionistas[i, j] = Aleatorio(1, 30);
		FinPara
	FinPara
FinSubProceso

// método para presentar en pantalla las matrices con sus primeros datos
SubProceso PresentaDatosMatrices(nombreMatriz, CI, CM, matriz)  // recibe una cadena (titulo), cantidades de filas y columnas y una matriz
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
	Escribir "";
FinSubProceso

SubProceso PresentaInversionesAcumuladasPorMesPorEscolaridad(CI, CM, matrizInversiones)
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
			Si matrizInversiones[i, j] < 10 Entonces
				Escribir Sin Saltar matrizInversiones[i, j], "   ";
			SiNo
				Si matrizInversiones[i, j] < 100 Entonces
					Escribir Sin Saltar matrizInversiones[i, j], "  ";
				SiNo
					Escribir Sin Saltar matrizInversiones[i, j], " ";
				FinSi
			FinSi
		FinPara
		Escribir "";
	FinPara
	Escribir "";
FinSubProceso

SubProceso PresentaInversionistasPorEscolaridadPorMes(CI, CM, matrizInversionistas)
	Definir i, j Como Entero;
	Escribir "Cantidad de inversionistas por escolaridad por mes:";
	// titulos columnas (meses)
	Escribir Sin Saltar "                  ";
	Para j = 0 Hasta CM-1 Con Paso 1 Hacer
		Escribir Sin Saltar ObtieneNombreMes(j+1), " ";
	FinPara
	Escribir "";
	// inversionistas por escolaridad y por mes (etiquetas de filas)
	Para i = 0 Hasta CI-1 Hacer
		Escribir Sin Saltar ObtieneNombreEscolaridad(i+1), " ";
		Para j = 0 Hasta CM-1 Hacer
			si matrizInversionistas[i,j] < 10 Entonces
				Escribir Sin Saltar matrizInversionistas[i, j], "   ";
			SiNo
				Escribir Sin Saltar matrizInversionistas[i, j], "  ";
			FinSi
			
		FinPara
		Escribir "";
	FinPara
FinSubProceso

SubProceso PresentaReporteInversionesAcumuladasPorEscolaridad(CI, CM, matrizInversiones, matrizInversionistas)
	Definir i, j, sumaInversionesEscolaridad, sumaInversionistasEscolaridad Como Entero;
	Definir promedioInversionesEscolaridad Como Real;
	Dimension sumaInversionesEscolaridad[CI];
	Dimension sumaInversionistasEscolaridad[CI];
	Dimension promedioInversionesEscolaridad[CI];
	
	Para i = 0 Hasta CI-1 Hacer
		sumaInversionesEscolaridad[i] = 0;
		sumaInversionistasEscolaridad[i] = 0;
		Para j = 0 Hasta CM-1 Hacer
			sumaInversionesEscolaridad[i] = sumaInversionesEscolaridad[i] + matrizInversiones[i, j];
			sumaInversionistasEscolaridad[i] = sumaInversionistasEscolaridad[i] + matrizInversionistas[i, j];
		FinPara
		promedioInversionesEscolaridad[i] = CalcularPromedio(sumaInversionesEscolaridad[i], sumaInversionistasEscolaridad[i]);
	FinPara
	
	Escribir "Reporte de Inversiones acumuladas por Escolaridad:";
	Escribir "Escolaridad         Monto Inversiones         Cantidad Inversionistas         Promedio";
	Para i = 0 Hasta CI-1 Hacer
		Escribir ObtieneNombreEscolaridad(i+1), "          ", sumaInversionesEscolaridad[i], "                    ", sumaInversionistasEscolaridad[i], "                        ",  promedioInversionesEscolaridad[i];
	FinPara
FinSubProceso

SubProceso PresentaDatosMeses(CI, CM, matrizInversiones, matrizInversionistas)
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
			sumaInversionesMes[j] = sumaInversionesMes[j] + matrizInversiones[i, j];
			sumaInversionistasMes[j] = sumaInversionistasMes[j] + matrizInversionistas[i, j];
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

// proceso principal que solo se encarga de presentar el menu y procesar segùn la opcion seleccionada por el usuario
Proceso InversionesTotales
    Definir CI, CM, matrizInversiones, matrizInversionistas Como Entero;
	//CI = Niveles Escolaridad, CM = Cantidad Meses, i-j = variables para recorridos
    Definir inicializado, esNumero Como Logico; // Flags lógicos para validar paso 1 y si la opción es seleccion valida
    Definir opcionTexto como Cadena;  // Variable para almacenar la selección del usuario
	
    inicializado = Falso;  // se inicializa en falso para no permitir ejecutar 2 y 3 sin haber ejecutado 1
	
	// Pido datos al usuario de cantidad de tipos de escolaridad y cantidad de meses a procesar
    Repetir
        Escribir "Digite cantidad de Tipos de escolaridad que se van a procesar (1-7): " Sin Saltar;
        Leer CI;
    Hasta Que CI > 0 Y CI <= 7;
	
    Repetir
        Escribir "Digite cantidad de meses que se van a procesar (1-12): " Sin Saltar;
        Leer CM;
    Hasta Que CM > 0 Y CM <= 12;
	
	//  Dimensiono las filas y columnas de las matrices
    Dimension matrizInversiones[CI, CM];
    Dimension matrizInversionistas[CI, CM];
	
	//  Presento menú de opciones en pantalla
    Repetir
        Borrar Pantalla;
        Escribir "Menú de opciones:";
        Escribir "1. Inicialización de las matrices";
        Escribir "2. Presentar datos de Inversiones por escolaridad";
        Escribir "3. Presentar datos de Inversiones por meses procesados";
        Escribir "4. Salir";
        Leer opcionTexto;
		
		//  Mando a validar que la selección del usuario sea una opción correcta
		// y evitar un numero fuera de rango o una letra
		esNumero = ValidarEsNumeroValido(opcionTexto);
		
        Si esNumero Entonces
            Segun ConvertirANumero(opcionTexto) Hacer
                1:
                    InicializaMatrices(CI, CM, matrizInversiones, matrizInversionistas);
                    PresentaDatosMatrices("Inversiones", CI, CM, matrizInversiones);
                    PresentaDatosMatrices("Inversionistas", CI, CM, matrizInversionistas);
                    inicializado = Verdadero;
                    Escribir "Matrices inicializadas correctamente. Digite enter para continuar.";
                    Esperar tecla;
                2:
                    Si inicializado Entonces
                        PresentaInversionesAcumuladasPorMesPorEscolaridad(CI, CM, matrizInversiones);
                        PresentaInversionistasPorEscolaridadPorMes(CI, CM, matrizInversionistas);
                        PresentaReporteInversionesAcumuladasPorEscolaridad(CI, CM, matrizInversiones, matrizInversionistas);
                        Escribir "Reporte presentado correctamente. Digite enter para continuar.";
                        Esperar tecla;
                    SiNo
                        Escribir "Debe inicializar las matrices antes de esta opción. Digite enter para continuar.";
                        Esperar tecla;
                    FinSi
                3:
                    Si inicializado Entonces
                        PresentaDatosMatrices("Inversiones", CI, CM, matrizInversiones);
                        PresentaDatosMatrices("Inversionistas", CI, CM, matrizInversionistas);
                        PresentaDatosMeses(CI, CM, matrizInversiones, matrizInversionistas);
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
