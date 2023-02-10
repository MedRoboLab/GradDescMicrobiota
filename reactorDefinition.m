function [ reactor ] = reactorDefinition( numberOfSpecies, externalCompounds)
%reactorDefinition Summary of this function goes here
%   Detailed explanation goes here
 
%  cultMedia_comp = readtable('D:\User\Juan Velasco\Documents\Doctorado\Modelo\MicrobiotaSintetica.xlsx','Sheet','HIGHFiber','Range','A1:A92');%'Medium','Range','A68:A105');
%     cultMedia_comp = table2cell(cultMedia_comp);
%     for j=1:length(cultMedia_comp)
%         cultMedia_comp(j)=strrep(cultMedia_comp(j),'[e]','(e)');
%     end
%  cultMedia_conc = readtable('D:\User\Juan Velasco\Documents\Doctorado\Modelo\MicrobiotaSintetica.xlsx','Sheet','HIGHFiber','Range','B1:B92');%'Medium','Range','A68:A105');

 cultMedia_comp = readtable('D:\User\Juan Velasco\Documents\Doctorado\Modelo\DM38MediumComp_Clark2020.xlsx', 'Sheet', 'Metabolite form', 'Range', 'B122:B189');
 cultMedia_conc = readtable('D:\User\Juan Velasco\Documents\Doctorado\Modelo\DM38MediumComp_Clark2020.xlsx', 'Sheet', 'Metabolite form', 'Range', 'C122:C189');
 cultMedia_conc = table2cell(cultMedia_conc);
 cultMedia_comp = table2cell(cultMedia_comp);
 for j=1:length(cultMedia_comp)
    cultMedia_comp(j) = strcat(cultMedia_comp(j));
 end 

            
% define the reactor
    reactor.volume = 1.0;	% liter

    reactor.flowRate = 0*0.1;	% liter/hour

    numberOfCompounds = size(cultMedia_comp, 1);

    reactor.compounds = cultMedia_comp';

    reactor.compoundsInit = 1 * ones(1, numberOfCompounds); %cell2mat(cultMedia_conc); % 

    reactor.biomassInit =[0.1, 0.1, 0.1, 7.43, 5.934]; %0.1 * ones(1, numberOfSpecies); %

    reactor.compoundsInflow = 0.0 * ones(1, numberOfCompounds);

    reactor.biomassInflow = 0.0 * ones(1, numberOfSpecies);

end

