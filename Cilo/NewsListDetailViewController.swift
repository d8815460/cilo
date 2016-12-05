//
//  NewsListDetailViewController.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.18..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import Foundation
import UIKit

/**
*  A viewController to display additional information about the selected news object
*/

class NewsListDetailViewController: UIViewController, UINavigationControllerDelegate {

    /// The news object that we want to display information of
    var newsObjectToDisplay: NewsObject?

    /// Back button to dismiss the view
    @IBOutlet var backButton: UIButton!
    /// An imageView to display the image of the news object
    @IBOutlet var newsImageView: UIImageView!
    /// Label for the title of the NewsObject
    @IBOutlet var titleLabel: UILabel!
    /// Label for the creation date
    @IBOutlet var creationDateLabel: UILabel!
    /// Textview to display the description
    @IBOutlet var descriptionLabel: UILabel!
    /// The view that holds the description label
    @IBOutlet weak var containerView: UIView!
    /// The content view for the Scrollview
    @IBOutlet weak var scrollViewContentView: UIView!
    /// ScrollView to be able to have a large content
    @IBOutlet weak var scrollView: UIScrollView!
    /// 作者的大頭照
    @IBOutlet var profilePhoto: UIImageView!
    /// interactive transition object to be able to dismiss the controller while keeping the custom transition
    private var interactivePopTransition: UIPercentDrivenInteractiveTransition!

