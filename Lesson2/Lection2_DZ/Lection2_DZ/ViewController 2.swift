//
//  ViewController.swift
//  Lection2_DZ
//
//  Created by Andrian Kryk on 18.12.2019.
//  Copyright © 2019 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Assignment #2. Block 1.
        //Задача 0. Вывести на экран наибольшее из двух чисел
        
        greaterNumber()
        delineator()
        
        //Задача 1. Вывести на экран квадрат и куб числа
        
        powerNumber()
        delineator()
        
        //        Задача 2. Вывести на экран все числа до заданного и в обратном порядке до 0
        //        Пример с числом 5:
        //        Вывод в консоль:
        //        Возрастание
        //        0
        //        1
        //        2
        //        3
        //        4
        //        Спадание
        //        4
        //        3
        //        2
        //        1
        //        0
        //        ИЛИ
        //        Возрастание    спадание
        //        0                        4
        //        1                        3
        //        2                        2
        //        3                        1
        //        4                        0
        increaseDecreaseNumber()
        delineator()
        
        //        Задача 3. Подсчитать общее количество делителей числа и вывести их
        totalAmmountOfDivisors()
        delineator()
        
        //        Задача 4. Проверить, является ли заданное число совершенным и найти их (делители)
        //
        //        Примеры
        //
        //        1-е совершенное число — 6 имеет следующие собственные делители: 1, 2, 3; их сумма равна 6.
        //
        //        2-е совершенное число — 28 имеет следующие собственные делители: 1, 2, 4, 7, 14; их сумма равна 28.
        //
        //        3-е совершенное число — 496 имеет следующие собственные делители: 1, 2, 4, 8, 16, 31, 62, 124, 248; их сумма равна 496.
        //
        //        4-е совершенное число — 8128 имеет следующие собственные делители: 1, 2, 4, 8, 16, 32, 64, 127, 254, 508, 1016, 2032, 4064; их сумма равна 8128.
        foundPerfectNumber()
        delineator()
        
    }
    
    func delineator() {
        print("*************************")
    }
    
    func greaterNumber() {
        let number1 = Int.random(in: 1...10)
        let number2 = Int.random(in: 1...10)
        if number1 > number2 {
            print("\(number1) is greater than \(number2)")
        }else if number1 < number2{
            print("\(number1) is greater than \(number2)")
        }else if number1 == number2{
            print("\(number1) = \(number2)")
        }
    }
    
    func powerNumber() {
        let randomNumber = Int.random(in: 1...10)
        let powerTwo = randomNumber*randomNumber
        let powerThree = randomNumber*randomNumber*randomNumber
        
        print("\(randomNumber) в квадрате = \(powerTwo), а \(randomNumber) в кубе = \(powerThree)")
    }
    
    func increaseDecreaseNumber() {
        let number =  Int.random(in: 1...10)
        print("number is - \(number)")
        var tempVarOne = -1
        var tempVarTwo = number
        print("Increase      Decrease")
        for _ in 0..<number {
            tempVarOne += 1
            tempVarTwo -= 1
            print("\(tempVarOne)             \(tempVarTwo)")
        }
    }
    
    func totalAmmountOfDivisors() {
        let number = 6 //Int.random(in: 0...100) //- remove hardcoded value to use randomizator
        print("Random number is - \(number)")
        var countDivisors = 0
        for i in 1...number {
            if number%i == 0 {
                countDivisors += 1
                print("Divisor - \(i)")
            }
        }
        print("Total ammount of divisors \(countDivisors)")
    }
    
    func foundPerfectNumber() {
        let number = 6 //Int.random(in: 0...100) //- remove hardcoded value to use randomizator
        print("Random number is - \(number)")
        var countSumOfDivisors = 0
        for i in 1..<number {
            if number%i == 0 {
                print("Divisor - \(i)")
                countSumOfDivisors += i
            }
        }
        print("Sum of divisors = \(countSumOfDivisors)")
        if number == countSumOfDivisors {
            print("Number \(number) is perfect number")
        }else {
            print("Number \(number) isn't perfect number")
        }
    }
}

