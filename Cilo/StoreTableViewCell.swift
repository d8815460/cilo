//
//  StoreTableViewCell.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.18..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import Foundation

/// Custom TableViewCell to display details about the Store object

class StoreTableViewCell: UITableViewCell {

    /// Label to display the name of the Store
    @IBOutlet var nameLabel: UILabel!
    
    /// Label to display the address of the Store
    @IBOutlet var addressLabel: UILabel!
    
    /// Label to display the current distance from the user
    @IBOutlet var distanceLabel: UILabel!

    /// Each cell has one markerView to be able to display the same marker on the mapView and on the tableView. This way the user can identify shops in the list and on the map easier
    @IBOutlet var listMarkerView: StoreListMarkerView!

    /**
        Called after the view was loaded from a nib file or storyboard. 
        Sets the labels' font and textColor to a specific value
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.font = .storeTitleLabelFont()
        addressLabel.font = .storeAddressLabelFont()
        distanceLabel.font = .storeDistanceLabelFont()

        nameLabel.textColor = .listViewLabelColor()
        addressLabel.textColor = .listViewLabelColor()
        distanceLabel.textColor = .listViewLabelColor()
    }
}