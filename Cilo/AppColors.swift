//
//  AppColors.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.19..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// An extension class for UIColor to be able to use own colors in this app, and be able to manage all of them from one class.

extension UIColor {

    class func rgbColor(red r: Float, green g: Float, blue b: Float) -> UIColor {
        return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: 1.0)
    }

    class func grayScaleColor(gray: Float) -> UIColor {
        return UIColor.rgbColor(red: gray, green: gray, blue: gray)
    }

    // global colors
    class func globalTintColor() -> UIColor {
        return UIColor.rgbColor(red: 19.0, green: 201.0, blue: 191.0)
    }

    class func navigationBarColor() -> UIColor {
        return UIColor.globalTintColor()
    }

    class func navigationTitleColor() -> UIColor {
        return .whiteColor()
    }

    class func separatorLineColor() -> UIColor {
        return .grayScaleColor(232.0)
    }
    
    class func tabBarTitleNormalColor() -> UIColor {
        return rgbColor(red: 47.0, green: 52.0, blue: 61.0)
    }

    // store colors
    class func darkGreenColor() -> UIColor {
        return rgbColor(red: 78.0, green: 168.0, blue: 75.0)
    }

    // MARK: home view
    class func companyDescriptionLabelColor() -> UIColor {
        return rgbColor(red: 47.0, green: 52.0, blue: 61.0)
    }

    class func storeDetailActionButtonColor() -> UIColor {
        return rgbColor(red: 47.0, green: 52.0, blue: 61.0)
    }

    // MARK: list View
    class func listViewLabelColor() -> UIColor {
        return rgbColor(red: 47.0, green: 52.0, blue: 61.0)
    }

    // MARK: news view
    class func newsCreationDateLabelColor() -> UIColor {
        return grayScaleColor(200.0)
    }

    class func newsDescriptionLabelColor() -> UIColor {
        return rgbColor(red: 47.0, green: 52.0, blue: 61.0)
    }
}