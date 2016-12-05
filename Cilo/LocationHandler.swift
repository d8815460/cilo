//
//  LocationHandler.swift
//  ZappShopFinder
//
//  Created by Sztanyi Szabolcs on 23/10/14.
//  Copyright (c) 2014 Szabolcs Sztányi. All rights reserved.
//

import UIKit

/// Custom protocol to share the location, speed and heading information with other classes that implements this protocol

@objc protocol LocationHandlerProtocol {
    /**
        Returns the current location object
    
        - parameter location: current location of the user
    */
    func locationHandlerDidUpdateLocation(location: CLLocation)
}

/// Custom object to handle location and heading events.

class LocationHandler: NSObject, CLLocationManagerDelegate {
    
    /// protocol object to be able to communicate with classes that implement it
    var locationHandlerProtocol: LocationHandlerProtocol?

    /// location manager to read GPS values
    var locationManager: CLLocationManager = CLLocationManager()

    /// current location of the user
    var currentUserLocation: CLLocation?
    
    /**
        Initializer of the class.
    */
    override init() {
        super.init()
        setupLocationHandler()
    }
    
    /**
        Sets up the location manager and its properties
    */
    private func setupLocationHandler() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 10
    }
    
    /**
        Starts the location tracking
    */
    func startLocationTracking() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    /**
        Tells the delegate that new location data is available. If the speed is bigger than zero, call the protocol method to let
        other classes know of the new data available
    
        - parameter manager: The location manager object that generated the update event.
        - parameter locations: An array of CLLocation objects containing the location data
    */
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        if let firstLocation = locations.first as? CLLocation
//        {
//            locationHandlerProtocol?.locationHandlerDidUpdateLocation(firstLocation)
//        }
//        currentUserLocation = locations.first as? CLLocation
//    }
    
}
