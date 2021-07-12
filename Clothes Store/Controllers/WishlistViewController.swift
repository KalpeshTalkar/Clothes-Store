//
//  WishlistViewController.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import UIKit


protocol BuyCellButtonTapped: class {
    func addProductToBasket(_ sender: SavedViewTableViewCell)
}

class WishlistViewController: UIViewController, BuyCellButtonTapped {

    //Views
    @IBOutlet var tableView: UITableView!
    @IBOutlet var noProductsLabel: UILabel!

    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Actions
    func addProductToBasket(_ sender: SavedViewTableViewCell) {
        Haptic.feedBack()

    }
}

extension WishlistViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction.init(style:.destructive, title: "Remove", handler: { (action, view, completion) in
            
            Haptic.feedBack()
          
        })

        deleteAction.backgroundColor = UIColor.primaryColour

        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = true
        return config

    }
}


