//
//  NewsButton.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 11. 24..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  A custom button which is used in the newsListDetailViewController for the backbutton
*/

class NewsButton: UIButton {

    /**
        Customize the font for the button
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = .backButtonFont()
    }

    /**
        Modify the label's frame to set its X origin to 0
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        var labelFrame = titleLabel?.frame
        if labelFrame != nil
        {
            labelFrame?.origin.x = 0.0
            titleLabel?.frame = labelFrame!
        }
    }
}
