
tic
%% FBA TOOL BOX SETUP

%initialize FBA solve
initCobraToolbox(false); % no updating
%Change cobra solver
changeCobraSolver('glpk', 'LP');

%% %% Initial Conditions
J=[1000];

% Set the reference values for the optimisation algorithm. 
%These values represent the objective relative abundance for the model system.

Xast= [0.2482, 0.1074, 0.1074, 0.1074, 0.1074, 0.1074, 0.1074, 0.1074]; %Mock

%Xast = [0.2821, 0.2795, 0.2205, 0.2180];% %In vitro: Group 1
%Xast = [0.2286, 0.1920, 0.1784, 0.1409, 0.1318, 0.1283]; %In vitro: Group 2
%Xast = [0.3195, 0.2588, 0.1640, 0.1289, 0.1289]; %In vitro: Group 3
%Xast = [0.3755, 0.1941, 0.1814, 0.1181, 0.0717, 0.0591] % In vitro: Group 4
%Xast = [0.2727, 0.2727, 0.2727, 0.0909, 0.0909]; %In vitro: Group 5

Xast = [0.3534, 0.3264, 0.2192, 0.0565, 0.0442]; % Clinical: Group 1
%Xast = [0.4231, 0.2946, 0.2823]; %Clinical: Group 2

% Set the initial values for microbial kynetic parameters. 
vmax= 10* repelem(1,5);
Ks=repelem(0.10, 5);
cont=1;
k=1;

%% Gradient descent algorithm

while J>0.001

xant=0;
   
    %disp(vmax)
    %dFBA simulation
    trajectory = microbialSim(Ks, vmax);
 
    
    alfa_v = 0.0625 * diag([ 500; 500; 500; 500; 500;]);   % The number of values for this array needs to be the same as the number of species in the community simulation
    
    
    %% Convert biomass concentration to fractional values.

    for j= 1:length(trajectory.FBA)
       lastBM(j)=trajectory.biomass(length(trajectory.biomass),j);
    end

    totalBM=sum(lastBM);

    for j= 1:length(trajectory.FBA) 
        compBM(j) = lastBM(j)/totalBM;
    end
    allBM(:,k)= compBM;
    E = (Xast'/sum(Xast)) - compBM';
    allE(:,k)=E;
    
    %Calculate the performance functional J value
    J=E'*E;
    allJ(k)=J;
    %Plot values for J
    figure(10000)
    plot(allJ)
    pause(1)
    
    %This section modifies the value of Vmax
    x = alfa_v .* abs(E) .* E;
    x=x(x~=0);
    vmaxant=vmax;
    
    vmax = 0.9 * vmax' + x;
    [mv nv]=size(vmax);
    
    for iv=1: nv
       
        if vmax(1,iv) < 0
            vmax(1,iv)=vmaxant(1,iv)/2;
        end
        
    end
    
    xant=x;
    vmax = vmax';
    allVmax(:,k)=vmax';
    
    cont = cont+1
    k=k+1;
%     disp (E)
%     disp(vmax)
%     disp (J)
   
end
