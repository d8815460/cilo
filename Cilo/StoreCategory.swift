//
//  StoreCategory.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 20/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// The category object for the Stores

class StoreCategory: NSObject {

    /// name of the category
    var name: String?
    /// ID of the category
    var objectID: String?

    /**
    Initialise it with name and ID

    - parameter name:     name of the category
    - parameter objectID: id of the category

    - returns: initialised category object
    */
    init(name: String, objectID: String) {
        self.name = name
        self.objectID = objectID
        super.init()
    }

    /// Parses the PFObject (from parse) into a category object
    class func parseCategory(parseObject: PFObject) -> StoreCategory {
        return StoreCategory(name: parseObject.objectForKey("name") as! String, objectID: parseObject.objectId!)
    }

    /**
    Creates a PFObject from StoreCategory

    - returns: PFObject
    */
    func parseObject() -> PFObject {
        return PFObject(withoutDataWithObjectId: objectID)
    }
}
