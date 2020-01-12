//
//  CofeMachine.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 10.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class CofeMachine: NSObject {
  //resources income
  var water = 500
  var milk = 750
  var beans = 350
  
  //capacity of tanks
  let waterTankCapasity = 2000
  let milkTankCapasity = 1000
  let beansTankCapasity = 2500
  
  //tankState
  var waterTankLevel = 0
  var milkTankLevel = 0
  var beansTankLevel = 0
  
  //portions for making product
  var waterPortion = 50
  var milkPortion = 50
  var beansPortion = 50
  
  
  
  //check level of ingridients
  func isEnoughIngridientsInTanks(waterTank: Int, milkTank: Int, beansTank: Int) -> Bool {
    var result: Bool = false
    if waterTankLevel >= waterPortion && milkTankLevel >= milkPortion && beansTankLevel >= beansPortion{
      result = true
    }
    return result
    
  }
  
  
  
  //actions
  func addMilkToTank() {
    print("milk")
    if (milkTankLevel + milk) < milkTankCapasity {
      milkTankLevel += milk
      print(milkTankLevel)
    } else {
      print("milk tank is almost full - \(milkTankLevel). maximum capacity is \(milkTankCapasity)")
    }
  }
  
  func addWaterToTank() {
    print("water")
    if (waterTankLevel + water) < waterTankCapasity {
      waterTankLevel += water
      print(waterTankLevel)
    } else {
      print("water tank is almost full - \(waterTankLevel). maximum capacity is \(waterTankCapasity)")
    }
  }
  
  func addBeansToTank() {
    print("beans")
    if (beansTankLevel + beans) < beansTankCapasity {
      beansTankLevel += beans
      print(beansTankLevel)
    } else {
      print("beans tank is almost full - \(beansTankLevel). maximum capacity is \(beansTankCapasity)")
    }
  }
  
  //products
  
  func makeCapuchino() {
    if isEnoughIngridientsInTanks(waterTank: waterTankLevel, milkTank: milkTankLevel, beansTank: beansTankLevel) {
      waterTankLevel -= waterPortion * 5
      beansTankLevel -= beansPortion * 2
      milkTankLevel -= milkPortion * 1
      print("water level - \(waterTankLevel)")
      print("beans level - \(beansTankLevel)")
      print("milk level - \(milkTankLevel)")
    } else {
      print("not enought ingridients")
    }
    
    
  }
  
  func makeEspresso() {
    waterTankLevel -= 150
    beansTankLevel -= 150
    milkTankLevel -= 150
    print("water level - \(waterTankLevel)")
    print("beans level - \(beansTankLevel)")
    print("milk level - \(milkTankLevel)")
  }
  
}
