% Modelo Logístico% 

global china dataYear dataPop n

china = load('chinalimpio.mat');
dataYear = table2array(china.china(:, 2));
dataPop = table2array(china.china(:, 3));

% Perform element-wise division on the third column of the 'china' table
dataPop = dataPop / 1e+9;

n = length(dataYear); % get the length of t vector


x=[1 1]';



[x,k, vg] = regioncon('logistico',x);
x
% xN = [1.66915416161604 0.0365611162817698];

xN = x;
[xf, j] = desnewton('logistico', xN);

xf


% REGION DE CONFIANZA
% Create a figure window
figure;
vecto = dataYear - 1950*ones(n,1); %ajustar los años
y = linspace(1950,2100,16);
vectow = linspace(1950,2100,151);
% Plot the function as a solid line
plot(vectow, popChinaEst(x(1),x(2)) , 'm', 'LineWidth', 2);

hold on; % Keep the plot window open to add the scatterplot

% Plot the scatterplot of random points as circles
scatter(dataYear, dataPop, 'o', 'MarkerFaceColor', 'blue', 'MarkerEdgeColor', 'black');
title("Región de Confianza")
xlabel('Periodo de tiempo')
ylabel('Mil millones de personas')
xticks(y)

% DESCENSO DE NEWTON (CHECAR EL NAN)
% Create a figure window
figure;

% Plot the function as a solid line
plot(vectow, popChinaEst(xf(1),xf(2)), 'm', 'LineWidth', 2);

hold on; % Keep the plot window open to add the scatterplot

% Plot the scatterplot of random points as circles
scatter(dataYear, dataPop, 'o', 'MarkerFaceColor', 'blue', 'MarkerEdgeColor', 'black');
title("Newton")
%legend({'Estimación población China','Datos China'},'Location','south')
xlabel('Periodo de tiempo')
ylabel('Mil millones de personas')
xticks(y)



