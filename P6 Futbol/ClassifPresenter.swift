//
//  ClassifPresenter.swift
//  P6 Futbol
//
//  Created by Daniel S on 21/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class ClassifPresenter {
    
    var view : ClassifViewController?
    var interactor : ClassifInteractor?
    
    init () {
        
    }
    
    func getTeams() {
        interactor?.getTeams(page: 0)
    }
    
    
    func getTeamsComplete(teams:[[String: Any]]) {
        view?.refreshTableView(teams: teams)
        var i = 0
        for team in teams {
            interactor?.getShieldWithURL(url: team["shield"] as! String, index: i)
            i += 1
        }
    }
    
    func getTeamsShieldComplete(image: UIImage, index: Int) {
        view?.paintShield(image: image, index: index)
    }
    
    
}

