//
//  ViewController.swift
//  G76L2
//
//  Created by Ivan Vasilevich on 17.12.2019.
//  Copyright © 2019 RockSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		let pi = 3.14159
		var age = 27
		age = 22
		print("my age is \(age)")
		
		//		+ - * / %
		print("my age + pi = \(age + Int(pi))")
		
		
		var money = Int.random(in: 1...2_000_000)
		//		< > <= >= == !=
		let isBaby = age < Int(pi)
		let isReach = money > 1_000_000
		//		|| or / && and
		// 0 0
		// 1 0 || or
		// 0 1 || or
		// 1 1 && and || or
		if !isBaby && isReach {
			let age1 = 33
			print("baby")
			let x = 10
			print("x + age1", x + age1)
		} else {
//			print(x)
			print("school")
		}
		//		!Bool / Numbers -n/+n
		print("negative pi", 3.15 + -pi)
		//		+= -= *= /= %=
		age = age + 1
		age += 1
		age = 0
		
		for i in 0..<5 {
			age += i
			print(age)
		}
		
		choseWinner()
	}
	
	func choseWinner() {
		let candyNumber = Int.random(in: 0..<7)
		
		print("free candy to student #\(candyNumber)")
	}
	
	
}

