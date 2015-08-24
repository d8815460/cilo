//
//  StoreDetailLocationButton.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 23/10/14.
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// Used to diplay the location arrow button in the StoreDetailViewController, to display the distance from the user's location to the selected shop

class StoreDetailLocationButton: UIButton {
   
    /**
    Customize the button's look
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .globalTintColor()
        
        titleLabel?.textColor = .whiteColor()
        titleLabel?.textAlignment = .Center
        titleLabel?.font = UIFont.systemFontOfSize(9.0)
    }
    
    /**
    Lay out the button's label and icon
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var labelFrame = titleLabel?.frame
        labelFrame?.origin.x = 0.0
        labelFrame?.origin.y = CGRectGetHeight(bounds) - 21.0
        labelFrame?.size.height = 21.0
        labelFrame?.size.width = CGRectGetWidth(bounds)
        titleLabel?.frame = labelFrame!
        
        var iconFrame = imageView?.frame
        iconFrame?.origin.y = 15.0
        iconFrame?.size.height = 18.0
        iconFrame?.size.width = 18.0
        iconFrame?.origin.x = CGRectGetWidth(bounds)/2 - 18.0/2
        imageView?.frame = iconFrame!
    }
}
