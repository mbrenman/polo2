//
//  LocationCrunching.swift
//  Polo
//
//  Created by Matt Brenman on 7/20/15.
//  Copyright (c) 2015 MattAndJulian. All rights reserved.
//

import Foundation
import CoreLocation
import Darwin

// Location Constants
let METERS_PER_MILE = 1609.34

// Conversions
func degreesToRadians(degrees: Double) -> Double { return degrees * M_PI / 180.0 }
func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / M_PI }
func metersToMiles(meters: Double) -> Double { return meters / METERS_PER_MILE }

// Location Number Crunching
func distanceBetweenPoints(here : CLLocation?, there : CLLocation?) -> Double? {
    if (here != nil && there != nil) {
        let distInMeters = here!.distanceFromLocation(there!)
        
        //Convert to Miles
        let distInMiles = metersToMiles(distInMeters)
        
        return distInMiles
    } else {
        return nil
    }
}

func bearingBetweenPoints(here : CLLocation?, there : CLLocation?) -> Double? {
    if (here != nil && there != nil) {
        // Convert everything to radians
        let thereLat = degreesToRadians(there!.coordinate.latitude)
        let hereLat = degreesToRadians(here!.coordinate.latitude)
        
        let thereLong = degreesToRadians(there!.coordinate.longitude)
        let hereLong = degreesToRadians(here!.coordinate.longitude)
        
        // Calculate angle
        let Δlong = thereLong - hereLong
        
        // θ = atan2( sin Δλ ⋅ cos φ2 , cos φ1 ⋅ sin φ2 − sin φ1 ⋅ cos φ2 ⋅ cos Δλ )
        // Forward azimuth formula from http://www.movable-type.co.uk/scripts/latlong.html
        let offsetFromNorthRadians = atan2(sin(Δlong) * cos(thereLat), cos(hereLat) * sin(thereLat) - sin(hereLat) * cos(thereLat) * cos(Δlong))
        
        // Convert back to degrees
        let offsetFromNorthDegrees = radiansToDegrees(offsetFromNorthRadians)
        
        // Range: [-180, 180] from North
        return offsetFromNorthDegrees
    } else {
        return nil
    }
}