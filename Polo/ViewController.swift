//
//  ViewController.swift
//  Polo
//
//  Created by Matt Brenman on 7/20/15.
//  Copyright (c) 2015 MattAndJulian. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create two test locations
        let philly = CLLocation(latitude: 39.9500, longitude: 75.1667)
        let boston = CLLocation(latitude: 42.3601, longitude: 71.0589)
        
        // Run tests on distance/bearing
        println("PHL -> BOS")
        test(philly, there : boston)
        
        println("BOS -> PHL")
        test(boston, there : philly)
        
        println("PHL -> PHL")
        test(philly, there : philly)
        
        println("BOS -> BOS")
        test(boston, there : boston)
        
        // Create the arrow subview
        let arrowViewSize = min(self.view.frame.height, self.view.frame.width) / 2
        let arrowView = ArrowView(frame: CGRect(x: (self.view.frame.width  / 2) - (arrowViewSize / 2),
                                                y: (self.view.frame.height / 2) - (arrowViewSize / 2),
                                                width: arrowViewSize,
                                                height: arrowViewSize))
        
        // Add and animate
        self.view.addSubview(arrowView)
        arrowView.setAngle(bearingBetweenPoints(philly, boston)!)
    }
    
    func test(here: CLLocation, there : CLLocation) {
        println("Distance: \(distanceBetweenPoints(here, there))")
        println("Bearing   \(bearingBetweenPoints(here, there))")
        println()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

