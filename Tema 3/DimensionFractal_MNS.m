%=========================================================================
%
% Este codigo calcular la dimension fractal de una imagen de dimensiones
% 512x512 usando el metodo de 'box-counting'. Este metodo nos ayuda a
% detectar comportamientos fractales naturales.
%
%=========================================================================

clear;
clc;

% La imagen primero se lee y se cambia su escala de colores a blanco y negro
imagen=imread('sierpinski.jpg');
%imagen=rgb2gray(imagen);
imagen=imagen>190;

% Se inician las variables para la grafica. ''factor'' se usa para almacenar
% los factores de escala y ''cajas'' se usa para almacenar el numero de
% cajas (boxes), que contienen las piezas de la imagen. Para una escala
% factor(1,i), el numero de cajas que la imagen ocupar? ser? disponible en
% cajas(1,i).

factor=zeros(1,9);
cajas=zeros(1,9);

[width,height,cols]=size(imagen);
% Como el programa es para una imagen 512x512, el limite se pone en 9, ya
% que 2^9=512.
for i=1:9
   % Los factores de escala se cogen como 2,4,6,8,16,...,512.
   
   % Para cada factor de escala, el n?mero total de piezas se deben
   % calcular y el n?mero de piezas que contienen puntos negros(pixeles) de
   % ?stos se deben contar.

    
   % Por ejemplo, cuando el factor de escala es 2, significa que la imagen
   % se divide por la mitad dos veces y por lo tanto nos quedamos con 4
   % piezas. Ahora debemos ver cu?ntas piezas tienen puntos o pixeles.
   fe=2^i;
   piezas=fe^2;
   piezaAnchura=width/fe;
   piezaAltura=height/fe;
   
   %Asumimos al principio que tenemos 0 piezas con puntos negros.
   piezasNegras=0;
   
   % Ahora pasamos por todas las piezas mirando cuales tienen pixeles.
   % Consideraremos la colecci?n de piezas como una matriz. Contamos a
   % partir de 0 por la facilidad de los calculos.
   
   for indicePieza=0:piezas-1
       
       % Los indices de fila y columna de cada pieza se calculan para
       % estimar las coordenadas x e y del principio y final de cada pieza.
       piezaFila=idivide(int32(indicePieza), int32(fe));
       piezaCol=rem(indicePieza,fe);
       xmin=(piezaCol*piezaAnchura)+1;
       xmax=(xmin+piezaAnchura)-1;
       ymin=(piezaFila*piezaAltura)+1;
       ymax=(ymin+piezaAltura)-1;
       
       % Cada pieza se extrae y se almacena en otra colecci?n para que haya
       % convergencia.
       cadaPieza=imagen(ymin:ymax,xmin:xmax);

       
       % Ahora veremos si la pieza tiene pixeles en ella y si es asi la
       % cuenta de piezas con puntos negros(piezasNegras) se aumentar?.
       if (min(min(cadaPieza))== 0)
           piezasNegras=piezasNegras+1;
       end
   end
   
   % La cuenta de puntos negros para un factor de escala determinado se
   % obtenndr? aqui y se guardar? en las variables respectivas.
   fprintf('%d\t->\t%d\n', fe, piezasNegras);
   factor(1,i)=fe;
   cajas(1,i)=piezasNegras;
end

% Ahora el proceso se ha terminado, la grafica se ha construido y la
% dimensi?n fractal se calcula usando la funci?n ''polyfit''.
polyfit(log(factor),log(cajas),1)
figure
plot(log(factor),log(cajas))
xlabel('factor del logaritmo')
ylabel('Nº de cajas del logaritmo')
grid on
axis on
%Representamos tambien la imagen original del fractal
figure
Nube=imread('sierpinski.jpg');
image(Nube)


