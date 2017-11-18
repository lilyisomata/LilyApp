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
    
    // CheckTableViewとSetTableViewのインデックス値を保持しておく変数
    var key : String!
    
    
//    ボタンを押したらチェック、非チェックを切り替え、UserDefaultsに保存
    @IBAction func buttonPushed(_ sender: UIButton) {
        
        if sender.alpha == 1 {
            sender.alpha = 0.05
        } else {
            sender.alpha = 1
        }
        
        UserDefaults.standard.set(sender.alpha, forKey: key + "\(sender.tag)")
    }
    
}
