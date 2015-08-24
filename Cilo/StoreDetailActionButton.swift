//
//  StoreDetailActionButton.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 23/10/14.
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// A custom button to be able to display the actions for the store objects. Such as e-mail, call, browse

class StoreDetailActionButton: UIButton {
    
    /**
    Customize the label of the button
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = .storeDetailActionButtonFont()
        setTitleColor(UIColor.storeDetailActionButtonColor(), forState: .Normal)
        setTitleColor(UIColor.lightGrayColor(), forState: .Disabled)
        titleLabel?.textAlignment = .Center
    }
    
    /**
    Lay out the subviews. Modify the frame of the label and the icon to get the final effect. Label on bottom, icon on top
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var labelFrame = titleLabel?.frame
        labelFrame?.origin.y = CGRectGetHeight(bounds) - 25.0
        labelFrame?.origin.x = 0.0
        labelFrame?.size.width = CGRectGetWidth(bounds)
        labelFrame?.size.height = 21.0
        titleLabel?.frame = labelFrame!
        
        let iconHeight: CGFloat = 15
        
        var iconFrame = imageView?.frame
        iconFrame?.origin.y = CGRectGetHeight(bounds)/2 - iconHeight
        iconFrame?.origin.x = CGRectGetWidth(bounds)/2 - iconHeight/2
        iconFrame?.size.height = iconHeight
        iconFrame?.size.width = iconHeight
        imageView?.frame = iconFrame!
    }

}
