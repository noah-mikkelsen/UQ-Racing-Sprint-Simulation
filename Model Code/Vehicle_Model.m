%Given
Mass_Driver = 70; %kg
Wheelbase = 1.535; %m
Weight_Bias = 0.53; %from front axle
Air_Density = 1.225; %kg/m^3
ClA = 4.8; %m^2
CdA = 1.5; %m^2
Aero_Bias = 0.55; %from front axle
T_Max = 21; %Nm %single motor!
P_Max = 40; %kW %split between 2 motors!
Gear_Ratio = 11.15;
mu = 1.67;
r_Tyre = 0.25; %m
Track_Length = 75; %m

%2024 Car
RWD = 2;
Mass_2024 = 196; %kg
cogh_2024 = 0.3;

%2025 Car
XWD = 4;
Mass_2025 = 215; %kg
cogh_2025 = 0.275;

%Constants
g = 9.81;

save Vehicle_Model.mat
