 opts.outputDir = './apuntes';
 filess = {'tema0', 'tema0b'};
 for i = length(filess)
    file = publish(filess{i},opts);
    close all;
    web(file);
 end