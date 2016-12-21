//
//  TeamsViewControllerCell.swift
//  P6 Futbol
//
//  Created by Daniel S on 20/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit


class TeamsTableViewCell: UITableViewCell {
 
    @IBOutlet weak var uiLabelFullName: UILabel!
    @IBOutlet weak var uiImageViewShield: UIImageView!
    
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

}
