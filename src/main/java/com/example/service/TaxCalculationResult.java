package com.example.service;

public class TaxCalculationResult {
    private double grossSalary;
    private double tax;
    private double epf;
    private double etf;
    private double net_salary;

    TaxCalculationResult(double salary, double tax, double epf, double etf, double net_salary){
        this.grossSalary = salary;
        this.tax = tax;
        this.epf = epf;
        this.etf = etf;
        this.net_salary = net_salary;
    }
    public double getGrossSalary() {
        return grossSalary;
    }
    public double getTax() {
        return tax;
    }
    public double getEpf() {
        return epf;
    }
    public double getEtf() {
        return etf;
    }
    public double getNet_salary() {
        return net_salary;
    }
}
