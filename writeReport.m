function [ ] = writeReport( name, vel, acc, flag )


name = sprintf('%s.txt', name);
file = fopen(name, 'w');
sz = size(acc);
for i = 1:1:sz(2)
    switch flag
        case 0
            fprintf(file, '%.4f, %.4f, %.4f, %.4f, %.4f, %.4f\n', vel(i).x, vel(i).y, vel(i).z, acc(i).x, acc(i).y, acc(i).z);
        case 1
            fprintf(file, '%.4f, %.4f, %.4f, %.4f\n', vel(i).x, vel(i).y, acc(i).x, acc(i).y);
    end
end
fclose(file);
end

