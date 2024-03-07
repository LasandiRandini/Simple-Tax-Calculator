package com.example.service;

import jakarta.jws.WebMethod;
import jakarta.jws.WebService;

@WebService
public interface taxCalculator {

    @WebMethod
    double taxCalculation(double salary);

    @WebMethod
    double epfCalculation(double salary);

    @WebMethod
    double etfCalculation(double salary);
}
