//
//  StoreListImageTableViewCell.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 20/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// Used to display a StoreObject

class StoreListImageTableViewCell: UITableViewCell {

    /// the label to display the name
    @IBOutlet weak var nameLabel: UILabel!
    /// the label for the location
    @IBOutlet weak var locationLabel: UILabel!
    /// The imageView to display the store image
    @IBOutlet weak var storeImageView: LoadingImageView!
    /// Background view of the distance label
    @IBOutlet weak var distanceLabelBackgroundView: UIView!
    /// Label to display the distance of the Store from the user
    @IBOutlet weak var distanceLabel: UILabel!
    /// Label to display the category, this Store belongs to
    @IBOutlet weak var categoriesLabel: UILabel!

    /**
    Called after the view is loaded from the nib file, or storyboard, do some customisation
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        distanceLabelBackgroundView.layer.cornerRadius = 8.0
        distanceLabelBackgroundView.backgroundColor = .whiteColor()
        distanceLabel.textColor = UIColor.globalTintColor()
    }

    /**
    Need to call this method, in order to avoid having wrong images displayed at wrong cells
    */
    override func prepareForReuse() {
        super.prepareForReuse()
        storeImageView.image = nil
    }
}
