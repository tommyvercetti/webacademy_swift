//
//  ViewController.swift
//  G76L3
//
//  Created by Ivan Vasilevich on 19.12.2019.
//  Copyright © 2019 RockSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		var x = 19
		x = 2
		move(count: x)
		move()
		
		print("coffe break")
		
		x = 4
		move(count: x)
		move()
		move(count: 12)
		
		pow(number: 3, p: 0)
		let s1 = sum(numberA: Double(x), numberB: 3)
		let s2 = sum(numberA: 3, numberB: 4)
		
		print("s1 = \(s1) , s2 = \(s2)")
		
		drawBox()
		drawBox()
		drawBox()
		drawBox()
        
        sum(numberA: 2, numberB: 3)
		
		workWithStrings()
        
        print(foo())
	}

	func move(count: Int = 1) {
		for _ in 0..<count {
			print("robot move")
		}
	}
	
	func pow(number: Double, p: Int) {
		var result = number
		if p == 0 {
			result = 1
		} else {
			for _ in 0..<p-1 {
				result = result * number
			}
		}
		print("\(number)^\(p) = \(result)")
	}
	
	func sum(numberA: Double, numberB: Double) -> Double {
		let result = numberA + numberB
		print("\(numberA) + \(numberB) = \(result)")
		return result
	}
	
	func foo() -> Double {
		var result: Double
		result = 5
		print("void func")
		return result
	}
	
	var count = 0
	
	func drawBox() {
		count += 1
		let box = UIView(frame: CGRect(x: 100, y: 200, width: 32, height: 32))
		
//		if count == 1 {
//			box.backgroundColor = .black
//		}
//		else if count == 1 {
//			box.backgroundColor = .red
//		}
//		else if count == 3 {
//			box.backgroundColor = .blue
//		} else {
//			box.backgroundColor = .brown
//		}
		
		switch count {
		case 1:
			box.backgroundColor = .black
		case 2:
			box.backgroundColor = .red
		case 3:
			box.backgroundColor = .blue
		default:
			box.backgroundColor = .brown
		}
		
		view.addSubview(box)
	}
	
	func workWithStrings() {
		let str = "5" + "6"
		print(str)
	}
	

}

