//
//  AppFonts.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 11. 24..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  Customisation class to customise the fonts used in the app. Customise the fonts used in here to change the look of the app.
*/

extension UIFont {

    class func montSerratRegular() -> String {
        return "Helvetica Neue"
    }

    class func helveticaRegular() -> String {
        return "Helvetica Neue"
    }

    // MARK: home view
    class func companyTitleFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 24.0)!
    }

    class func companyDetailTextFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 20.0)!
    }

    class func companyDescriptionFont() -> UIFont {
        return UIFont(name: helveticaRegular(), size: 12.0)!
    }

    class func storeDetailActionButtonFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 9.0)!
    }

    // MARK: store list view
    class func storeTitleLabelFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 12.0)!
    }

    class func storeAddressLabelFont() -> UIFont {
        return UIFont(name: helveticaRegular(), size: 9.0)!
    }

    class func storeDistanceLabelFont() -> UIFont {
        return UIFont(name: helveticaRegular(), size: 9.0)!
    }

    // MARK: news detail view
    class func backButtonFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 12.0)!
    }

    class func newsTitleFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 16.0)!
    }

    class func newsCreationDateFont() -> UIFont {
        return UIFont(name: montSerratRegular(), size: 9.0)!
    }

    class func newsDescriptionFont() -> UIFont {
        return UIFont(name: helveticaRegular(), size: 12.0)!
    }
}
