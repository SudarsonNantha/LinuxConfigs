function [y, time] = dataExist(days,Nt,ffun,Jfun,y0)

    fileName = strcat("vectorData/data_D",num2str(days),"_N",num2str(Nt),".mat");

    if exist(fileName)
        printf("%s exists. Loading data...\n",fileName);
        cmd = sprintf("load %s",fileName);
        eval(cmd);
        y;
        time;
    else
        printf("%s does not exist. Calculating and saving data...\n",fileName);
        time = linspace(0,days,Nt+1);
        y = BwdEuler(time,ffun,Jfun,y0);
        str = sprintf("save %s y time Nt days",fileName);
        eval(str);
    endif

endfunction
