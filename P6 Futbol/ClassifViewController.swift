//
//  ClassifViewController.swift
//  P6 Futbol
//
//  Created by Daniel S on 21/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class ClassifViewController: UIViewController, UITableViewDataSource {
    
    var presenter: ClassifPresenter?
    var teamData: [[String: Any]] = []
    var teamShielData: [Int: UIImage] = [:]
    
    @IBOutlet var uiTableViewClassif: UITableView!
    @IBOutlet var viewParent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Clasificación"
        presenter = ClassifPresenter()
        presenter?.view = self
        
        let interactor = ClassifInteractor()
        interactor.presenter = presenter
        presenter?.interactor = interactor
         
        uiTableViewClassif.register(ClassifTableViewCell.self,forCellReuseIdentifier: "cell")
        let nib: UINib = UINib.init(nibName: "ClassifTableViewCell", bundle: nil)
        uiTableViewClassif.register(nib, forCellReuseIdentifier: "cell")
        
        presenter?.getTeams()
        
        uiTableViewClassif.rowHeight = 100
    }
    
    func refreshTableView(teams:[[String:Any]]) {
        teamData = teams
        DispatchQueue.main.async(){
            //code
            self.uiTableViewClassif.reloadData()
            self.uiTableViewClassif.reloadRows(at: self.uiTableViewClassif.indexPathsForVisibleRows!, with: UITableViewRowAnimation.fade)
        }
    }
    
    func paintShield(image: UIImage, index: Int) {
        teamShielData[index] = image
        DispatchQueue.main.async(){
            //code
            //            let indexPath = [IndexPath.init(item: index, section: 0)]
            //            self.uiTableView.reloadRows(at: indexPath, with: UITableViewRowAnimation.fade)
            if let cell = self.uiTableViewClassif.cellForRow(at: IndexPath.init(item: index, section: 0))  {
                (cell as! ClassifTableViewCell).setShield(image: image)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ClassifTableViewCell = uiTableViewClassif.dequeueReusableCell(withIdentifier: "cell") as! ClassifTableViewCell
        
        cell.setFullName(name: teamData[indexPath.item]["team"] as! String)
        cell.setWins(name: "Victorias: " + String(teamData[indexPath.row]["wins"] as! Int))
        cell.setPosition(name: String(indexPath.row))
        cell.setLosses(name: "Derrotas: " + String(teamData[indexPath.row]["losses"] as! Int))
        cell.setDraws(name: "Empates: " + String(teamData[indexPath.row]["draws"] as! Int))
        cell.setPoints(name: "Puntos: " + (teamData[indexPath.row]["points"] as! String))

        
        
        if let image = teamShielData[indexPath.item] {
            cell.setShield(image: image)
        } else {
            cell.setShield(image: #imageLiteral(resourceName: "load"))
        }
        return cell
    }
    
}

