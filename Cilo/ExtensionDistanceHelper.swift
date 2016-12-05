//
//  ExtensionDistanceHelper.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.24..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// NSString extension to have the extra NSString formatting in a central place

extension NSString {
    /*

    Credit for this solution:
    http://stackoverflow.com/questions/2324125/objective-c-string-formatter-for-distances

    */

    /**
       Returns a string with the right formatting.
    
       - parameter distanceValue: the distance the distance value to use, to create the string
       :return: NSString - distance string with the right formatting according to the user's locale settings
    */
    class func distanceStringWithValue(distanceValue: Double) -> NSString {

        var distance = distanceValue

        var format: NSString = ""
        let isMetric = NSLocale.currentLocale().objectForKey(NSLocaleUsesMetricSystem) as! Bool
        if isMetric
        {
            if distance < 1000 {
                format = "m"
            }
            else {
                format = "km"
                distance /= 1000
            }
        }
        else
        {
            distance *= 3.2808399
            if distance < 3281 {
                format = "ft"
            }
            else {
                format = "mi"
                distance /= 5280
            }
        }

        let distanceString = stringFromDistanceValue(distance)
        return "\(distanceString)" + " " + "\(format)"
    }

    /**
       Return a string of a number to one decimal place and with commas & periods based on the locale.
    
       - parameter doubleValue: the distance that needs to be converted
    
       :return: NSString - the converted string
    */
    private class func stringFromDistanceValue(doubleValue: Double) -> NSString {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.locale = NSLocale.currentLocale()
        numberFormatter.numberStyle = .DecimalStyle
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter.stringFromNumber(NSNumber(double: doubleValue))!
    }
}
