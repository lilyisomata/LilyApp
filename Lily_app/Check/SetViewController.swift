//
//  SetViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/10.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit
import RealmSwift

class SetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,setTableViewCellDelegate {
    
    //    タイトル
    @IBOutlet weak var TitleTextField: UITextField!
<<<<<<< HEAD
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
   
//     CheckTableViewのインデックス値を保持しておく変数
=======
    //     CheckTableViewのインデックス値を保持しておく変数
>>>>>>> master
    var CheckTableViewIndex : Int?
    var checkArray : Array<String> = []
    
    var key : String = ""
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        //フォント
         navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "07LogoTypeGothic7", size: 10)!]
        
        
        TitleTextField.font = UIFont(name:"07LogoTypeGothic7", size:20)
        label1.font = UIFont(name:"07LogoTypeGothic7", size:17)
        label2.font = UIFont(name:"07LogoTypeGothic7", size:17)
        
        
        
=======
        //------------------りりーデザイン-------------------------------//
>>>>>>> master
        //titletextfieldいじり
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: TitleTextField.frame.size.height - width, width:  TitleTextField.frame.size.width, height: 1)
        border.borderWidth = width
        
        TitleTextField.layer.addSublayer(border)
        //------------------------------------------------------------//
        let saveData = realm.objects(CheckViewSaveData.self)
        self.TitleTextField.text = saveData[CheckTableViewIndex!].title
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let saveData = realm.objects(CheckViewSaveData.self)
        
        try! realm.write {
            saveData[CheckTableViewIndex!].title = self.TitleTextField.text!
            
            //最後のビューなら次のビューを追加
            if CheckTableViewIndex == saveData.count - 1{
                let newData = CheckViewSaveData()
                newData.title = "new"
                let hArray = highrightArray()
                hArray.highright1 = 0.0
                hArray.highright2 = 0.0
                let tArray = textFieldArray()
                tArray.text = ""
                for _ in 0 ..< 10 {
                    newData.highrighted.append(hArray)
                    newData.text.append(tArray)
                }
                realm.add(newData)
            }
        }
    }
    
    //    UITableViewDataSourceのデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
<<<<<<< HEAD
        
        
         
        
=======
>>>>>>> master
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! SetTableViewCell
        let saveData = realm.objects(CheckViewSaveData.self)
        
        cell.delegate = self
        cell.CheckViewIndexPath = CheckTableViewIndex!
        cell.indexPath = indexPath.row
        
        // celldelegateの委譲先がcellということを設定
        cell.textfield.delegate = cell
        // cellのテキストを指定
        cell.textfield.text = saveData[CheckTableViewIndex!].text[indexPath.row].text
        
        //     α値（チェックマークの色の濃さ）の設定
        let buttonAlpha = saveData[CheckTableViewIndex!].highrighted[indexPath.row].highright1
        if  buttonAlpha <= 0.6{
            cell.Button!.alpha = 0.05
        } else {
            cell.Button!.alpha = 1.0
        }
        
        let buttonAlpha2 = saveData[CheckTableViewIndex!].highrighted[indexPath.row].highright2
        if  buttonAlpha2 <= 0.6 {
            cell.Button2!.alpha = 0.05
        } else {
            cell.Button2!.alpha = 1.0
        }
<<<<<<< HEAD
        
        
        
=======
>>>>>>> master
        return cell
    }
    
    
    //デリゲートメソッド
    func doubleButtonPushed(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier:"PresentView")
        
        UserDefaults.standard.set(key, forKey: "presentKey")
        self.show(nextView, sender: key)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

