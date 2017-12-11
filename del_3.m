clear;

fun = @(x) time_to_destination_simpson(x, 'speed_elsa', 16);

h = fzero(fun, 30);
disp(h);