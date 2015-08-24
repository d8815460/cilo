//
//  ImageDownloader.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztanyi on 05/06/15.
//  Copyright (c) 2015 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// Custom class to be able to download images from an URL

class ImageDownloader: NSObject {

    /// the download task
    private var downloadTask: NSURLSessionDownloadTask?

    /**
    Start downloading the image from the passed in url and calls the completionblock when finished

    :param: object          the object that needs to download the image for
    :param: completionBlock called after the request was finished
    */
    func startDownloadingImage(object: PFFile, completionBlock: (image: UIImage?) -> ()) {
//        let url = NSURL(string: object.imageURL!)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
//        let request = NSURLRequest(URL: url!)
//        let downloadSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//        downloadTask = downloadSession.downloadTaskWithRequest(request) { (fileURL, response, error) -> Void in
//            var data: NSData?
//            if fileURL != nil // && request.URL == url
//            {
//                data = NSData(contentsOfURL: fileURL)
//                let image = UIImage(data: data!)
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                    completionBlock(image: image)
//                })
//            }
//        }
//        downloadTask!.resume()
    }

    /**
    Cancels the current download task
    */
    func cancelDownload() {
        downloadTask?.cancel()
        downloadTask = nil
    }
}
