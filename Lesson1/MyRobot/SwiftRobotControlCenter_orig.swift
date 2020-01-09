//
//  SwiftRobotControlCenter.swift
//  MyRobot
//
//  Created by Ivan Vasilevich on 10/4/14.
//  Copyright (c) 2014 Ivan Besarab. All rights reserved.
//

import UIKit
//  All robot commands can be founded in GameViewController.h
class SwiftRobotControlCenter: RobotControlCenter {
    
    
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L55H" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let ammountOfCandys = 5
        var decrement = ammountOfCandys
        
        
        move()
        
        for _ in 0..<ammountOfCandys {
            for _ in 0..<decrement {
                place()
                
            }
            back()
            decrement -= 1
        }
        
        
        
        
        
        
        
        
//        turnRight()
//        makeDiagonal()
//        moveToZeroPoint()
//        turnLeft()
//        makeDiagonal()
        
    }
    
    func place(){
        
        put()
        move()
    }
    
    func back(){
        turnRight()
        turnRight()
        move()
        turnLeft()
        move()
        turnLeft()
    }
    
    func turnLeft() {
        for _ in 0..<3 {
            turnRight()
        }
    }
    
    func moveToZeroPoint() {
        for _ in 0..<2 {
            turnRight()
        }
        while frontIsClear {
            move()
        }
    }
    
    func candyDropping() {
        put()
        turnLeft()
        if frontIsClear {
            move()
        }
        turnRight()
        if frontIsClear {
            move()
        }
    }
    
    func makeDiagonal() {
        while frontIsClear {
            candyDropping()
        }
        put()
    }
    
}
