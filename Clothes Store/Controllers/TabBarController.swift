//
//  TabBarController.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//
import UIKit

class TabBarController: UITabBarController {

    //Views
    var tabItem : UITabBarItem?

    //Variables
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let tabItems = tabBar.items {
            // In this case we want to modify the badge number of the third tab:
            tabItem = tabItems[2]
        }

    }
}
