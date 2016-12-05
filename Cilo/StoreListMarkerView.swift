//
//  StoreListMarkerView.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 11. 12..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  A custom view to be able to display and differentiate better the stores on the mapView. Each store object has a number (positionNumber) which is displayed in the tableView and on the mapView as well.
*/

class StoreListMarkerView: UIView {

    /// the number for the given view
    var positionNumber: Int = 0 {
        didSet {
            positionLabel.text = "\(positionNumber)"
        }
    }

    /// The label that holds the position number
    private var positionLabel: UILabel!

    /**
        Initialiser method, to set up the view.
    
        - parameter frame: frame of the view
    
        - returns: self
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    /**
        Initialiser method, called after the nib is loaded
    
        - parameter aDecoder: NSCoder object
    
        - returns: self
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    /**
        Set ups the view
    */
    func setupView() {
        backgroundColor = .clearColor()
        setupLabel()
    }

    /**
        Creates a label and adds it to the view
    */
    private func setupLabel() {
        positionLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(frame), CGRectGetHeight(frame)))
        positionLabel.font = UIFont.systemFontOfSize(10.0)
        positionLabel.textAlignment = .Center
        positionLabel.textColor = .globalTintColor()
        positionLabel.minimumScaleFactor = 0.8
        addSubview(positionLabel)
    }

    /**
        Draws the look of the view. In this case, the view should have a white background, with green stroke around it.
    
        - parameter rect: the rectangle to draw in
    */
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()

        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, UIColor.globalTintColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillEllipseInRect(context, rect)
        CGContextStrokeEllipseInRect(context, CGRectMake(1.0, 1.0, rect.size.width-2.0, rect.size.height-2.0))
    }
}
