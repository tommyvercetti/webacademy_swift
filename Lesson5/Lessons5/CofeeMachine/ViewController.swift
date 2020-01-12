//
//  ViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 09.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let firstMachine = CofeMachine.init()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }
  
  @IBAction func addMilkButton() {
    firstMachine.addMilkToTank()
  }
  
  @IBAction func addWaterButton() {
    firstMachine.addWaterToTank()
  }
  
  @IBAction func addBeansButton() {
    firstMachine.addBeansToTank()
  }
  
  @IBAction func makeCapuchinoButton() {
    firstMachine.makeCapuchino()
  }
  
  @IBAction func makeEspressoButton() {
    firstMachine.makeEspresso()
  }
  
  @IBAction func showLevelOfIngridientsButton() {
    print("Water tank - \(firstMachine.waterTankLevel)")
    print("Milk tank - \(firstMachine.milkTankLevel)")
    print("Beans tank - \(firstMachine.beansTankLevel)")
    print("Trash bin - \(firstMachine.trashBinLevel)")
  }
  
  
}



