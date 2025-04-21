# UQ Racing Straight Line Acceleration Simulation
This project presents a theoretical model and analysis in MATLAB for the Formula SAE 75m straight-line acceleration event, based on UQ Racing's 2024 and proposed 2025 cars. 

# Purpose

To develop an accurate model of sensitive vehicle parameters influencing acceleration performance, with the aim of identifying optimisations for this event and benchmarking the 2025 AWD vehicle against the 2024 RWD design.

# Findings
As seen in the plots within the folder visuals, the 2025 car's FWD power is limited by static friction limits on the front tyres at its current weight bias (0.53 from the front axle), meaning power application must initially be limited to avoid wheelspin (motor power available > traction limit) - see Figure 1. This is due to longitudinal load transfer (LLT) which is a function of acceleration. The large initial acceleration shifts much of the load on the front tyres to the rear tyres, reducing front tyre traction to below the motor torque threshold. 

It is intuitive that reducing the weight bias (placing more static load on the front wheels) improves power transfer. This counteracts the effect of LLT, which would otherwise reduce front tyre traction during launch. This results in more even traction between the front and rear tyres at launch. As acceleration decreases, the load distribution then rebalances towards the front. The motor power curve in Figure 1 shows that maintaining a balanced load distribution to maximise traction is most important in the first few seconds of the event, when motor power is at a maximum. Later, it is limited by the angular velocity of the wheels. Hence, the weight shift back towards the front of the car as acceleration is reduced does not limit torque to the wheels for the rest of the event. 

Figure 2 plots time against weight bias for the 2024 (RWD) and 2025 cars. A third line shows the same relationship ignoring the effect of LLT, highlighting how this consideration shifts the optimal weight bias more towards the front of the car. The plot shows that when the impact of LLT is ignored, the optimal weight bias is at the centre of the car, around 0.4 - 0.6. With the effect of LLT considered, the optimal bias is in the range of 0.15-0.4 (Figure 2), a significant difference.

The 2025 car has a potential ~0.8 seconds reduction in time compared to the 2024 car at the optimal weight bias, a significant improvement due to the additional power available through the AWD setup.

At its optimal weight bias, the 2025 AWD car could save ~0.8 seconds in acceleration time compared to the 2024 RWD car; a substantial improvement enabled by the AWD system.

However, it is important to note that the "optimal" weight bias for this event has significant drawbacks for other events:
* LLT combined with a front-heavy weight bias will result in minimal rear wheel traction under braking, creating instability
* Shifting the weight bias heavily to the front will cause front tyres to become overloaded under cornering, increasing tyre deformation and leading to understeer

While these factors make a heavily front-biased setup impractical for most events, quantifying its impact in a straight-line acceleration context is still useful to highlight where traction limits arise and how performance can theoretically be optimised.

![image 1](Visuals/Contact-Patch-Forces.jpg)
Figure 1: Forces acting at contact patch


![image 2](Visuals/Effect-of-Weight-Bias-on-End-Time.jpg)
Figure 2: Weight bias vs end time
