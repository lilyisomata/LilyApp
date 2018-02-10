//
//  SetTableViewCell.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/24.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

@objc protocol setTableViewCellDelegate {
    func doubleButtonPushed(_ sender: UIButton)
}

class SetTableViewCell: UITableViewCell, UITextFieldDelegate{

    
    @IBOutlet weak var Button : UIButton!
    @IBOutlet weak var Button2 : UIButton!
    @IBOutlet weak var textfield: UITextField!
    
   
    
   
    // CheckTableViewとSetTableViewのインデックス値を保持しておく変数
    var key : String!
    var delegate: setTableViewCellDelegate!
    
    
   
    
  
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        
        if sender.alpha == 1 {
            sender.alpha = 0.05
        } else {
            sender.alpha = 1
        }
        
        UserDefaults.standard.set(sender.alpha, forKey: key + "\(sender.tag)")
    }
    
    //doubleButtonPushedされたら、double〜のdelegeteに行く
    @IBAction func doubleButtonPushed(_ sender: UIButton) {
        self.delegate?.doubleButtonPushed(sender)
    }
    
    
    //入力が終わったタイミングでテキストフィールドのテキスト保存
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        UserDefaults.standard.set(textField.text!, forKey: key)
        return true
    }
    
 
}
