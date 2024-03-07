package com.example.service;

import jakarta.jws.WebMethod;
import jakarta.jws.WebService;

@WebService
public class taxCalculatorImplent implements taxCalculator{

    @WebMethod
    public double taxCalculation(double salary){
            // Define the tax brackets and rates
            double[][] brackets = {
                    {0, 100000, 0.0}, // Added lower bound for the first bracket
                    {100000, 141667, 0.06},
                    {141667, 183333, 0.12},
                    {183333, 225000, 0.18},
                    {225000, 266667, 0.24},
                    {266667, 308333, 0.30},
                    {308333, Double.POSITIVE_INFINITY, 0.36}
            };

            double tax = 0.0;
            for (int i = 0; i < brackets.length; i++) {
                if (salary > brackets[i][0]) {
                    if (i == brackets.length - 1 || salary < brackets[i + 1][0]) {
                        tax += (Math.min(salary, brackets[i][1]) - brackets[i][0]) * brackets[i][2];
                        break;
                    } else {
                        tax += (brackets[i][1] - brackets[i][0]) * brackets[i][2];
                    }
                }
            }
            return tax;
        }

    @WebMethod
    public double epfCalculation(double salary) {
        // Employer's contribution is 12% and Employee's contribution is 8%, totaling 20%.
        double totalEPFContribution = salary * 0.20; // 20% of salary
        return totalEPFContribution;
    }

    @WebMethod
    public double etfCalculation(double salary) {
        // Employer's contribution to ETF is 3% of the employee's monthly total earnings.
        double etfContribution = salary * 0.03; // 3% of salary
        return etfContribution;
    }
}
