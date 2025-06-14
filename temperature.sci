// Define temperature range
T_min = 20;  // Minimum temperature (°C)
T_max = 40;  // Maximum temperature (°C)

// Define voltage output from LM35
V_min = T_min * 0.01;  // Voltage at min temp
V_max = T_max * 0.01;  // Voltage at max temp

// Generate temperature values for simulation
temperature = linspace(T_min, T_max, 100);  // Temperature samples
voltage = temperature * 0.01;  // Corresponding sensor voltage
// Initialize fan speed array
fanSpeed = zeros(1, length(temperature));

for i = 1:length(temperature)
    if temperature(i) < 25 then
        fanSpeed(i) = 0;  // Fan off
    elseif temperature(i) >= 25 & temperature(i) < 35 then
        fanSpeed(i) = (temperature(i) - 25) * (255 / (35 - 25));  // Linear increase
    else
        fanSpeed(i) = 255;  // Full speed
    end
end
clf;
plot(temperature, fanSpeed, 'r');
xlabel("Temperature (°C)");
ylabel("Fan Speed (PWM Duty Cycle)");
title("Temperature-Based Fan Speed Control System");
