//
//  SetTableViewCell.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/24.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Button : UIButton!
    @IBOutlet weak var Button2 : UIButton!
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        sender.alpha = 0.05
    }
    

}
