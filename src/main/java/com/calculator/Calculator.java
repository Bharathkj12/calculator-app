package com.calculator;

public class Calculator {
    
    // Method to add two numbers
    public int add(int a, int b) {
        return a + b;
    }

    // Method to subtract two numbers
    public int subtract(int a, int b) {
        return a - b;
    }

    // Method to multiply two numbers
    public int multiply(int a, int b) {
        return a * b;
    }

    // Method to divide two numbers
    public int divide(int a, int b) {
        if (b == 0) {
            throw new ArithmeticException("Cannot divide by zero");
        }
        return a / b;
    }

    // Main method to run the calculator application
    public static void main(String[] args) {
        Calculator calculator = new Calculator();

        // Sample calculations
        System.out.println("Addition: " + calculator.add(10, 5));      // Output: 15
        System.out.println("Subtraction: " + calculator.subtract(10, 5)); // Output: 5
        System.out.println("Multiplication: " + calculator.multiply(10, 5)); // Output: 50
        System.out.println("Division: " + calculator.divide(10, 5));      // Output: 2
        
        // Handle division by zero
        try {
            System.out.println("Division by zero: " + calculator.divide(10, 0));
        } catch (ArithmeticException e) {
            System.out.println(e.getMessage()); // Output: Cannot divide by zero
        }
    }
}
