disp ('Intenta adivinar un numero del 1 al 9. Si eres una maricona cobarde pulse CTRL+C');
disp (' ');

x = randi (9);
y = 0;
while x~=y
    y= input ('escribe el puto numero  ');
end
beep;
disp ('por fin acertaste cabron');