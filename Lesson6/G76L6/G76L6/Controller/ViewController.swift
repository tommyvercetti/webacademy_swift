//
//  ViewController.swift
//  G76L6
//
//  Created by Ivan Vasilevich on 09.01.2020.
//  Copyright © 2020 RockSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	var clickCount = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		titleLabel.text = "hello"
		increaseRunCount()
		colorifer()
		playWithImage()
	}

	@IBAction func buttonPressed(_ sender: UIButton) {
		clickCount += 1
		let url = getDocumentsDirectory().appendingPathComponent("timing.plist")
		let writtenData = NSMutableDictionary(contentsOf: url)!
		writtenData.setValue(clickCount, forKey: Date().description)
		writtenData.write(to: url, atomically: false)
		print(url)
		
		
		print(writtenData as! [String: Any])
		
		print(sender.currentTitle!)
		sender.backgroundColor = .red
		titleLabel.text = Date().description
	}
	
	private func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		let documentsDirectory = paths[0]
		return documentsDirectory
	}
	
	func increaseRunCount() {
		let value = UserDefaults.standard.integer(forKey: Constants.kRunCount) + 1
		titleLabel.text = "RUN #\(value)"
		UserDefaults.standard.setValue(value, forKey: Constants.kRunCount)
	}
	
	func colorifer() {
		let someColor = UIColor(rgb: 0xfcba03)// UIColor.init(red: 34/255.0, green: 0.5, blue: 224/255.0, alpha: 1)
		titleLabel.backgroundColor = someColor
		view.backgroundColor = .red
	}
	
	func playWithImage() {
		imageView.backgroundColor = .blue
//		let image =
		imageView.image = UIImage(named: "car")//image
	}
	
}
