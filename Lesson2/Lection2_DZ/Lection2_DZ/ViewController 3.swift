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
        
        //        Assignment #2. Block 2.
        //        Задача 1. Остров Манхэттен был приобретен поселенцами за $24 в 1826 г. Каково было бы в настоящее время состояние их счета, если бы эти 24 доллара были помещены тогда в банк под 6% годового дохода?
        
        manhattan()
        delineator()
        
        //        Задача 2. Ежемесячная стипендия студента составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, какую нужно иметь сумму денег, чтобы прожить учебный год (10 месяцев), используя только эти деньги и стипендию.
        
        needs()
        delineator()
        
        //        Задача 3. У студента имеются накопления 2400 грн. Ежемесячная стипендия составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, сколько месяцев сможет прожить студент, используя только накопления и стипендию.
        
        needs2()
        delineator()
        
        //        Задача 4. 2хзначную цело численную переменную типа 25, 41, 12. После выполнения вашей программы у вас в другой переменной должно лежать это же число только задом на перед 52, 14, 21
        
        //        Пример с числом 52
        //        Вывод в консоль:
        //        Перевернув число 52 получим 25
        
        digitsRotation()
        delineator()
        
    }
    
    func digitsRotation() {
        var firstNumber = Int.random(in: 1_000_000...999_999_999)
        print("Number is - \(firstNumber)")
        
        var secondNumber = 0
        
        while firstNumber > 0 {
            var tempNumber = 0
            tempNumber = firstNumber % 10
            firstNumber = firstNumber / 10
            secondNumber = secondNumber * 10
            secondNumber = secondNumber + tempNumber
        }
        print("Rotated number is - \(secondNumber)")
    }
    
    func needs() {
        let scholarship = 700.0
        var expenseOneMonth = 1000.0
        let inflation = 0.03
        let months = 10
        var wholeExpence = 0.0
        let income = scholarship*Double(months)
        
        for _ in 0..<months {
            expenseOneMonth += (expenseOneMonth*inflation)
            wholeExpence += expenseOneMonth
        }
        print("Whole expence will be - \(wholeExpence)")
        
        let needs = (income - expenseOneMonth)
        print("You need additional \(needs) UAH")
    }
    
    func needs2() {
        let scholarship = 700.0
        var expenseOneMonth = 1000.0
        let inflation = 0.03
        var months = 0
        var balance = 2400.0
        print(" balance on start - \(balance+scholarship)")
        
        repeat{
            months += 1
            print("\(months) month passed")
            
            expenseOneMonth = expenseOneMonth + (expenseOneMonth * inflation)
            print("expenseOneMonth - \(expenseOneMonth)")
            
            balance = balance + scholarship - expenseOneMonth
            print("balance after \(months) month - \(balance)")
            print("----------")
            
        }while balance > expenseOneMonth
        print("this is the end. sudent died after \(months) months")
    }
    
    func manhattan() {
        var price = 24.0
        let percent = 0.06
        let firstYear = 1826
        let lastYear = 2019
        
        for i in firstYear...lastYear {
            price = price+(price*percent)
            print("Income in year - \(i) was - \(price)")
        }
    }
    
    func delineator() {
        print("\n ************************* \n ")
    }
}

