//
//  NewsTableViewCell.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 19/09/14.
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  TableView to display the news objects in the NewsListViewController
*/

class NewsTableViewCell: UITableViewCell {

    /// Title label
    @IBOutlet weak var titleLabel: UILabel!
    /// Date label
    @IBOutlet weak var dateLabel: UILabel!
    /// ImageView to display the image of the news object
    @IBOutlet weak var thumbnailView: UIImageView!
    /// A wrapper view to be able to have the parallax effect when scrolling
    @IBOutlet weak var thumbnailWrapperView: UIView!
    /// Label to display the text of the news object
    @IBOutlet weak var descriptionTextLabel: UILabel!

    @IBOutlet weak var downloadIndicator: UIActivityIndicatorView!
    
    /**
        Customize the view with custom font and colors for the labels. Set a constraint to be able to have a dynamic cell size according to the text that needs to be displayed
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        let contentViewConstraint = NSLayoutConstraint(item:contentView, attribute:NSLayoutAttribute.Height, relatedBy:NSLayoutRelation.GreaterThanOrEqual, toItem:nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier:1.0, constant:150.0)
        contentView.addConstraint(contentViewConstraint)

        titleLabel.font = .newsTitleFont()
        dateLabel.font = .newsCreationDateFont()
        descriptionTextLabel.font = .newsDescriptionFont()

        titleLabel.textColor = .whiteColor()
        dateLabel.textColor = .newsCreationDateLabelColor()
        descriptionTextLabel.textColor = .newsDescriptionLabelColor()
    }

    /**
        Called when the user scrolls the listView to achieve the parallax effect
    
        - parameter offset: the value which the imageView's frame should be offsetted
    */
    func offsetImageView(offset: CGPoint) {
        thumbnailView.frame = CGRectOffset(thumbnailView.bounds, offset.x, offset.y)
    }

    /**
        Prepare the cell for reuse, reset the imageView's image so it doesn't show a wrong image
    */
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.image = nil
    }
    
    /// Starts animating the download indicator
    func startAnimatingDownloadIndicator() {
        downloadIndicator.startAnimating()
    }

    /// Stops animating the download indicator
    func stopAnimatingDownloadIndicator() {
        downloadIndicator.stopAnimating()
    }
}
