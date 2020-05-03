//
//  ShadowView.swift
//  Azayem_customer
//
//  Created by Mena Gamal on 12/25/19.
//  Copyright © 2019 CARNVAL. All rights reserved.
//

import Foundation

import UIKit

class ShadowView: UIView {
    
    override func didMoveToWindow() {
        
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        self.layer.shadowOpacity = 0.8
        
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        // sets the path for the shadow to save ondraw time
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        // cache the shadow so it isn't redrawn
        //        self.layer.shouldRasterize = true
        
        super.didMoveToWindow()
    }
}

