//
//  DishTableViewCell.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 28/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// Custom tableViewCell to display dishObjects for at StoreDetailViewController

class DishTableViewCell: UITableViewCell {

    /// display the name of the dish
    @IBOutlet weak var dishNameLabel: UILabel!
    /// display the price of the dish
    @IBOutlet weak var priceLabel: UILabel!
    /// display the description of the dish object
    @IBOutlet weak var descriptionLabel: UILabel!
    /// display the image of the dish
    @IBOutlet weak var dishImageView: LoadingImageView!

    /**
    Make the imageView circle shaped
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        dishImageView.layer.cornerRadius = CGRectGetHeight(dishImageView.frame)/2
    }

}