    /**
        Called when the back button is pressed, dismiss the view
    */
    @IBAction func backButtonPressed() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func wantToSeeYouButtonPressed(sender: AnyObject) {
        if PFUser.currentUser() != nil {
            //轉場至約會流程
            let SaveObject:PFObject! = PFObject(className: "Activity")
            SaveObject.setObject(PFUser.currentUser()!, forKey: "fromUser")
            SaveObject.setObject(newsObjectToDisplay!.userObject, forKey: "toUser")
            self.performSegueWithIdentifier("meetYou", sender:SaveObject)
            
        }else{
//            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            //還沒登入過
            let SaveObject:PFObject! = PFObject(className: "Activity")
            SaveObject.setObject(PFUser.currentUser()!, forKey: "fromUser")
            SaveObject.setObject(newsObjectToDisplay!.userObject, forKey: "toUser")
            self.performSegueWithIdentifier("meetYou", sender:SaveObject)
//            appDelegate.presentToLoginPage()
        }
    }
    /**
        Show view elements with animation, meaning set the alpha value to 1.0 from 0.0
    */
    func showViewElementsWithAnimation() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.backButton.alpha = 1.0
            self.titleLabel.alpha = 1.0
            self.descriptionLabel.alpha = 1.0
        })
    }

    /**
        Sets the tabBar visible or hides it
    
        - parameter visible: YES, if tabBar needs to be visible
    */
    func setTabbarVisibleWithAnimation(visible: Bool) {
        var tabBarFrame = navigationController?.tabBarController?.tabBar.frame
        if visible {
            tabBarFrame?.origin.y = CGRectGetHeight(view.frame) - CGRectGetHeight(tabBarFrame!)
        }
        else {
            tabBarFrame?.origin.y = CGRectGetHeight(view.frame)
        }

        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.navigationController?.tabBarController?.tabBar.frame = tabBarFrame!
        })
    }

    // MARK: animation handling
    /**
    Called to allow the delegate to return a noninteractive animator object for use during view controller transitions.
    
    - parameter navigationController: The navigation controller whose navigation stack is changing.
    - parameter operation:            The type of transition operation that is occurring.
    - parameter fromVC:               The currently visible view controller.
    - parameter toVC:                 The view controller that should be visible at the end of the transition.
    
    - returns: The animator object responsible for managing the transition animations, or nil if you want to use the standard navigation controller transitions.
    */
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC == self && toVC.isKindOfClass(NewsListViewController) {
            return NewsTransitionDismissalAnimator()
        } else {
            return nil
        }
    }
    
    /**
    Called to allow the delegate to return an interactive animator object for use during view controller transitions.
    
    - parameter navigationController: The navigation controller whose navigation stack is changing.
    - parameter animationController: The noninteractive animator object provided by the delegate’s navigationController:animationControllerForOperation:fromViewController:toViewController: method.
    
    - returns: The animator object responsible for managing the transition animations, or nil if you want to use the standard navigation controller transitions.
    */
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController.isKindOfClass(NewsTransitionDismissalAnimator) {
            return interactivePopTransition
        } else {
            return nil
        }
    }
    
    /**
    Called just after the navigation controller displays a view controller’s view and navigation item properties. Show the view elements
    
    - parameter navigationController: The navigation controller that is showing the view and properties of a view controller.
    - parameter viewController:       The view controller whose view and navigation item properties are being shown.
    - parameter animated:             YES/true to animate the transition; otherwise, NOfalse.
    */
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        if viewController.isKindOfClass(NewsListDetailViewController) {
            showViewElementsWithAnimation()
        }
    }
    
    /**
    Handles the screenPopRecognizer's gestures, when certain value reached, either finish the transition, or pop the viewcontroller
    
    - parameter screenPopRecognizer: the recognizer
    */
    func handlePopRecognizer(screenPopRecognizer: UIScreenEdgePanGestureRecognizer) {
        var progress = screenPopRecognizer.translationInView(view).x / CGRectGetWidth(view.frame)
        progress = min(1.0, max(0.0, progress))
        
        switch screenPopRecognizer.state {
        
            case .Began:
                interactivePopTransition = UIPercentDrivenInteractiveTransition()
                navigationController?.popViewControllerAnimated(true)
            case .Changed:
                interactivePopTransition.updateInteractiveTransition(progress)
            case .Cancelled, .Ended, .Failed:
                if progress > 0.5 {
                    interactivePopTransition.finishInteractiveTransition()
                }
                else {
                    interactivePopTransition.cancelInteractiveTransition()
                }
                interactivePopTransition = nil
            default:
                navigationController?.popViewControllerAnimated(true)
        }
    }
        
    // MARK: view methods
    /**
        Customize the look of the view
    */
    func customizeView() {
        titleLabel.font = .newsTitleFont()
        descriptionLabel.font = .newsDescriptionFont()
        creationDateLabel.font = .newsCreationDateFont()

        titleLabel.textColor = .whiteColor()
        creationDateLabel.textColor = .whiteColor()
        descriptionLabel.textColor = .newsDescriptionLabelColor()
    }

    /**
        Called after the view has been loaded. Load the properties from the NewsObject
    */
    override func viewDidLoad() {
        newsObjectToDisplay?.image?.getDataInBackgroundWithBlock({ (imageDate, error:NSError?) -> Void in
            if error != nil {
                
            }else{
                self.newsImageView.image = UIImage(data: imageDate!)
            }
        })
        
        
        newsObjectToDisplay?.userPhoto?.getDataInBackgroundWithBlock({ (imageDate, error:NSError?) -> Void in
            if error != nil {
                
            }else{
                self.profilePhoto.image = UIImage(data: imageDate!)
                self.profilePhoto.layer.cornerRadius = 35
                self.profilePhoto.clipsToBounds = true;
            }
        })
        
        titleLabel.text = newsObjectToDisplay?.title
        descriptionLabel.text = newsObjectToDisplay?.descriptionText

        backButton.layer.shadowColor = UIColor.blackColor().CGColor
        backButton.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        backButton.layer.shadowOpacity = 0.6
        backButton.layer.shadowRadius = 4.0

        // format the date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        if let newsDate = newsObjectToDisplay?.date {
            creationDateLabel.text = "\(newsObjectToDisplay!.work!) \(newsObjectToDisplay!.userName!)"
        }
        
        /// add an edge recognizer to be able to pop the view, when the user swipes from the left side of the screen
        let screenEdgePopRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "handlePopRecognizer:")
        screenEdgePopRecognizer.edges = .Left
        view.addGestureRecognizer(screenEdgePopRecognizer)

        customizeView()
        super.viewDidLoad()
    }

    /**
    Need to adjust the max layout width for the label to get the proper sizing
    */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        descriptionLabel.preferredMaxLayoutWidth = CGRectGetWidth(view.frame) - 20.0
        view.layoutIfNeeded()
    }
    
    /**
    Show the view elements with animation when the view will appear
    
    - parameter animated: yes, if animated
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showViewElementsWithAnimation()
    }

    /**
        Hide the tabBar and set the navigation controller's delegate to this view
    
        - parameter animated: yes, if animated
    */
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
        setTabbarVisibleWithAnimation(false)
    }
    
    /**
    Show the tabBar when the view is about to disappear
    
    - parameter animated: yes, if animated
    */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.delegate = nil
        setTabbarVisibleWithAnimation(true)
    }

    /**
    Prefers to hide the status bar

    - returns: true to hide it
    */
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    /**
    The preferred status bar style for the view controller.

    - returns: A UIStatusBarStyle key indicating your preferred status bar style for the view controller.
    */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "meetYou" {
            let detail = segue.destinationViewController as! UINavigationController
            let view = detail.viewControllers[0] as! SixStepTableViewController
            view.detailItem = sender
        }
    }
}