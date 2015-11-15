%% NOMBRE:
%% Apantallamiento de un campo magnético
% En este script analizamos los datos del archivo Apantallamiento.txt
% que contiene los valores del factor apantallamiento magnético nu de un cilindro
% de cobre en función de la frecuencia f del campo. El factor de apantallamiento
% no tiene dimensiones y la frecuencia f viene dada en Hz
%
% La fórmula teórica por la que se nos pide ajustar es
%
% 1/(1-nu^2) = 1+A*f^2+B*f^4
%
% No hay una función que haga directamente este ajuste en Matlab.
% El ejercicio está dividido en varios apartados de mayor a menor
% complicación. Se empieza por ajustes sencillos pero que no se
% corresponden con la expresión teórica y se acaba por hacer el ajuste que
% se corresponde con ella.
%% Importamos los datos


%% Resultados de un ajuste por un polinomio de segundo grado
% Polinomio: y = p1*f^2+p2*f+p3*1
%
% Los coeficientes del ajuste obtenidos con el menú Basic Fitting se apuntan 
% a mano en esta tabla
%
% Coeficiente 	 Término 	 Valor 
%
% p1            f^2 	 	 
%
% p2            f 	 	  
%
% p3            1 	 	  
%
% Norma de los residuos = 



%% Ajuste por un polinomio de cuarto grado
% Probamos primero con un polinomio mal condicionado y luego con un
% polinonio bien condicinado.
%
% Los coeficientes del ajuste obtenidos con el menú Basic Fitting se apuntan 
% a mano en esta tabla
%
% Polinomio mal condicionado: y = p1*f^4+p2*f^3+p3*f^2+p4*f+p5
%
% Coeficiente 	 Término 	 Valor  
%
% p1            f^4
%
% p2            f^3
%
% p3            f^2
%
% p4            f
%
% p5            1
%
% Norma de los residuos = 
%
% ----------------------------------------------------------------
%
% Polinomio bien condicionado y = p1*z^4+p2*z^3+p3*z^2+p4*z+p5
%
% z=(f-mu)/sigma
%
% mu =
%
% sigma = 
%
% Coeficiente 	 Término 	 Valor  
%
% p1            z^4
%
% p2            z^3
%
% p3            z^2
%
% p4            z
%
% p5            1
%
% Norma de los residuos = 




%% Ajuste sin usar polyfit
% Tenemos que definir una nueva variable yn = y-1.
% Ajustamos por:
%
% y_n = A*f^2+B*f^4
%
% * A =   +/
% * B =   +/-
