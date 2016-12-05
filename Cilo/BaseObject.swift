//
//  BaseObject.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 20/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// The base object for every object that has an image and an imageURL

class BaseObject: NSObject {

    /// Downloaded Image
    var image: PFFile?
    /// the url for the image of the news
//    var imageURL: String?

    /**
    Init method

    - returns: self
    */
    override init() {
        super.init()
    }
}
