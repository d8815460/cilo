//
//  LoadingTableView.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 03/08/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// Custom UITableView to be able to display custom empty states, or loading indicators inside a tableView anywhere in the app
// Read more about it at: http://zappdesigntemplates.com/create-a-custom-uitableview-with-loading-indicator/

class LoadingTableView: UITableView {

    /// A reference to the image that we are usign
    let loadingImage = UIImage(named: "loadingIndicator")
    /// The imageView that holds the loading indicator image
    var loadingImageView: UIImageView

    /**
    Called after loading from a nib or Storyboard file. Creating the loading indicator view and adding it as a subview.

    :param: aDecoder self

    :returns: self
    */
    required init(coder aDecoder: NSCoder) {
        loadingImageView = UIImageView(image: loadingImage)
        super.init(coder: aDecoder)
        addSubview(loadingImageView)
        adjustSizeOfLoadingIndicator()
    }

    /**
    Shows the loading indicator and starts the animation for it
    */
    func showLoadingIndicator() {
        loadingImageView.hidden = false
        self.bringSubviewToFront(loadingImageView)

        startRefreshing()
    }

    /**
    Hides the loading indicator
    */
    func hideLoadingIndicator() {
        loadingImageView.hidden = true

        stopRefreshing()
    }

    /**
    Adjust the size so that the indicator is always in the middle of the screen
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustSizeOfLoadingIndicator()
    }

    /**
    The method to adjust the size of the indicator
    */
    private func adjustSizeOfLoadingIndicator() {
        let loadingImageSize = loadingImage?.size
        loadingImageView.frame = CGRectMake(CGRectGetWidth(frame)/2 - loadingImageSize!.width/2, CGRectGetHeight(frame)/2-loadingImageSize!.height/2, loadingImageSize!.width, loadingImageSize!.height)
    }

    /**
    Start the rotating animation
    */
    private func startRefreshing() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.removedOnCompletion = false
        animation.toValue = M_PI * 2.0
        animation.duration = 0.8
        animation.cumulative = true
        animation.repeatCount = Float.infinity
        loadingImageView.layer.addAnimation(animation, forKey: "rotationAnimation")
    }

    /**
    Stops the rotating animation
    */
    private func stopRefreshing() {
        loadingImageView.layer.removeAllAnimations()
    }

}
