//
//  HomeViewController.swift
//  P6 Futbol
//
//  Created by Daniel S on 19/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "IWEB -2016"
    }
    
    @IBAction func touchClasification() {
        
        let classifViewController: ClassifViewController = ClassifViewController()
        navigationController?.pushViewController(classifViewController, animated: true)
        
    }
    
    
    @IBAction func touchTeams() {
        
        let teamsViewController: TeamsViewController = TeamsViewController()
        navigationController?.pushViewController(teamsViewController, animated: true)
    }
    
    
    @IBAction func touchMatches() {
    }
    
    
}
