//
//  ViewController.swift
//  Lection2_DZ
//
//  Created by Andrian Kryk on 18.12.2019.
//  Copyright © 2019 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //С помощью кода drawBox см листинг с лекции, нарисовать цель и пирамиду из кубиков       
        
        drawPyramid(ammountOfBoxes: 10)
        
        drawTarget(ammountOfCircles: 9)
        
    }
    
    func drawBox(boxColor: Int,
                 xBoxPosition: Double,
                 yBoxPosition: Double,
                 boxWidth: Double,
                 boxHeight: Double,
                 cornerRadius: CGFloat) {
        
        let box = UIView(frame: CGRect(x: xBoxPosition,
                                       y: yBoxPosition,
                                       width: boxWidth,
                                       height: boxHeight))
        
        box.layer.cornerRadius = cornerRadius
        
        switch boxColor {
        case 1:
            box.backgroundColor = .blue
        case 2:
            box.backgroundColor = .red
        case 3:
            box.backgroundColor = .black
        default:
            box.backgroundColor = .green
        }
        view.addSubview(box)
    }
    
    func drawPyramid(ammountOfBoxes: Int) {
        let boxSize = 35.0
        var offsetByX = 0.0 //Сдвиг для квадратов по оси Х
        var offsetByY = 0.0 //Сдвиг для квадратов по оси У
        let offsetGeneral = boxSize + (boxSize * 0.1) // Общий сдвиг квадрата для любой из осей
        var halfOffsetByX = offsetByX / 2 //Сдвиг по оси Х для отрисовки следующей линии
        var decrement = ammountOfBoxes //декремент кол-ва квадратов в каждой новой линии
        let widthOfPyramid = (boxSize * Double(ammountOfBoxes)) + ((offsetGeneral - boxSize) * Double((ammountOfBoxes - 1)))
        let startXPosition = view.frame.midX - CGFloat(widthOfPyramid/2)
        let startYPosition = view.frame.maxY - CGFloat(boxSize)
        
        for _ in 0..<ammountOfBoxes {
            offsetByX = 0
            for _ in 0..<decrement {
                drawBox(boxColor: Int.random(in: 0...3),
                        xBoxPosition: Double(startXPosition) + offsetByX + halfOffsetByX,
                        yBoxPosition: Double(startYPosition) - offsetByY,
                        boxWidth: boxSize,
                        boxHeight: boxSize,
                        cornerRadius: 8.0)
                offsetByX += offsetGeneral
            }
            offsetByY += offsetGeneral
            halfOffsetByX += offsetGeneral/2
            decrement -= 1
        }
    }
    
    func drawTarget(ammountOfCircles: Int)  {
        let startXPosition = 25.0
        let startYPosition = 25.0
        let targetSize = 80.0
        var colorValue = 1 //значение для цветовой раскраски элементов цели
        var targetSizeReducer = 0.0 //уменьшитель следующего елемента цели
        var roundedCornerReduser = 40.0 // уменьшитель для округления углов следующего елемента цели
        var offsetByX = 0.0 //Сдвиг для квадратов по оси Х
        var offsetByY = 0.0 //Сдвиг по оси У
        
        for _ in 0..<ammountOfCircles {
            drawBox(boxColor: colorValue % 3,
                    xBoxPosition: startXPosition + offsetByX,
                    yBoxPosition: startYPosition + offsetByY,
                    boxWidth: targetSize - targetSizeReducer,
                    boxHeight: targetSize - targetSizeReducer,
                    cornerRadius: CGFloat((targetSize - targetSizeReducer) / 2))
            targetSizeReducer += 10
            colorValue += 1
            offsetByX += 5
            offsetByY += 5
            roundedCornerReduser -= 5
        }
    }
}
