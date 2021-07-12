//
//  AppDelegate.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        decorateGlobalInterface()
        return true
    }

    func decorateGlobalInterface() {

        let navigationTitleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryColour]

        UINavigationBar.appearance().largeTitleTextAttributes = navigationTitleAttributes
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().titleTextAttributes = navigationTitleAttributes
        UINavigationBar.appearance().tintColor = UIColor.primaryColour
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UINavigationBar.appearance().isTranslucent = true
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().tintColor = UIColor.primaryColour
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBarItem.appearance().badgeColor = UIColor.primaryColour
    }

}

