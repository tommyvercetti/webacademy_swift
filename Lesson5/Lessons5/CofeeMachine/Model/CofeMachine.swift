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
  let waterIncome = 500
  let milkIncome = 750
  let beansIncome = 350
  
  //capacity of tanks
  let waterTankCapasity = 2000
  let milkTankCapasity = 1000
  let beansTankCapasity = 2500
  let trashBinCapasity = 2500
  
  //tankState
  var waterTankLevel = 500
  var milkTankLevel = 750
  var beansTankLevel = 350
  var trashBinLevel = 0
  
  //portions for making product
  var waterPortion = 50
  var milkPortion = 50
  var beansPortion = 50
  var trashPortion = 50
  
  var waterForProductPortion = 0
  var milkForProductPortion = 0
  var beansForProductPortion = 0
  var trashForProductPortion = 0
  
  //check level of tanks
  func isEnoughIngridientsInTanks(waterTank: Int, milkTank: Int, beansTank: Int) -> Bool {
    var result: Bool = false
    
    // add as recipes and check avilability for each recipe
    if waterTankLevel >= waterForProductPortion && milkTankLevel >= milkForProductPortion && beansTankLevel >= beansForProductPortion{
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
  func addMilkToTank() -> String {
    var labelText: String = ""
    if (milkTankLevel + milkIncome) < milkTankCapasity {
      milkTankLevel += milkIncome
      labelText = "Level of Milk is \(milkTankLevel)"
    } else {
      labelText = "milk tank is almost full - \(milkTankLevel). maximum capacity is \(milkTankCapasity)"
      
    }
    return labelText
  }
  
  func addWaterToTank() -> String {
    var labelText: String = ""
    if (waterTankLevel + waterIncome) < waterTankCapasity {
      waterTankLevel += waterIncome
      labelText = "Level of Water is \(waterTankLevel)"
    } else {
      labelText = "water tank is almost full - \(waterTankLevel). maximum capacity is \(waterTankCapasity)"
    }
    return labelText
  }
  
  func addBeansToTank() -> String {
    var labelText: String = ""
    if (beansTankLevel + beansIncome) < beansTankCapasity {
      beansTankLevel += beansIncome
      labelText = "Level of Beans is \(beansTankLevel)"
    } else {
      labelText = "beans tank is almost full - \(beansTankLevel). maximum capacity is \(beansTankCapasity)"
    }
    return labelText
  }
  
  func cleanTrashBin() -> String {
    let labelText: String = "Bin cleaned"
    trashBinLevel = 0
    return labelText
  }
  
  //products
  
  func initialRecipe(recipeNumber: Int) -> String{
    var labelText: String = ""
    if isTrashBinIsEmpty(trashTank: trashBinLevel) {
      if isEnoughIngridientsInTanks(waterTank: waterTankLevel, milkTank: milkTankLevel, beansTank: beansTankLevel) {
        
        switch recipeNumber {
        case 1:
          //Capuchino
          waterTankLevel -= waterPortion * 3
          beansTankLevel -= beansPortion * 2
          milkTankLevel -= milkPortion * 1
          trashBinLevel += beansPortion * 2
          labelText = "Capuchino ready \u{2615}"
        case 2:
          //Espresso
          waterTankLevel -= waterPortion * 1
          beansTankLevel -= beansPortion * 2
          milkTankLevel -= milkPortion * 0
          trashBinLevel += beansPortion * 2
          labelText = "Espresso ready \u{2615}"
        default:
          print("ololo")
        }
      }
      else {
        labelText = "not enought ingridients"
      }
    }  else {
      labelText = "Clean trash bin"
    }
    return labelText
  }
  
  func makeCapuchino() -> String {
    initialRecipe(recipeNumber: 1)
  }
  
  func makeEspresso() -> String {
    initialRecipe(recipeNumber: 2)
  }
  
}






