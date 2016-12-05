//
//  NewsTransitionPresentAnimator.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 10. 20..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// Animator object that is used when we display the news object detail viewController with a custom transition. The main idea is that we want to display a smooth animation, by taking the selected cell, take the image of the cell, add a white background behind it, move it to the desired position, than load the rest of the UI elements of the destination viewController.

class NewsTransitionPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    /**
        The duration of the animation.
    
        - parameter transitionContext: the transition context object
    
        - returns: the duration
    */
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }

    /**
        The main animation happens here. This is called when the user selects a cell at the tableView
    
        - parameter transitionContext: the transition context object
    */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        /// Get all the related controllers and containers
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as! NewsListViewController
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as! NewsListDetailViewController
        let containerView = transitionContext.containerView()

        let selectedIndexPath: NSIndexPath = fromViewController.tableView.indexPathForSelectedRow!
        let selectedCell = fromViewController.tableView.cellForRowAtIndexPath(selectedIndexPath) as! NewsTableViewCell
        
        let cellImageSnapshot = selectedCell.thumbnailView.snapshotViewAfterScreenUpdates(false)
        selectedCell.thumbnailView.hidden = true
        
        /// adjust the frame of the detail viewController's view
        toViewController.view.alpha = 0.0
        toViewController.newsImageView.hidden = true
        toViewController.newsImageView.image = selectedCell.thumbnailView.image
        
        /// Add it to the containerView
        containerView!.addSubview(toViewController.view)
        
        // needed to get a nice transition between the cell and the view, since the thumbnailView is not fully visible in the tableView
        // create a new view that adds the cellImageSnapshot view as a subview
        let imageViewWrapperView = UIView(frame: containerView!.convertRect(selectedCell.thumbnailWrapperView.frame, fromView: selectedCell.thumbnailWrapperView.superview))
        imageViewWrapperView.clipsToBounds = true
        imageViewWrapperView.addSubview(cellImageSnapshot)
        containerView!.addSubview(imageViewWrapperView)

        /// Insert a white view behind the moving imageView to hide all the UI elements
        let whiteView = UIView(frame: fromViewController.view.frame)
        whiteView.backgroundColor = .whiteColor()
        containerView!.insertSubview(whiteView, belowSubview: imageViewWrapperView)
        
        /**
        *  Start the animation
        */
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            toViewController.view.alpha = 1.0

            // set the frame of the wrapperView to be the frame of destination viewControllers imageView (newsImageView), so it aligns perfectly
            let frame = containerView!.convertRect(CGRectMake(0.0, 0.0, CGRectGetWidth(toViewController.view.frame), CGRectGetHeight(toViewController.newsImageView.frame)), fromView: toViewController.view)
            imageViewWrapperView.frame.origin.y = 0.0
            imageViewWrapperView.frame = frame
        })
        { (finished) -> Void in
            // finish the animation by removing all the temporary views
            toViewController.newsImageView.hidden = false
            selectedCell.hidden = false
            whiteView.removeFromSuperview()
            imageViewWrapperView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }

}