//
//  ViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 09.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!{
    didSet{
      titleLabel.text = "Imagine, there is no spoon \u{1F944}"
    }
  }
  
  let firstMachine = CofeMachine.init()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    
  }
  
  @IBAction func addMilkButton() {
    titleLabel.text = firstMachine.addMilkToTank()
  }
  
  @IBAction func addWaterButton() {
    titleLabel.text = firstMachine.addWaterToTank()
  }
  
  @IBAction func addBeansButton() {
    titleLabel.text = firstMachine.addBeansToTank()
  }
  
  @IBAction func cleanBinButton(_ sender: UIButton) {
    titleLabel.text = firstMachine.cleanTrashBin()
  }
  
  
  
  @IBAction func showLevelOfIngridientsButton() {
    titleLabel.text = """
    Water tank - \(firstMachine.waterTankLevel)
    Milk tank - \(firstMachine.milkTankLevel)
    Beans tank - \(firstMachine.beansTankLevel)
    Trash bin - \(firstMachine.trashBinLevel)
    """
    titleLabel.numberOfLines = 4
  }
  
  @IBAction func makeCapuchinoButton() {
    titleLabel.text = firstMachine.makeCapuchino()
  }
  
  @IBAction func makeEspressoButton() {
    titleLabel.text = firstMachine.makeEspresso()
  }
}



