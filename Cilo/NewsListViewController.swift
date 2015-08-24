//
//  NewsListViewController.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.18..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import Foundation
import UIKit

/**
* A viewcontroller that will display all the news objects
*/

class NewsListViewController: ImageDownloadBaseViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    /// The view on top, at the statusbar
    @IBOutlet var headerView: UIView!

    /// Refresh control to show the pull to refresh view
    var refreshControl: UIRefreshControl!

    /// Lazy getter for the dateFormatter
    lazy var dateFormatter: NSDateFormatter = {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        return dateFormatter
    }()

    /**
        Download the news objects from Parse.com, than parse them into NewsObjects and add them to the newsListArray
    */
    func downloadNewsFromParse() {
        let parameters = Dictionary<String, String>() // edit this according to your needs, for all the stores just pass in this empty dictionary
        var newsQuery = PFQuery(className: "PostDate")
        newsQuery.includeKey("fromUser")
        newsQuery.orderByAscending("createdAt")
//        newsQuery.orderByDescending("createdAt")
        newsQuery.findObjectsInBackgroundWithBlock { (news, error) -> Void in
            if let newsArray = news as? [PFObject]
            {
                var tempNewsArray = [NewsObject]()
                for newsObject in newsArray
                {
                    let userObject = newsObject.objectForKey("fromUser") as! PFObject!
                    let userName = userObject.objectForKey("displayName") as! String!
                    let work = userObject.objectForKey("work") as! String!
                    let userPhoto = userObject.objectForKey("picMedium") as! PFFile!
                    // create newsObject from the Parse object
                    let newsObject = NewsObject(title: newsObject.objectForKey("dateTitle") as! String!,
                        date: newsObject.createdAt as NSDate!,
                        descriptionText: newsObject.objectForKey("dateContent") as! String!,
                        image: newsObject.objectForKey("picMedium") as! PFFile!,
                        work: work,
                        userName: userName,
                        userPhoto: userPhoto,
                        userObject: userObject)
                    tempNewsArray.append(newsObject)
                }
                self.objectsArray = tempNewsArray as [NewsObject]
                self.refreshControl?.endRefreshing()
                self.tableView.hideLoadingIndicator()
                self.tableView.reloadData()
            }
            else
            {
                self.tableView.hideLoadingIndicator()
                self.refreshControl?.endRefreshing()
            }
        }
    }

    /**
        Called after the view has been loaded, customize the view and set up the tableView to allow dynamic cell size
    */
    override func viewDidLoad() {
        headerView.backgroundColor = UIColor.globalTintColor()
        navigationController?.navigationBarHidden = true

        // setup the dynamic cell size
        tableView.estimatedRowHeight = 210.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView(frame: CGRectZero)

        // setup the refreshControl
        refreshControl = UIRefreshControl(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.frame), 44.0))
        refreshControl.tintColor = UIColor.globalTintColor()
        refreshControl.addTarget(self, action: "loadContent", forControlEvents: .ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Loading masters")
        tableView.addSubview(refreshControl)
        
        loadContent()
        super.viewDidLoad()
    }
    
    /**
    Set the navigation controller's delegate to this controller and deselect a cell, if there is one selected
    
    :param: animated YES if to animate it
    */
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
        if let selectedIndexPath = tableView.indexPathForSelectedRow() {
            tableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
        }
    }
    
    /**
    Set the navigation controller's delegate to nil when the view is about to disappear
    
    :param: animated YES if to animate it
    */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.delegate = nil
    }

    /**
        Download data from parse.com and show the refresh control
    */
    func loadContent () {
        cancelAllImageDownloads()
        refreshControl.beginRefreshing()
        tableView.showLoadingIndicator()
        downloadNewsFromParse()
    }

    /**
        Called when the user scrolls the view, and updates the cells to get the parallax effect
    */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let visibleCells: [NewsTableViewCell] = tableView.visibleCells() as! [NewsTableViewCell]
        for newsTableViewCell in visibleCells
        {
            let heightOfImageView: CGFloat = CGRectGetHeight(newsTableViewCell.thumbnailView.frame)
            let yOffset: CGFloat = ((tableView.contentOffset.y - newsTableViewCell.frame.origin.y) / heightOfImageView) * 20.0
            newsTableViewCell.offsetImageView(CGPointMake(0.0, yOffset))
        }
    }

    /**
    Update the cell with the downloaded image

    :param: object    the object that holds the imageURL
    :param: indexPath the indexPath for the cell
    :param: image     the image that was downloaded
    */
    override func updateTableViewCell(object: PFFile, atIndexPath indexPath: NSIndexPath, image: UIImage) {
        let cellToUpdate = self.tableView.cellForRowAtIndexPath(indexPath) as! NewsTableViewCell?
        if let cell = cellToUpdate
        {
            object.getDataInBackgroundWithBlock({ (imageDate, error:NSError?) -> Void in
                if error != nil {
                    
                }else{
                    cell.thumbnailView.image = UIImage(data: imageDate!)
                }
            })
            
            cell.stopAnimatingDownloadIndicator()
        }
    }

    // MARK: tableView methods
    /**
        Get the newsObject for the given indexPath and set the labels with the values
    
        :param: tableView the tableView
        :param: indexPath the indexPath
    
        :returns: the cell
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsTableViewCell") as! NewsTableViewCell

        let newsObject = objectsArray[indexPath.row] as! NewsObject
        cell.titleLabel.text = newsObject.title
        cell.descriptionTextLabel.text = newsObject.descriptionText
        cell.dateLabel.text = "\(newsObject.work) \(newsObject.userName)"
        
        if newsObject.image == nil {
            cell.startAnimatingDownloadIndicator()
            if tableView.dragging == false && tableView.decelerating == false {
                newsObject.image!.getDataInBackgroundWithBlock({ (imageDate, error:NSError?) -> Void in
                    if error != nil {
                        
                    }else{
                        cell.thumbnailView.image = UIImage(data: imageDate!)
                    }
                })
            }
        } else {
            cell.stopAnimatingDownloadIndicator()
            newsObject.image!.getDataInBackgroundWithBlock({ (imageDate, error:NSError?) -> Void in
                if error != nil {
                    
                }else{
                    cell.thumbnailView.image = UIImage(data: imageDate!)
                }
            })
        }
        
        return cell
    }

    /**
        Return how many rows the tableView should have
    
        :param: tableView the tableView
        :param: section   which section needs to work with
    
        :returns: how many rows
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray.count
    }

    /**

    */

    /**
    Called when a segue is about to be executed. Get the object for the given indexPath and pass it on to the detailView

    :param: segue  segue that has been called
    :param: sender which object triggered the segue
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let newsDetailViewController = segue.destinationViewController as! NewsListDetailViewController
        
        let selectedCell = sender as! NewsTableViewCell
        let indexPath = tableView.indexPathForCell(selectedCell)
        if let selectedIndexPath = indexPath
        {
            let selectedNewsObject = objectsArray[selectedIndexPath.row] as! NewsObject
            newsDetailViewController.newsObjectToDisplay = selectedNewsObject
        }
    }
    
    /**
    Return the tableViewCell for the passed in newsObject
    
    :param: newsObject the object which index is needed
    
    :returns: the cell
    */
    func tableViewCellForNewsObject(newsObject: NewsObject) -> NewsTableViewCell? {
        let newsObjectIndex = find(objectsArray, newsObject)
        if newsObjectIndex == NSNotFound {
            return nil
        }
        else {
            return tableView.cellForRowAtIndexPath(NSIndexPath(forRow: newsObjectIndex!, inSection: 0)) as? NewsTableViewCell
        }
    }
    
    /**
    Called to allow the delegate to return a noninteractive animator object for use during view controller transitions.
    
    :param: navigationController The navigation controller whose navigation stack is changing
    :param: operation            The type of transition operation that is occurring.
    :param: fromVC               The currently visible view controller.
    :param: toVC                 The view controller that should be visible at the end of the transition.

    :returns: The animator object responsible for managing the transition animations, or nil if you want to use the standard navigation controller transitions.
    */
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC == self && toVC.isKindOfClass(NewsListDetailViewController)
        {
            return NewsTransitionPresentAnimator()
        }
        else
        {
            return nil
        }
    }
    
    /**
        The preferred status bar style for the view controller.
    
        :returns: A UIStatusBarStyle key indicating your preferred status bar style for the view controller.
    */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
