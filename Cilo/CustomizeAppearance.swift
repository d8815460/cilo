//
//  CustomizeAppearance.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.19..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// UI customisation class

class CustomizeAppearance: NSObject {

    /**
    Customize the global UI elements, such as UINavigationBar and UITabBar
    */
    class func globalCustomization () {
        UINavigationBar.appearance().tintColor = UIColor.navigationTitleColor()
        UINavigationBar.appearance().barTintColor = UIColor.navigationBarColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.navigationTitleColor(), NSFontAttributeName: UIFont(name: "AvenirNext-Medium", size: 16)!]    

        UITabBar.appearance().tintColor = .globalTintColor()
        UITabBar.appearance().barTintColor = .whiteColor()

//        UITabBarItem.appearance().setTitleTextAttributes([UIColor.tabBarTitleNormalColor():NSForegroundColorAttributeName, UIFont.systemFontOfSize(10.0):NSFontAttributeName], forState: .Normal)
//        UITabBarItem.appearance().setTitleTextAttributes([UIColor.globalTintColor():NSForegroundColorAttributeName], forState: .Selected)
    }
}
