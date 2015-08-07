//
//  ArrowView.swift
//  Polo
//
//  Created by Matt Brenman on 7/30/15.
//  Copyright (c) 2015 MattAndJulian. All rights reserved.
//

import UIKit

class ArrowView: UIView {
    
    // Colors
    let backColor = UIColor.blackColor()
    let lineColor = UIColor.whiteColor()
    
    // Line constants
    let buffer = CGFloat(25.0)
    
    // Animation Constants
    let speed = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Custom initialization
        self.backgroundColor = backColor
    }
    
    override func drawRect(rect: CGRect) {
        // Calculate the new bounds
        let height = rect.height - CGFloat(2.0 * buffer)
        let width = rect.width - CGFloat(2.0 * buffer)
        
        // Create the arrow path
        var path = UIBezierPath()
        path.moveToPoint(CGPoint(x: buffer, y: height + buffer))
        path.addLineToPoint(CGPoint(x: width / 2 + buffer, y: 2 * buffer))
        path.addLineToPoint(CGPoint(x: width + buffer, y: height + buffer))
        
        // Set width
        path.lineWidth = CGFloat(buffer)
        
        // Set color
        lineColor.setStroke()
        
        // Draw path
        path.stroke()
    }
    
    func setAngle(angleInRadians: Double) {
        // Create the transformation angle (need to flip for counterclockwise movement)
        let transformAngle = CGFloat(-angleInRadians)
        
        // Create the transformation
        let transform = CGAffineTransformMakeRotation(transformAngle)
        
        // Animate!
        UIView.animateWithDuration(speed, animations: {
            self.transform = transform
        })
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
