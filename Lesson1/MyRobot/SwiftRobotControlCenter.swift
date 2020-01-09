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
        levelName = "L55H" //  Level name  e
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        turnRight()
        makeDiagonal()
        moveToZeroPoint()
        turnLeft()
        makeDiagonal()
        
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
