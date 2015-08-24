//
//  FilterCategoriesDownloadManager.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 21/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import Foundation

 //// Download manager that downloads Categories from Parse.com

class FilterCategoriesDownloadManager: NSObject {

    /**
        Downloads all the Category objects from Parse.com

    :param: completionBlock completionBlock called after the request finished, returns the categories array and an errorMessage if any
    :param: errorMessage errorMessage to return if any
    */
    func downloadStoreCategories(completionBlock: (categories: [StoreCategory]?, errorMessage: NSString?) -> Void) {
        var storeCategoriesArray: [StoreCategory] = []

        let categoriesQuery = PFQuery(className: "Category")
        categoriesQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionBlock(categories: nil, errorMessage: error?.localizedDescription)
                })
            }
            else
            {
                if let objects = objects
                {
                    for object in objects {
                        storeCategoriesArray.append(StoreCategory.parseCategory(object as! PFObject))
                    }
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionBlock(categories: storeCategoriesArray, errorMessage: nil)
                    })
                } else {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionBlock(categories: nil, errorMessage: "Unknown error occured")
                    })
                }
            }
        }
    }
}
