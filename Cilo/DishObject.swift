//
//  DishObject.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 26/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// DishObject (Dish in Parse.com) to display the dishes for the given Store/Restaurant

class DishObject: BaseObject {

    /// Name of the dish
    var name: String?
    /// Description of the dish
    var dishDescription: String?
    /// Price of the dish
    var price: NSNumber?

    /**
    Initialiser method to store the properties

    - parameter name:  name of the dish
    - parameter desc:  description of the dish
    - parameter price: price to display
    - parameter image: image of the dish

    - returns: return a DishObject
    */
    init(name: String, desc: String, price: NSNumber, image: PFFile) {
        dishDescription = desc
        super.init()
        self.name = name
        self.price = price
        self.image = image
    }

    /// Parses the PFObject to a more usable DishObject
//    class func parseDishObject(parseObject: PFObject) -> DishObject {
//        let imageFile = parseObject.objectForKey("image") as! PFFile
//        return DishObject(name: parseObject.objectForKey("name") as! String, desc: parseObject.objectForKey("description") as! String, price: parseObject.objectForKey("price") as! NSNumber, image: imageFile.url!)
//    }

    /**
    Format your price however you want here.

    - returns: Returns the formatted price
    */
    func priceString() -> String {
        if let price = price {
            return "$ \(price)"
        } else {
            return "n/a"
        }
    }
}
