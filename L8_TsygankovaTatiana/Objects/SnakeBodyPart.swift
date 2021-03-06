//
//  SnakeBodyPart.swift
//  L8_TsygankovaTatiana
//
//  Created by Цыганкова Татьяна on 23.10.2018.
//  Copyright © 2018 Цыганкова Татьяна. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    static var partCount = 0
    let diameter = 10.0
    init(atPoint point: CGPoint) {
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(diameter), height: CGFloat(diameter))).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        lineWidth = 5
        self.position = point
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter-4), center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = SnakeBodyPart.partCount >= 2 ? CollisionCategories.Snake : CollisionCategories.SnakeNeck
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
