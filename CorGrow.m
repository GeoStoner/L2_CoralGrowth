function [ G ] = CorGrow( Gm,I0,k,z,Ik,dt )
% Calculates change in growth of coral reef from inputs
% Gm,I0,k,z,Ik, dt
% dt is used to make the visualization less choppy

G = Gm*tanh((I0*exp(-k*z))/Ik); % function
zabove = find((z)<=G*dt);


G(zabove) = zeros(1,length(zabove));


end

