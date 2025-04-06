# UQ Racing Straight Line Acceleration Simulation
A model of the 2024 and 2025 UQ Racing Formula SAE cars for the 75m straight line acceleration event

# Purpose
Produce an accurate model of various sensitive parameters to determine optimisations to improve time for this event
Specifically analysed the effect of weight bias on finishing time for both years cars, with interesting findings

# Findings
As seen in the plots within the folder visuals, the 2025 car's FWD power is limited by static friction limits on the front tyres at its current weight bias (0.53 from the front axle) - see Figure 1.
It can be seen that reducing the weight bias to put more weight over the front wheels allows for better power transfer. This doesn't sacrifice grip on the rear tyres as the effect of longitudinal load transfer (LLT) shifts more weight onto the rear tyres. The plot shows that when the effect of LLT is ignored, the optimal weight bias is around 0.4 - 0.6 however with the effect of LLT, the optimal bias is closer to 0.15-0.35 (Figure 2).

![image 1](Visuals/Contact-Patch-Forces.jpg)
Figure 1: Forces acting at contact patch


![image 2](Visuals/Effect-of-Weight-Bias-on-End-Time.jpg)
Figure 2: Weight bias vs end time
