% Function Program to calculate quintic coefficients

function [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(Ti,Tf,pi,pf,vi,vf,ai,af)

    % Defining symbols
    syms C0 C1 C2 C3 C4 C5 S H T;
    
    % pi=0; % sample input for testing
    % pf=3; % sample input for testing
    % vi=-1; % sample input for testing
    % vf=5; % sample input for testing
    % ai=-3; % sample input for testing
    % af=1; % sample input for testing
    % Ti=0; % sample input for testing
    % Tf=8; % sample input for testing
    
    % Forming equations
    e1=C0+C1*(Ti)+C2*(Ti^2)+C3*(Ti^3)+C4*(Ti^4)+C5*(Ti^5)==pi; % equation for initial position
    e2=C1+2*C2*(Ti)+3*C3*(Ti^2)+4*C4*(Ti^3)+5*C5*(Ti^4)==vi; % equation for initial velocity
    e3=2*C2+6*C3*(Ti)+12*C4*(Ti^2)+20*C5*(Ti^3)==ai;  % equation for initial acceleration
    e4=C0+C1*(Tf)+C2*(Tf^2)+C3*(Tf^3)+C4*(Tf^4)+C5*(Tf^5)==pf; % equation for final position
    e5=C1+2*C2*(Tf)+3*C3*(Tf^2)+4*C4*(Tf^3)+5*C5*(Tf^4)==vf; % equation for final velocity
    e6=2*C2+6*C3*(Tf)+12*C4*(Tf^2)+20*C5*(Tf^3)==af; % equation for final acceleration
    
    solutions=solve([e1,e2,e3,e4,e5,e6], [C0,C1,C2,C3,C4,C5]); % solving the equations
    
    % disp(solutions) % output to check program
    
    C0=solutions.C0; % extracting value of coefficient C0
    C1=solutions.C1; % extracting value of coefficient C1
    C2=solutions.C2; % extracting value of coefficient C2
    C3=solutions.C3; % extracting value of coefficient C3
    C4=solutions.C4; % extracting value of coefficient C4
    C5=solutions.C5; % extracting value of coefficient C5
    
    % disp(C0); % output to check program
    % disp(C1); % output to check program
    % disp(C2); % output to check program
    % disp(C3); % output to check program
    % disp(C4); % output to check program
    % disp(C5); % output to check program

end