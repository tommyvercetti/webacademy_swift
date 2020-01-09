//
//  ViewController.swift
//  G76L5
//
//  Created by Ivan Vasilevich on 26.12.2019.
//  Copyright © 2019 RockSoft. All rights reserved.
//
//  ===Agenda===
//
//  0) Dictionary
//  1) Sort/Filter/Map
//  2) Custom Class

import UIKit

class ViewController: UIViewController {

	var bar = 44
	let plasticYelka = NewYearTree.init(isNatural: false)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		workWithDictionaries()
//		let bar = 33
//
//		print(bar) // 33
		print(self.bar) // 44
		
		happyNewYear()
	}
	
	func workWithDictionaries() {
		let dict = ["Ambulance" : "103",
					"Police" : "102",
					"Fire" : "101"]
		print(dict["Police"])
		print(dict)
	}
	
	func collectionModifiers() {
		var collection = 0...(8 * 2)
		print( collection.filter{$0 % 2 != 0}.reduce(0, +))
		let arr = [1, 1, 2, 9, 3]
		// sort
		print(arr.sorted(by: { (n1, n2) -> Bool in
			return n1 > n2
		}))
		
		print(arr.sorted(by: { (n1, n2) -> Bool in
			n1 > n2
		}))
		
		print(arr.sorted(by: {
			$0 > $1
		}))
		
		// filter
		print(arr.filter({ (n1) -> Bool in
			n1 > 1
		}))
		
		print(arr.filter({ $0 > 1}))
		
		let p1 = CGPoint(x: 15, y: 30)
		let p2 = CGPoint(x: 55, y: 33)
		let points = [p1, p2]
		print(points)
		
		// map
		let descr = points.map { (point) -> String in
			return "x:\(point.x)\ty:\(point.y)"
		}
		
		// forEach
		descr.forEach { (strPoint) in
			print(strPoint)
		}
		
		// for in
		for strPoint in descr {
			print(strPoint)
		}
		
		
	}
	
	func randNum() -> Int {
		Int.random(in: 0..<100)
	}
	
	func happyNewYear() {
		print(plasticYelka)
		plasticYelka.standUp()
//		print(plasticYelka.isStolen)
	}

	@IBAction func button1Pressed() {
		bar += 1
		print(bar)
	}
  
  @IBAction func button2Pressed() {
  }
  
}

