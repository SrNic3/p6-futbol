//
//  ClassifTableViewCell.swift
//  P6 Futbol
//
//  Created by Daniel S on 21/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit


class ClassifTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uiLabelFullName: UILabel!
    @IBOutlet weak var uiImageViewShield: UIImageView!
    @IBOutlet weak var uiLabelPos: UILabel!
    @IBOutlet weak var uiLabelPoints: UILabel!
    @IBOutlet weak var uiLabelWins: UILabel!
    @IBOutlet weak var uiLabelDraws: UILabel!
    @IBOutlet weak var uiLabelLoss: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        //aqui es donde hay que poner el label y la imagen a nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setFullName(name: String) {
        uiLabelFullName.text = name
    }
    
    func setShield(image: UIImage) {
        uiImageViewShield.image = image
    }
    
    func setPosition(name: String) {
        uiLabelPos.text = name
    }
    
    func setWins(name: String) {
        uiLabelWins.text = name
    }

    func setPoints(name: String) {
        uiLabelPoints.text = name
    }
    
    func setDraws(name: String) {
        uiLabelDraws.text = name
    }
    
    func setLosses(name: String) {
        uiLabelLoss.text = name
    }

}
