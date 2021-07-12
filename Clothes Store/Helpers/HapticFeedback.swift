//
//  HapticFeedback.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import UIKit
import AudioToolbox

class Haptic {
    
    class func feedBack(){
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        AudioServicesPlaySystemSound(1104)
    }
}


