
load Vehicle_Model.mat



function final_time = eulers_method(Wheel_Num, Mass_Car, cogh, Track_Length, Mass_Driver, g, Weight_Bias, Air_Density, ClA, CdA, Aero_Bias, T_Max, P_Max, Gear_Ratio, mu, r_Tyre, Wheelbase, include_LLT)

    %Initial Conditions
    x = 0;
    v = 0;
    a = 0;
    t = 0;
    time_step = 0.01;
    step_count = 1;
    max_step = 100;
    F_R = zeros(1, max_step)';
    F_F = zeros(1, max_step)';
    F_actual = zeros(1, max_step)';

    while x <= Track_Length
    
    %LLT
    if include_LLT
        LLT = 0.5*a*(Mass_Car+Mass_Driver)*cogh/Wheelbase; %each wheel
    else
        LLT = 0;
    end
    
    %Calculate z-forces

    F_rear_mass = 0.5*(Mass_Car + Mass_Driver)*g*Weight_Bias; %each wheel
    F_front_mass = 0.5*(Mass_Car + Mass_Driver)*g*(1-Weight_Bias); %each wheel
    F_downforce = 0.5*Air_Density*ClA*v^2; %total
    F_drag = 0.5*Air_Density*CdA*v^2; %total
    F_rear_downforce = 0.5*F_downforce*Aero_Bias; %each wheel
    F_front_downforce = 0.5*F_downforce*(1-Aero_Bias); %each wheel
    F_z_rear = F_rear_mass + F_rear_downforce + LLT;
    F_z_front = F_front_mass + F_front_downforce - LLT;
   
    %Max forces due to static friction
    % F_max_rear = mu*(F_rear_mass + F_rear_downforce + LLT) %each wheel
    F_max_rear = (1.986-0.000469*(F_z_rear))*F_z_rear;

    F_R(step_count) = F_max_rear;
 
    % F_max_front = mu*(F_front_mass + F_front_downforce - LLT); %each wheel
    F_max_front = (1.986-0.000469*(F_z_front))*F_z_front;

    F_F(step_count) = F_max_front;


    %Torque
    omega_wheel = v/r_Tyre;
    omega_motor = Gear_Ratio*omega_wheel;
    T_motors = min(T_Max*Wheel_Num, (P_Max*1000)/omega_motor); %from two motors
    T_wheels = T_motors*Gear_Ratio; %total between 2/4 wheels
    F_wheel = T_wheels/r_Tyre/Wheel_Num; %each wheel

    F_actual(step_count) = F_wheel;

    %CHECK WHEN THIS HAPPENS
    %{
    if T_Max*Wheel_Num > (P_Max*1000)/omega_motor
        disp(t)
        disp(v)
    end
    %}

    %Total Forces
    F_rear = min(F_max_rear, F_wheel);
    F_front = min(F_max_front, F_wheel);

    if Wheel_Num == 2
        F_net = 2*F_rear;
    else
        F_net = 2*F_front + 2*F_rear;
    end

    F_net = F_net - F_drag;

    %Acceleration
    a = F_net/(Mass_Car+Mass_Driver);

    % Euler's Method
    v = v + a * time_step;
    x = x + v * time_step;
    t = t + time_step;
    step_count = step_count + 1;

    %disp("Acceleration: "), disp(a)

    end
    final_time = t;

    %disp("Final velocity: "), disp(v)
    %disp("Final displacement: "), disp(x)
    
    %disp("Total Time:"), disp(t)

    %F_R = F_R(1:step_count-1);
    %F_F = F_F(1:step_count-1);
    %F_actual = F_actual(1:step_count-1);
    %disp(F_R)
    %disp(F_F)
    %disp(F_actual)
    %plot([F_R, F_F, F_actual])


end

disp("-------------------2024--------------------")

Time_array_2024 = zeros(1, 110);
Weight_array_2024 = zeros(1, 110);
count = 1;

for Weight_Bias = 0.1:0.01:1
    Weight_array_2024(count) = Weight_Bias;
    Time_array_2024(count) = eulers_method(RWD, Mass_2024, cogh_2024, Track_Length, Mass_Driver, g, Weight_Bias, Air_Density, ClA, CdA, Aero_Bias, T_Max, P_Max, Gear_Ratio, mu, r_Tyre, Wheelbase, true);
    count = count + 1;
end

Time_array_2024 = Time_array_2024(1:count-1);
Weight_array_2024 = Weight_array_2024(1:count-1);

disp("-------------------2025--------------------")
Time_array_2025 = zeros(1, 110);
Weight_array_2025 = zeros(1, 110);
count = 1;

for Weight_Bias = 0.01:0.01:1
    Weight_array_2025(count) = Weight_Bias;
    Time_array_2025(count) = eulers_method(XWD, Mass_2025, cogh_2025, Track_Length, Mass_Driver, g, Weight_Bias, Air_Density, ClA, CdA, Aero_Bias, T_Max, P_Max, Gear_Ratio, mu, r_Tyre, Wheelbase, true);
    Time_array_2025_noLLT(count) = eulers_method(XWD, Mass_2025, cogh_2025, Track_Length, Mass_Driver, g, Weight_Bias, Air_Density, ClA, CdA, Aero_Bias, T_Max, P_Max, Gear_Ratio, mu, r_Tyre, Wheelbase, false);
    count = count + 1;
end

Time_array_2025 = Time_array_2025(1:count-1);
Weight_array_2025 = Weight_array_2025(1:count-1);
Time_array_2025_noLLT = Time_array_2025_noLLT(1:count-1);

figure;
plot(Weight_array_2024, Time_array_2024, 'b-')
hold on
plot(Weight_array_2025, Time_array_2025, 'r-')
plot(Weight_array_2025, Time_array_2025_noLLT, 'g--')
hold off

xlabel('Weight Bias (Rear)') 
ylabel('End Time (s)')  
title('Effect of Weight Bias on End Time')  
legend('2024 Car', '2025 Car', '2025 Car no LLT')  
grid on  

