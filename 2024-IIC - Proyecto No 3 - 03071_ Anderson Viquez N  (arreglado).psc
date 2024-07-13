Algoritmo matrices
	
	//Programador: Anderson Viquez Nuñez
	//Fecha Inicio: 30/06/24
	//Descripcion del programa: Principios de Programacion
	//Declaracion de variables
	
	//Declaracion de variables
	Definir matriz_periodicidad Como Numerica;
	definir suma_inver, resultante, matriz_inversion, sucursal, dias, filas, cols, opcion como entero;
	Definir validacion_opcion, opcion_validada Como Logico;
	Definir matriz_interes, suma_interes Como Real;
	
	Definir texto_numero como cadena;
	Definir longitud_max Como Entero;
	
	Definir longitudes_matrices Como Entero;
	longitudes_matrices = 0;
	
	Repetir
		Escribir "Digite cantidad de Sucursales: " Sin Saltar;
		Leer sucursal; //primer variable digitada por usuario cant de filas-Sucursales
		si sucursal <=0 Entonces
			Escribir "El digito de sucursales debe ser mayor a 0";
		FinSi
	Hasta Que sucursal > 0;
	
	Repetir
		Escribir "Digite cantidad de Dias" Sin Saltar;
		Leer dias; //primer variable digitada por usuario cant de columnas-Dias
		Si dias <=0 Entonces
			Escribir "El cantidad de dias debe ser mayor a 0";
		FinSi
	Hasta Que dias > 0;
	
	//inicializacion
	Dimension matriz_inversion(sucursal,dias); //valores enteros // variable matriz inversion
	Dimension matriz_periodicidad(sucursal,dias); //valores enteros // variable matriz periodicidad
	Dimension matriz_interes(sucursal,dias); //valores enteros // variable matriz interes
	Dimension resultante(sucursal,dias); //variable matriz resultante
	
	// Dimension longitudes_matrices[3, dias];
	
	
	validacion_opcion <- Falso;
	opcion_validada <- Falso;
	
	longitud_max = 6;
	
	//Cuerpo del Programa
	Repetir
		Escribir "";
		Escribir "Menu principal de sumatorias de una matriz";
		Escribir "1. Inicializar matrices";
		Escribir "2. Calcular intereses por pagar";
		Escribir "3. Presentar acumulados de inversion";
		Escribir "4. Salir del menu (finalizar)";
		
		Leer opcion;
		
		//Ejecucion de opciones y recorridos de matrices
		Segun opcion hacer
			1: 
				Para filas<-0 Hasta sucursal-1 Con Paso 1 Hacer
					Para cols<-0 Hasta dias-1 Con Paso 1  Hacer
						matriz_inversion(filas, cols)=Aleatorio(0,100);
						matriz_periodicidad(filas, cols)=Aleatorio(1,4);
						matriz_interes(filas, cols)=0;
					FinPara
				FinPara
				validacion_opcion <- Verdadero;
				opcion_validada <- Falso; // Resetea opcion valida
				
				//dar formato a texto
				para cols = 0 Hasta dias-1 Con Paso 1 Hacer
					para filas = 0 Hasta sucursal -1 Con Paso 1 Hacer
						texto_numero = ConvertirATexto(matriz_inversion[filas, cols]);
						Si Longitud(texto_numero) > longitud_max Entonces
							longitud_max = Longitud(texto_numero);
						FinSi
					FinPara
					
					longitudes_matrices = longitud_max;
					
					para filas = 0 Hasta sucursal-1 Con Paso 1 Hacer
						texto_numero = ConvertirATexto(matriz_periodicidad[filas, cols]);
						Si Longitud(texto_numero) > longitud_max Entonces
							longitud_max = Longitud(texto_numero);
						FinSi
					FinPara
					
					longitudes_matrices = longitud_max;
					
					para filas = 0 Hasta sucursal-1 Con Paso 1 Hacer
						texto_numero = ConvertirATexto(matriz_interes[filas, cols]);
						Si Longitud(texto_numero) > longitud_max Entonces
							longitud_max = Longitud(texto_numero);
						FinSi
					FinPara
					
					longitudes_matrices = longitud_max;
					
				FinPara
				
				Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";					
				Escribir "*              Matriz de Inversiones acumuladas:          *";
				Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
				Escribir "           ", Sin Saltar;
				Para cols=0  hasta dias-1 Con Paso 1 Hacer
					si cols >= 9 Entonces
						Escribir "Dia ", cols+1, " " sin saltar;
					SiNo
						Escribir "Dia ", cols+1, "  " sin saltar;
					FinSi
					
				FinPara
				Escribir "";
				//Recorrido de matriz por fila
				Para filas<-0 Hasta sucursal-1 Con Paso 1 Hacer
					si filas >= 9 Entonces
						Escribir "Sucurs ", filas + 1, "  " sin saltar;
					SiNo
						Escribir "Sucurs ", filas + 1, "   " sin saltar;
					FinSi
					para cols = 0 Hasta dias-1 Con Paso 1 Hacer
						texto_numero = ConvertirATexto(matriz_inversion[filas, cols]);
						Mientras Longitud(texto_numero) < longitudes_matrices Hacer
							texto_numero = texto_numero + " ";
						FinMientras
						Escribir texto_numero, " ", Sin Saltar;
					FinPara
					Escribir "";
				FinPara
				
				//Lectura matriz periodicidad
				Escribir "";
				Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
				Escribir "*                Matriz de Periodicidad:                  *";
				Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
				Escribir "           ", Sin Saltar;
				Para cols=0  hasta dias-1 Con Paso 1 Hacer
					si cols >= 9 Entonces
						Escribir "Dia ", cols+1, " " sin saltar;
					SiNo
						Escribir "Dia ", cols+1, "  " sin saltar;
					FinSi
					
				FinPara
				Escribir "";
				//Recorrido de matriz por fila
				Para filas<-0 Hasta sucursal-1 Con Paso 1 Hacer
					si filas >= 9 Entonces
						Escribir "Sucurs ", filas + 1, "  " sin saltar;
					SiNo
						Escribir "Sucurs ", filas + 1, "   " sin saltar;
					FinSi
					para cols = 0 Hasta dias-1 Con Paso 1 Hacer
						texto_numero = ConvertirATexto(matriz_periodicidad[filas, cols]);
						Mientras Longitud(texto_numero) < longitudes_matrices Hacer
							texto_numero = texto_numero + " ";
						FinMientras
						Escribir texto_numero, " ", Sin Saltar;
					FinPara
					Escribir "";
				FinPara
			2:
				Si no validacion_opcion Entonces
					Escribir "Error: Inicialice las matrices primero (opcion 1).";
				SiNo
					
					//dar formato a texto
