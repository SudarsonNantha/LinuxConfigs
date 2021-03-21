function [y, Nt, days, time] = getReference()

    fileName = "vectorData/data_D500_N500000.mat";
    cmd = sprintf("load %s",fileName);
    eval(cmd);

    y;
    Nt;
    time;
    days;

endfunction
