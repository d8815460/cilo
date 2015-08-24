//
//  LocationsDownloadManager.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 07/01/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  Class is intended to be used to download Store objects from Parse.com
*/

class LocationsDownloadManager: NSObject {

    /// User's location coordinate object
    var userCoordinate: CLLocationCoordinate2D!

    /// selected store category
    var selectedStoreCategory: StoreCategory?

    /// selected sorting option
    var selectedSortingOptionKey: String?

    /**

    Download Store objects from either Parse.com

    :param: completionBlock called after the request is completed, returns the StoreObjects
    :param: storeObjects    array of StoreObjects
    */
    func downloadStores(completionBlock: (error: NSError?, storeObjects: [StoreObject]?) -> ()) {
        downloadStoresFromParse({ (error, storeObjects) -> () in
            completionBlock(error: error, storeObjects: storeObjects)
        })
    }

    /**
    Download the Store objects from Parse.com

    :param: completionBlock completionBlock that is called after the download is complete
    :param: storeObjects array of StoreObjects
    */
    private func downloadStoresFromParse(completionBlock: (error: NSError?, storeObjects: [StoreObject]?) -> ()) {
        let storesQuery = PFQuery(className: "Store")
        // if a location is given, get the nearest Stores
        if let userLocation = userCoordinate {
            // Uncomment the lines below to enable location filtering
//            var userLocationGeoPoint = PFGeoPoint(latitude: userLocation.latitude, longitude: userLocation.longitude)
//            storesQuery.whereKey("coordinate", nearGeoPoint: userLocationGeoPoint, withinKilometers: 100) // adjust it to your own needs
        }
        // if a category is selected by filtering, only show the ones that meet the criteria
        if let selectedCategory = selectedStoreCategory {
            storesQuery.whereKey("parentCategory", equalTo: PFObject(withoutDataWithClassName: "Category", objectId: selectedCategory.objectID))
        }
        // sort by this key if it is selected from filter view
        if let sortingOption = selectedSortingOptionKey {
            storesQuery.orderByAscending(sortingOption)
        }
        storesQuery.includeKey("parentCategory")
        storesQuery.findObjectsInBackgroundWithBlock { (storeObjects, error) -> Void in
            if let error = error {
                completionBlock(error: error, storeObjects: nil)
            } else {
                if let results = storeObjects as! [PFObject]!
                {
                    let storesArray = self.convertParseObjectsToStoreObjectsFromArray(results)!
                    completionBlock(error: nil, storeObjects: storesArray)
                }
            }
        }
    }
    
    // MARK: parsing methods
    /**
        Converts all the objects received from parse.com to StoreObject to more flexibility to updates
    
        :param: parseObjects NSArray of parse objects
    
        :returns: NSArray array of StoreObjects
    */
    private func convertParseObjectsToStoreObjectsFromArray(parseObjects: [PFObject]) -> [StoreObject]? {
        var tempArray = [StoreObject]()
        if let objects = parseObjects as [PFObject]!
        {
            for parseObject in objects {
                let storeObject = StoreObject(parseObject: parseObject)
                tempArray.append(storeObject)
            }
        }
        return tempArray
    }
}
