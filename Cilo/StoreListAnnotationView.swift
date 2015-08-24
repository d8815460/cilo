//
//  StoreListAnnotationView.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 11. 12..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit
import MapKit

/**
*  A custom MKAnnotationView to be able to present it on the mapView.
*/

class StoreListAnnotationView: MKAnnotationView {

    /// Custom view that helps identifying the Store object better
    private var markerView: StoreListMarkerView!

    /// The position of the annotation view in the list.
    var positionNumber: Int = 0 {
        didSet { // update the markerView's property as well when set to update its label
            markerView.positionNumber = positionNumber
        }
    }

    /**
        Initialiser method. Set the frame for the view, and add the markerView as a subview.
    
        :param: annotation      the annotation
        :param: reuseIdentifier the identifier
    
        :returns: self
    */
    override init!(annotation: MKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        frame = CGRectMake(0.0, 0.0, 30.0, 30.0)
        markerView = StoreListMarkerView(frame: CGRectMake(0.0, 0.0, 30.0, 30.0))
        markerView.userInteractionEnabled = true
        addSubview(markerView)
    }

    /**
        Initialiser method
    
        :param: aDecoder NSCoder object
    
        :returns: self
    */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
        Initialiser method
    
        :param: frame frame to use
    
        :returns: self
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
