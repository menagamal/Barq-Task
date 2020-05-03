//
//  View.swift
//  BarqTask
//
//  Created by Mena Gamal on 5/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
import Foundation
import UIKit
import GoogleMaps
 protocol HomeView {
    
    var mapView: GMSMapView!{
        get set
    }
    var viewModel:HomeViewModel!{
        get set
    }
    
    func update(actions:HomeViewModel.Actions) 
    
    
}
