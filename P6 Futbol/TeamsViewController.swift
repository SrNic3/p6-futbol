//
//  MatchesViewController.swift
//  P6 Futbol
//
//  Created by Daniel S on 20/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class TeamsViewController: UIViewController, UITableViewDataSource {
    
    var presenter: TeamsPresenter?
    var teamData: [[String: String]] = []
    var teamShielData: [Int: UIImage] = [:]

    @IBOutlet weak var uiTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "EQUIPOS"
        presenter = TeamsPresenter()
        presenter?.view = self
        
        let interactor = TeamsInteractor()
        interactor.presenter = presenter
        presenter?.interactor = interactor
        
        self.uiTableView.register(TeamsTableViewCell.self, forCellReuseIdentifier: "cell")
        let nib: UINib = UINib.init(nibName: "TeamsTableViewCell", bundle: nil)
        self.uiTableView.register(nib, forCellReuseIdentifier: "cell")
 
        presenter?.getTeams()
    
    }
    
    func refreshTableView(teams:[[String:String]]) {
        teamData = teams
        DispatchQueue.main.async(){
            //code
            self.uiTableView.reloadData()
            self.uiTableView.reloadRows(at: self.uiTableView.indexPathsForVisibleRows!, with: UITableViewRowAnimation.fade)
        }
    }
    
    func paintShield(image: UIImage, index: Int) {
        teamShielData[index] = image
        DispatchQueue.main.async(){
            //code
//            let indexPath = [IndexPath.init(item: index, section: 0)]
//            self.uiTableView.reloadRows(at: indexPath, with: UITableViewRowAnimation.fade)
            if let cell = self.uiTableView.cellForRow(at: IndexPath.init(item: index, section: 0))  {
                (cell as! TeamsTableViewCell).setShield(image: image)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TeamsTableViewCell = uiTableView.dequeueReusableCell(withIdentifier: "cell") as! TeamsTableViewCell
        
        cell.setFullName(name:teamData[indexPath.item]["fullName"]!)
        if let image = teamShielData[indexPath.item] {
            cell.setShield(image: image)
        } else {
            cell.setShield(image: #imageLiteral(resourceName: "load"))
        }
        return cell
    }

}
