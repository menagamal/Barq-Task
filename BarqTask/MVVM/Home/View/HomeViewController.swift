//
//  ViewController.swift
//  BarqTask
//
//  Created by Mena Gamal on 5/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import GoogleMaps
class HomeViewController: UIViewController ,HomeView{
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var viewModel: HomeViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeBuilder().build(vc: self, navigator: self.navigationController!)
        viewModel.getAllVideos()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.AddPin()
    }
    
    func update(actions: HomeViewModel.Actions) {
        switch actions {
        case .StartLoading:
            LoadingView.shared.startLoading()
            break
        case .StopLoading:
            LoadingView.shared.stopLoading()
            break
        case .getAllVideos:
            // TODO: Update TableView
            break
        case .Error:
            //
            break
        }
    }
    
}

