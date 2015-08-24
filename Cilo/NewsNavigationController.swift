//
//  NewsNavigationController.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 25/09/14.
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  Navigation controller for the News section to provide customization.
*/

class NewsNavigationController: UINavigationController {

    /**
    Customize the look of the status bar
    
    :returns: return the statusbar style of the topViewController
    */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return topViewController.preferredStatusBarStyle()
    }
}
