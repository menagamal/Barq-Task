//
//  CNavigation.swift
//  CLib
//
//  Created by carnval on 4/10/18.
//  Copyright © 2018 carnval. All rights reserved.
//

import UIKit


public class CNavigation: UINavigationController {
  override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
    self.visibleViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    super.pushViewController(viewController, animated: animated)
  }

}
extension CNavigation{
  func setUp(){
    
    self.navigationBar.barTintColor = UIColor.red
    self.navigationBar.isTranslucent = false
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
  }
}
