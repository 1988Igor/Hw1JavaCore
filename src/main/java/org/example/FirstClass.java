package org.example;

import java.util.Scanner;



public class FirstClass {
    /*
    In this class we have the main logic to colect data from the user
    throw Scanner  function.
     */
    Scanner scanner;


    public FirstClass() {
       this.scanner = new Scanner(System.in);
    }
    public void run() {

        String name = setData("Enter your name:");
        String age_str = setData("Enter your age:");

        int age = 0;
        try {
            age = Integer.parseInt(age_str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
            Decorator.helloUser(name, age);
        
    }
    public String setData(String msg) {
        System.out.println(msg);
        return scanner.nextLine();

    }
}