//					para cols = 0 Hasta dias-1 Con Paso 1 Hacer
//						para filas = 0 Hasta sucursal -1 Con Paso 1 Hacer
//							texto_numero = ConvertirATexto(matriz_inversion[filas, cols]);
//							Si Longitud(texto_numero) > longitud_max Entonces
//								longitud_max = Longitud(texto_numero);
//							FinSi
//						FinPara
//						
//						longitudes_matrices[0, cols] = longitud_max;
//						
//						para filas = 0 Hasta sucursal-1 Con Paso 1 Hacer
//							texto_numero = ConvertirATexto(matriz_periodicidad[filas, cols]);
//							Si Longitud(texto_numero) > longitud_max Entonces
//								longitud_max = Longitud(texto_numero);
//							FinSi
//						FinPara
//						
//						longitudes_matrices[1, cols] = longitud_max;
//						
//						para filas = 0 Hasta sucursal-1 Con Paso 1 Hacer
//							texto_numero = ConvertirATexto(matriz_interes[filas, cols]);
//							Si Longitud(texto_numero) > longitud_max Entonces
//								longitud_max = Longitud(texto_numero);
//							FinSi
//						FinPara
//						
//						longitudes_matrices[2, cols] = longitud_max;
//						
//					FinPara
						
					
					//Lectura matriz inversiones
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";					
					Escribir "*              Matriz de Inversiones acumuladas:          *";
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "           ", Sin Saltar;
					Para cols=0  hasta dias-1 Con Paso 1 Hacer
						si cols >= 9 Entonces
							Escribir "Dia ", cols+1, " " sin saltar;
						SiNo
							Escribir "Dia ", cols+1, "  " sin saltar;
						FinSi
						
					FinPara
					Escribir "";
					//Recorrido de matriz por fila
					Para filas<-0 Hasta sucursal-1 Con Paso 1 Hacer
						si filas >= 9 Entonces
							Escribir "Sucurs ", filas + 1, "  " sin saltar;
						SiNo
							Escribir "Sucurs ", filas + 1, "   " sin saltar;
						FinSi
						para cols = 0 Hasta dias-1 Con Paso 1 Hacer
							texto_numero = ConvertirATexto(matriz_inversion[filas, cols]);
							Mientras Longitud(texto_numero) < longitudes_matrices Hacer
								texto_numero = texto_numero + " ";
							FinMientras
							Escribir texto_numero, " ", Sin Saltar;
						FinPara
						Escribir "";
					FinPara
					
					//Lectura matriz periodicidad
					Escribir "";
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "*                Matriz de Periodicidad:                  *";
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "           ", Sin Saltar;
					Para cols=0  hasta dias-1 Con Paso 1 Hacer
						si cols >= 9 Entonces
							Escribir "Dia ", cols+1, " " sin saltar;
						SiNo
							Escribir "Dia ", cols+1, "  " sin saltar;
						FinSi
						
					FinPara
					Escribir "";
					//Recorrido de matriz por fila
					Para filas<-0 Hasta sucursal-1 Con Paso 1 Hacer
						si filas >= 9 Entonces
							Escribir "Sucurs ", filas + 1, "  " sin saltar;
						SiNo
							Escribir "Sucurs ", filas + 1, "   " sin saltar;
						FinSi
						para cols = 0 Hasta dias-1 Con Paso 1 Hacer
							texto_numero = ConvertirATexto(matriz_periodicidad[filas, cols]);
							Mientras Longitud(texto_numero) < longitudes_matrices Hacer
								texto_numero = texto_numero + " ";
							FinMientras
							Escribir texto_numero, " ", Sin Saltar;
						FinPara
						Escribir "";
					FinPara
					
					//Calculo de interes
					Para filas <- 0 Hasta sucursal-1 Con Paso 1  Hacer
						Para cols <- 0 Hasta dias-1 Con Paso 1 Hacer
							Segun matriz_periodicidad(filas, cols) Hacer
								1:
									matriz_interes(filas, cols) <- matriz_inversion(filas, cols) * 0.03;
								2:
									matriz_interes(filas, cols) <- matriz_inversion(filas, cols) * 0.04;
								3:
									matriz_interes(filas, cols) <- matriz_inversion(filas, cols) * 0.05;
								4:
									matriz_interes(filas, cols) <- matriz_inversion(filas, cols) * 0.06;
							FinSegun
						FinPara
					FinPara
					
					
					//Lectura matriz intereses
					Escribir "";
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "*                 Matriz de intereses:                    *";
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "           ", Sin Saltar;
					Para cols=0  hasta dias-1 Con Paso 1 Hacer
						si cols >= 9 Entonces
							Escribir "Dia ", cols+1, " " sin saltar;
						SiNo
							Escribir "Dia ", cols+1, "  " sin saltar;
						FinSi
						
					FinPara
					Escribir "";
					//Recorrido de matriz por fila
					Para filas<-0 Hasta sucursal-1 Con Paso 1 Hacer
						si filas >= 9 Entonces
							Escribir "Sucurs ", filas + 1, "  " sin saltar;
						SiNo
							Escribir "Sucurs ", filas + 1, "   " sin saltar;
						FinSi
						para cols = 0 Hasta dias-1 Con Paso 1 Hacer
							texto_numero = ConvertirATexto(matriz_inversion[filas, cols]);
							Mientras Longitud(texto_numero) < longitudes_matrices Hacer
								texto_numero = texto_numero + " ";
							FinMientras
							Escribir texto_numero, " ", Sin Saltar;
						FinPara
						Escribir "";
					FinPara
					validacion_opcion <- Verdadero;
				FinSi		
				
			3:
				Si No validacion_opcion Entonces
					Escribir "Error: Calcule los resultados primero (opcion 2).";
				SiNo
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "*                Inversiones Totales S.A                  *";
					Escribir "*                 Reporte de Inversiones                  *";
					Escribir "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *";
					Escribir "Sucursal        ", "Monto de inversion  ", "Monto de Intereses";
					//recorre la matriz y sumar filas
					Para filas <- 0 Hasta sucursal-1 Con Paso 1 Hacer
                        suma_inver = 0;
                        suma_interes = 0;
                        Para cols <- 0 Hasta dias-1 Con Paso 1 Hacer
                            suma_inver = suma_inver+ matriz_inversion(filas, cols);
                            suma_interes = suma_interes + matriz_interes(filas, cols);
                        FinPara
                        Escribir "   ", filas+1, "                   ", suma_inver, "                 ", suma_interes;
                    FinPara
				FinSi
				
			4:
				Escribir "saliendo del programa";
				Esperar 1 Segundos;
				
			De Otro Modo:
				Escribir "opcion digitada es invalida";
				esperar 1 Segundos;
				
		FinSegun
		
	Hasta Que opcion=4;
	
FinAlgoritmo
