//
//  CircularImageView.swift
//  Azayem_customer
//
//  Created by Mena Gamal on 12/23/19.
//  Copyright © 2019 CARNVAL. All rights reserved.
//


import UIKit

class CircularImageView: UIImageView {
    
    override func didMoveToWindow() {
        
        let size = frame.size.width
        self.layer.cornerRadius = size / 2
        clipsToBounds = true
        
        super.didMoveToWindow()
    }
}

