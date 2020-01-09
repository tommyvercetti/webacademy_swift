//
//  ViewController.swift
//  G76L4
//
//  Created by Ivan Vasilevich on 24.12.2019.
//  Copyright © 2019 RockSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
//		foo(12)
//		foo(33)
//		sayHello(to: "Ivan")
		wirkWithString()
//		optionalTypeExample()
		workWithArrays()
	}
	
	func foo(_ argh1: Int) {
		print("argh1", argh1)
	}
	
	func sayHello(to name: String) {
		print("Hello \(name)")
	}
	
	func wirkWithString() {
		let name = "Ivan"
		let lastName = "Besarab"
		//		NSString("fdfdfdf")
		let message = "\"\(name)\" consist of \(name.count) characters" as NSString
		print(message)
		print(message.substring(to: 3))
		print(message.substring(from: 3))
		let rangeOfConsistWord = NSRange.init(location: 7, length: 7)
		print(message.substring(with: rangeOfConsistWord))
		
		let someInt = Int()
		foo(someInt)
	}
	
	func optionalTypeExample() {
		let number = 5
		let numberString = "3 4"//String(number)
		print(numberString)
		let numberFromStr = Int(numberString)
		print(numberFromStr)
		
		// optional bindidng
		if let realNumber = numberFromStr {
			print("realNumber", realNumber + 3)
		} else {
			print("enter correct number")
		}
		
		//	default value
		print((numberFromStr ?? 0) + 3)
		
		//	force unwrap
		print(numberFromStr! + 3)
	}
	
	func workWithArrays() {
		var arrayNumbers = [9, 66, 3]
		print(arrayNumbers[0])
		arrayNumbers[1] = 45 // replace
		print(arrayNumbers[1])
		print(arrayNumbers.count)
		arrayNumbers.remove(at: 0)
		print(arrayNumbers.count)
		
		for _ in 0..<20 {
			arrayNumbers.append(Int.random(in: 0...10))
		}
		print(arrayNumbers)
		
		for i in 0..<arrayNumbers.count {
			let element = arrayNumbers[i]
			print(element)
		}
	}


}

