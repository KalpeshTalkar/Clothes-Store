//
//  ProductDetailTableViewController.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    //Views
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productOldPrice: UILabel!
    @IBOutlet var productInStock: UILabel!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productCategory: UILabel!
    @IBOutlet var productStockCount: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    //Variables
    var product : Product?
    var productImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        productName.text = product?.name
        productPrice.text = CurrencyHelper.getMoneyString(product?.price ?? 0)

        let attributedString = NSMutableAttributedString(string: CurrencyHelper.getMoneyString(product?.oldPrice ?? 0))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.primaryColour, range: NSMakeRange(0, attributedString.length))

        if product?.oldPrice != nil{
        productOldPrice.attributedText = attributedString
        }

        productCategory.text = product?.category?.rawValue
        productStockCount.text = "\(product?.stock ?? 0)"
        if (product?.stock ?? 0) > 0 {
            productInStock.text = "In Stock"
        }else{
            productInStock.text = "Out of Stock"
        }
        
        let placeHolderImage = UIImage(named: "placeholderImage")
        
        if let imageURL = product?.image, !imageURL.isEmpty {
            productImageView.setImage(url: imageURL, defaultImage: placeHolderImage)
        } else {
            productImageView.image = placeHolderImage
        }
       
    }

    // MARK: - Table view data source & delegates

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 275
        default:
            return 75
        }
    }

}
