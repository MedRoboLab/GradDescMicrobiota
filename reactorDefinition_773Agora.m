function [ reactor ] = reactorDefinition_773Agora( numberOfSpecies, externalCompounds )
%reactorDefinition Summary of this function goes here
%   Detailed explanation goes here

% define the reactor
    reactor.volume = 1.0;	% liter

    reactor.flowRate = 0*0.1;	% liter/hour

    numberOfCompounds = size(externalCompounds, 1);

    reactor.compounds = externalCompounds';

    reactor.compoundsInit = 0.01 * ones(1, numberOfCompounds);

    reactor.biomassInit =[0.1, 0.1, 0.1, 7.430, 5.934];  %The number of values for this array needs to be the same as the number of species in the community simulation

    reactor.compoundsInflow = 0.0 * ones(1, numberOfCompounds);

    reactor.biomassInflow = 0.0 * ones(1, numberOfSpecies);

end

