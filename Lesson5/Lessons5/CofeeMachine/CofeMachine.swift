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
  let water = 500
  let milk = 750
  let beans = 350
  
  //capacity of tanks
  let waterTankCapasity = 2000
  let milkTankCapasity = 1000
  let beansTankCapasity = 2500
  let trashBinCapasity = 2500
  
  //tankState
  var waterTankLevel = 0
  var milkTankLevel = 0
  var beansTankLevel = 0
  var trashBinLevel = 0
  
  //portions for making product
  var waterPortion = 50
  var milkPortion = 50
  var beansPortion = 50
  var trashPortion = 50
  
  
  //check level of tanks
  func isEnoughIngridientsInTanks(waterTank: Int, milkTank: Int, beansTank: Int) -> Bool {
    var result: Bool = false
    if waterTankLevel >= waterPortion && milkTankLevel >= milkPortion && beansTankLevel >= beansPortion{
      result = true
    }
    return result
    
  }
  
  func isTrashBinIsEmpty(trashTank: Int) -> Bool {
    var result: Bool = false
    if trashBinLevel <= trashBinCapasity {
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
  
  func cleanTrashBin() {
    trashBinLevel = 0
  }
  
  //products
  func makeCapuchino() -> String {
    var labelText: String = ""
    if isTrashBinIsEmpty(trashTank: trashBinLevel) {
      if isEnoughIngridientsInTanks(waterTank: waterTankLevel, milkTank: milkTankLevel, beansTank: beansTankLevel)  {
        waterTankLevel -= waterPortion * 5
        beansTankLevel -= beansPortion * 2
        milkTankLevel -= milkPortion * 2
        trashBinLevel += beansPortion * 2
        labelText = "Capuchino ready \u{2615}"
        print("Capuchino ready :coffee:")
      } else {
        labelText = "not enought ingridients"
        print("not enought ingridients")
      }
    } else {
      labelText = "Clean trash bin"
      print("Clean trash bin")
    }
    return labelText
  }
  
  func makeEspresso() {
    if isTrashBinIsEmpty(trashTank: trashBinLevel) {
      if isEnoughIngridientsInTanks(waterTank: waterTankLevel, milkTank: milkTankLevel, beansTank: beansTankLevel) {
        waterTankLevel -= waterPortion * 2
        beansTankLevel -= beansPortion * 2
        milkTankLevel -= milkPortion * 1
        trashBinLevel += beansPortion * 2
        print("Espresso ready :coffee:")
      } else {
        print("not enought ingridients")
      }
    }  else {
      print("Clean trash bin")
    }
    
  }
  
}
