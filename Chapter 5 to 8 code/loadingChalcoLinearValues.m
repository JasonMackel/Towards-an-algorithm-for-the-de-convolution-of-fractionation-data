function [lambda, const] = loadingChalcoLinearValues()

L2M3 = 1000;
CrossArea = 0.00432;
lambda = 0.0953415218/(L2M3*CrossArea);
const = 3.6041588830/(L2M3*CrossArea);