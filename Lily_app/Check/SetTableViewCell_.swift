//
//  SetTableViewCell.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/24.
//  Copyright © 2017年 soufuru. All rights reserved.

import UIKit
import RealmSwift

@objc protocol setTableViewCellDelegate {
    func doubleButtonPushed(_ sender: UIButton)
}

class SetTableViewCell: UITableViewCell, UITextFieldDelegate{
    
    @IBOutlet weak var Button : UIButton!
    @IBOutlet weak var Button2 : UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    // CheckTableViewとSetTableViewのインデックス値を保持しておく変数
    let realm = try! Realm()
    var CheckViewIndexPath : Int!
    var indexPath : Int!
    
    //    var key : String!
    var delegate: setTableViewCellDelegate!
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        if sender.alpha == 1 {
            sender.alpha = 0.05
        } else {
            sender.alpha = 1
        }
        
        let saveData = realm.objects(CheckViewSaveData.self)
        
        try! realm.write {
            let newData = highrightArray()
            if sender.tag == 1{
                newData.highright1 = Double(sender.alpha)
                newData.highright2 = Double(Button2.alpha)
                
            } else {
                newData.highright1 = Double(Button.alpha)
                newData.highright2 = Double(sender.alpha)
                
            }
            saveData[CheckViewIndexPath].highrighted[indexPath] = newData
            
        }
        
        
    }
    
    //doubleButtonPushedされたら、double〜のdelegeteに行く
    @IBAction func doubleButtonPushed(_ sender: UIButton) {
        self.delegate?.doubleButtonPushed(sender)
    }
    
    //入力が終わったタイミングでテキストフィールドのテキスト保存
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let saveData = realm.objects(CheckViewSaveData.self)
        try! realm.write {
            saveData[CheckViewIndexPath].text[indexPath].text = self.textfield.text!
        }
        //        UserDefaults.standard.set(textField.text!, forKey: key)
        return true
    }
    
    
}

