//
//  ViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 09.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
     
    
  }
  
  //resources income
  var water = 500
  var milk = 500
  var beans = 500
  
  //capacity of tanks
  let waterTankCapasity = 2000
  let milkTankCapasity = 1000
  let beansTankCapasity = 3000
  
  //tankState
  var waterTankState = 0
  var milkTankState = 0
  var beansTankState = 0
  
  
  //actions
  @IBAction func addMilkToTank() {
    print("milk")
    if milkTankState < milkTankCapasity {
      milkTankState += milk
      print(milkTankState)
    } else {
      print("milk tank is almost full - \(milkTankState). maximum capacity is \(milkTankCapasity)")
    }
  }
  
  @IBAction func addWaterToTank() {
    print("water")
    if waterTankState < waterTankCapasity {
      waterTankState += water
      print(waterTankState)
    } else {
      print("water tank is almost full - \(waterTankState). maximum capacity is \(waterTankCapasity)")
    }
  }
  
  func addBeansToTank() {
    
  }
  
  
  //products
  
  func makeCapuchino() {

    
  }
  
  func makeEspresso() {
    
  }
  

  
  
  
  
}
