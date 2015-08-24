//
//  StoreObject.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.19..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// An object to store all the details of the Store that we want to display. We get the datas from parse.com.

class StoreObject: BaseObject {

    /**
      Name of the store
    */
    var name: String?
    /**
      Address of the store
    */
    var address: String?
    /**
      PhoneNumber of the Store
    */
    var phoneNumber: String?
    /**
      Short description of the Store
    */
    var storeDescription: String?
    /**
      Website of the Store
    */
    var website: String?
    /**
      Distance between current and store's location
    */
    var distance: Double?
    /**
      Coordinate of the Store
    */
    var coordinate: CLLocationCoordinate2D?
    /**
      Email address of the store.
    */
    var emailAddress: String?

    /// Category of the Store object (Chinese, Mexican, etc.)
    var parentCategory: StoreCategory?

    /// Relation for dishes for the given store. Stored so we can ask for all the Dish objects from Parse.com
    var dishesRelation: PFRelation?

    /**
      Init method where we convert the PFObject to StoreObject to be more flexible in the future
    
      :param: parseObject the PFObject object to convert to StoreObject
    
      :return: instancetype - self
    */
    init(parseObject: PFObject) {
        name = parseObject.objectForKey("name") as! String?
        address = parseObject.objectForKey("address") as! String?
        let geoPoint = parseObject.objectForKey("coordinate") as! PFGeoPoint
        coordinate = CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude)
        
        phoneNumber = parseObject.objectForKey("phoneNumber") as! String?
        storeDescription = parseObject.objectForKey("storeDescription") as! String?
        website = parseObject.objectForKey("website") as! String?
        emailAddress = parseObject.objectForKey("emailAddress") as! String?
        let parentCategory = parseObject.objectForKey("parentCategory") as! PFObject
        self.parentCategory = StoreCategory.parseCategory(parentCategory)
        super.init()
        self.image = parseObject.objectForKey("picMedium") as! PFFile?

        let dishesRelation = parseObject.relationForKey("dishes") as PFRelation
        self.dishesRelation = dishesRelation
    }

    /**
      Calculates the distance between the current location and the location of the store
    
      :param: currentLocation the user's current location
    */
    func calculateDistanceBetweenCurrentLocation(currentLocation: CLLocation?) {
        if (currentLocation != nil) {
            distance = currentLocation!.distanceFromLocation(locationObjectFromGeoPoint()) as Double
        }
    }

    /**
      Creates a CLLocation object from the geoPoint object
    
      :return: CLLocation - coreLocation location object
    */
    func locationObjectFromGeoPoint() -> CLLocation {
        return CLLocation(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
    }

    /**
       Creates a CLLocationCoordinate2D object from the geoPoint object
    
       :return: CLLocationCoordinate2D - created coordinate object
    */
    func coordinateFromGeoPoint() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
    }

    /**
       Returns a formatted distance string, e.g.: 1,4 km away
    
       :return: NSString - formatted distance string
    */
    func distanceString() -> String! {
        if let distance = distance {
            if distance == 0 { // when distance is zero, return an empty string
                return ""
            }
            else {
                return NSString.distanceStringWithValue(distance) as String
            }
        }
        return ""
    }
}
