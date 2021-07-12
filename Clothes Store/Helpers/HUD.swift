//
//  HUD.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import UIKit


class AnimateMe {

    class func animateLabel(_ label: UIView){

        let viewOriginalPosition = CGRect(x: label.frame.minX, y: label.frame.minY, width: label.frame.width, height: label.frame.height)
        UIView.animate(withDuration: 0.75, delay: 0.0, options: [.curveEaseOut], animations: {

            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY + 65, width: label.frame.width, height: label.frame.height)
            label.alpha = 0.0

        }, completion: { (finished: Bool) in
            label.frame = viewOriginalPosition
            label.alpha = 1.0

        })
    }
}
