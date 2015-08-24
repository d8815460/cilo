//
//  SortingOption.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 24/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

class SortingOption: NSObject {

    var name: String?
    var sortingKey: String?

    init(name: String, sortingKey: String) {
        self.name = name
        self.sortingKey = sortingKey
        super.init()
    }

}
