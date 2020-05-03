//
//  HomeBuilder.swift
//  BarqTask
//
//  Created by Mena Gamal on 5/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class HomeBuilder {
    func build(vc: HomeViewController,navigator:UINavigationController) {
        vc.viewModel = HomeViewModel(view: vc, API: HomeService())
    }
}

