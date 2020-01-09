//
//  NewYearTree.swift
//  G76L5
//
//  Created by Ivan Vasilevich on 26.12.2019.
//  Copyright © 2019 RockSoft. All rights reserved.
//

import UIKit

class NewYearTree: NSObject {
	
	override var description: String {
		let mark = isStolen ? "S" : "!S"
		return super.description + "\n" + "yelka matalka is, natural: \(isNatural)".uppercased() + " [\(mark)]"
	}
	
	let isNatural: Bool
	private let isStolen: Bool
	
	init(isNatural: Bool) {
		self.isNatural = isNatural
		isStolen = Bool.random()
	}
	
	func standUp() {
		if isStolen {
			print("break")
		} else {
			print("standingUp")
		}
		
		isStolen ? print("break") : print("standingUp")
		print(isStolen ? "break" : "standingUp")
	}

}
