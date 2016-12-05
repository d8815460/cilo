//
//  LoadingImageView.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 20/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// This class is intended to be used when you want to display a loading indicator inside the UIImageView, while the content is being loaded in the background

class LoadingImageView: UIImageView {

    /// the custom loading indicator
    private var loadingIndicator: UIImageView!

    /// hides the loading indicator if the image was set
    override var image: UIImage? {
        willSet {
            hideLoadingIndicator()
        }
    }

    /**
    Starts to animate the loading indicator
    */
    func showLoadingIndicator() {
        loadingIndicator.startAnimating()
    }

    /**
    Stops to animate the loading indicator
    */
    func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }

    /**
    Initialiser method
    */
    override init(frame: CGRect) {
        loadingIndicator = UIImageView()
        super.init(frame: frame)
    }

    /**
    Initialiser method
    */
    required init?(coder aDecoder: NSCoder) {
        loadingIndicator = UIImageView()
        super.init(coder: aDecoder)
    }

    // MARK: private methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLoadingIndicator()
    }

    /**
    Method to setup the loading indicator
    */
    func setupLoadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.animationImages = []
        loadingIndicator.animationDuration = 0.8
        addSubview(loadingIndicator)
    }

    /**
    Add the missing constraint to place the loading indicator in the middle of the UIImageView
    */
    override func updateConstraints() {
        super.updateConstraints()
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: loadingIndicator, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: loadingIndicator, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }

}
