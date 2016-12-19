//
//  MainPresenter.swift
//  P6 Futbol
//
//  Created by Daniel S on 19/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter {
    
    var navigationController: UINavigationController?
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController;
        
        let homeViewController: HomeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: false)
    }
}
