//
//  NewsTransitionDismissalAnimator.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 10. 20..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// Animator object that is used when we dismiss the news object's detail viewController with a custom transition.

class NewsTransitionDismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    /**
        The duration of the animation.
    
        :param: transitionContext the transition context object
    
        :returns: the duration
    */
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }

    /**
        The main animation happens here. This is called when the user selects a dismisses the view.
    
        :param: transitionContext the transition context object
    */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as! NewsListDetailViewController
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as! NewsListViewController
        let containerView = transitionContext.containerView()

        // create a snapshot of the newsImageView
        let imageSnapshotView = fromViewController.newsImageView.snapshotViewAfterScreenUpdates(false)
        imageSnapshotView.frame = containerView.convertRect(fromViewController.newsImageView.frame, fromView: fromViewController.newsImageView.superview)
        fromViewController.newsImageView.hidden = true
        
        let newsTableViewCell = toViewController.tableViewCellForNewsObject(fromViewController.newsObjectToDisplay!)
        if let newsTableViewCell = newsTableViewCell
        {
            newsTableViewCell.thumbnailView.hidden = true
            
            toViewController.view.frame = transitionContext.finalFrameForViewController(toViewController)
            containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
            
            // create a wrapper view for the snapshotView to be able to displace the thumbnailView inside the wrapperView just like how the cells are set up
            let imageSnapshotViewWrapperView = UIView(frame: containerView.convertRect(fromViewController.newsImageView.frame, fromView: fromViewController.newsImageView.superview))
            imageSnapshotViewWrapperView.clipsToBounds = true
            imageSnapshotViewWrapperView.addSubview(imageSnapshotView)
            
            containerView.addSubview(imageSnapshotViewWrapperView)

            // add a full view with white background to cover up the UI elements while the animation is going
            let whiteView = UIView(frame: fromViewController.view.frame)
            whiteView.backgroundColor = .whiteColor()
            containerView.insertSubview(whiteView, belowSubview: imageSnapshotViewWrapperView)

            // start the animation
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                fromViewController.view.alpha = 0.0
                // adjust the frame of the wrapperView
                imageSnapshotViewWrapperView.frame = containerView.convertRect(newsTableViewCell.thumbnailWrapperView.frame,
                                                                      fromView:newsTableViewCell.thumbnailWrapperView.superview)
                
                var newFrame = imageSnapshotView.frame
                newFrame.origin.y = CGRectGetMinY(newsTableViewCell.thumbnailView.frame)
                imageSnapshotView.frame = newFrame
            }) { (finished) -> Void in
                // remove all the temporary views with a smooth animation
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    whiteView.removeFromSuperview()
                    imageSnapshotViewWrapperView.removeFromSuperview()
                    fromViewController.newsImageView.hidden = false
                    newsTableViewCell.thumbnailView.hidden = false
                })
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        }
    }
}