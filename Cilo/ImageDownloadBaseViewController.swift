//
//  ImageDownloadBaseViewController.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 20/07/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

 /// Base viewController for all the viewControllers that displays a tableView/collectionView with lot of options

class ImageDownloadBaseViewController: UIViewController {

    /// Our list view
    @IBOutlet var tableView: LoadingTableView!

    /// Objects that needs to be displayed
    var objectsArray: [BaseObject] = []

    /// a dictionary that holds all the objects that are currently downloading an image for a cell
    var imageDownloadsInProgress: [NSIndexPath: ImageDownloader] = [NSIndexPath: ImageDownloader]()

    /**
    Set the navigation controller's delegate to nil when the view is about to disappear

    :param: animated YES if to animate it
    */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        cancelAllImageDownloads()
    }

    /**
    When the user stopped dragging the tableView (scrolling)

    :param: scrollView the scrollView
    :param: decelerate YES, if the scrollView is decelerating
    */
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
//            loadImagesForVisibleRows()
        }
    }

    /**
    only start downloading if the user stopped scrolling

    :param: scrollView scrollview
    */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        loadImagesForVisibleRows()
    }

    // MARK: image loading
    /**
    Get the already existing ImageDownloader instance from the imageDownloadsInProgress dictionary, if found do nothing, if not
    it means it needs to create a new one and start the download.

    :param: object    object to download the image for
    :param: indexPath indexPath where the object is displayed at
    */
    func startImageDownload(object: PFFile, indexPath: NSIndexPath) {
        var downloader = imageDownloadsInProgress[indexPath]
        if downloader == nil
        {
            // create a new downloader object and start the download
            let imageDownloader = ImageDownloader()
            imageDownloader.startDownloadingImage(object, completionBlock: { (image) -> () in
                self.updateTableViewCell(object, atIndexPath: indexPath, image: image!)
                self.imageDownloadsInProgress.removeValueForKey(indexPath)
            })
            // add the imageDownloader object to the dictionary
            imageDownloadsInProgress[indexPath] = imageDownloader
        }
    }

    /**
    Called when an image download is finished to update the cell's imageView at the given indexPath

    :param: object    the object that needs to be updated
    :param: indexPath the cell's indexPath
    :param: image     the image that was downloaded
    */
    func updateTableViewCell(object: PFFile, atIndexPath indexPath: NSIndexPath, image: UIImage) {
        // implement it in the subclasses
    }

    /**
    Get the visible images and check if any of them is missing their image, if YES, start the download
    */
//    func loadImagesForVisibleRows() {
//        let visibleIndexPathsArray = tableView.indexPathsForVisibleRows() as! [NSIndexPath]
//        for indexPath in visibleIndexPathsArray
//        {
//            let object: BaseObject = objectsArray[indexPath.row]
//            if object.image == nil {
//                startImageDownload(object, indexPath: indexPath)
//            }
//        }
//    }

    /**
    Cancels all image downloading
    */
    func cancelAllImageDownloads() {
        let allDownloads = imageDownloadsInProgress.values

        for imageDownloader in allDownloads {
            imageDownloader.cancelDownload()
        }

        imageDownloadsInProgress.removeAll(keepCapacity: false)
    }
}
