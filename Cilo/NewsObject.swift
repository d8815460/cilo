//
//  NewsObject.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014.09.18..
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import Foundation

/// An object to store each News objects' data that we receive from parse.com

class NewsObject: BaseObject {

    /// title of the news
    let title: String!
    /// date when the news was created
    let date: NSDate!
    /// the news' content
    let descriptionText: String!
    /// 用戶的職稱
    let work: String!
    /// 用戶的姓名
    let userName: String!
    /// 用戶大頭照
    let userPhoto: PFFile!
    /// 用戶物件
    let userObject: PFObject!

    /**
        Initialize the newsObject with title, date, descriptionText and imageURL
    
        :param: title title of the news
        :param: date date when the news was created
        :param: descriptionText the content
        :param: imageURL url of the image for the news
    */
    init(title: NSString, date: NSDate, descriptionText: NSString, image: PFFile, work: NSString, userName: NSString, userPhoto: PFFile, userObject:PFObject) {
        self.title = title as String
        self.date = date
        self.descriptionText = descriptionText as String
        self.work = work as String
        self.userName = userName as String
        self.userPhoto = userPhoto as PFFile
        self.userObject = userObject
        super.init()
        self.image = image
    }
}