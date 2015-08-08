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
        print("PHL -> BOS")
        test(philly, there : boston)
        
        print("BOS -> PHL")
        test(boston, there : philly)
        
        print("PHL -> PHL")
        test(philly, there : philly)
        
        print("BOS -> BOS")
        test(boston, there : boston)
        
        // Create the arrow subview
        let arrowViewSize = min(self.view.frame.height, self.view.frame.width) / 2
        let arrowView = ArrowView(frame: CGRect(x: (self.view.frame.width  / 2) - (arrowViewSize / 2),
                                                y: (self.view.frame.height / 2) - (arrowViewSize / 2),
                                                width: arrowViewSize,
                                                height: arrowViewSize))
        
        // Add and animate
        self.view.addSubview(arrowView)
        arrowView.setAngle(bearingBetweenPoints(philly, there: boston)!)
    }
    
    func test(here: CLLocation, there : CLLocation) {
        print("Distance: \(distanceBetweenPoints(here, there: there))")
        print("Bearing   \(bearingBetweenPoints(here, there: there))")
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

