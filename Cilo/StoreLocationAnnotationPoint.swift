//
//  StoreLocationAnnotationPoint.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 23/10/14.
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit
import MapKit

/**
*  A custom MKAnnotationPoint to be able to assign our StoreObjects to it, for later use.
*/

class StoreLocationAnnotationPoint: MKPointAnnotation {

    /// The storeObject that is assigned to this point annotation
    var storeObject: StoreObject?
    
}
