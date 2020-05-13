//
//  AppDelegate.swift
//  BarqTask
//
//  Created by Mena Gamal on 5/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyB0SV-Dgte2gqnYwfFeu4_zy_8Qek_-VgE")

        LoadingView.str = "loading"
        LoadingView.loadingSize = 70
       // register(application)
        return true
    }



}

