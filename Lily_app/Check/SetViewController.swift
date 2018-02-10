//
//  SetViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/10.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,setTableViewCellDelegate {
    
//    タイトル
    @IBOutlet weak var TitleTextField: UITextField!
//     CheckTableViewのインデックス値を保持しておく変数
    var CheckTableViewIndex : Int?
    
    var checkArray : Array<String> = []
    let ud = UserDefaults.standard
    


        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        //titletextfieldいじり
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: TitleTextField.frame.size.height - width, width:  TitleTextField.frame.size.width, height: 4)
        border.borderWidth = width
        
        
        TitleTextField.layer.addSublayer(border)
        
        
       
       
        //配列が存在するなら(まあこのViewに来るまでには存在しているはず)配列を取得
        if let aaa = ud.object(forKey: "check"){
            checkArray = aaa as! Array<String>
            self.TitleTextField.text = checkArray[CheckTableViewIndex!]
        }
    }


   
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        
        //選択したセルの番号と同じところに保存
        checkArray[CheckTableViewIndex!] = self.TitleTextField.text!
        
        //新規作成していたなら
        if (CheckTableViewIndex == checkArray.count-1){
            checkArray.append("New event")
        }
        
        //userdefaultsに保存
        ud.set(checkArray, forKey: "check")
        ud.synchronize()

        
    }
    
    
//    UITableViewDataSourceのデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! SetTableViewCell
        
        //cell.initialize()
        cell.delegate = self
        //  cellにCheckTableViewとSetTableViewのインデックスをわたす
        cell.key = "\(String(describing: CheckTableViewIndex!))\(indexPath.row)"
        
        //celldelegateの先がcellということを設定
        cell.textfield.delegate = cell
        cell.textfield.text = UserDefaults.standard.string(forKey: "\(String(describing: CheckTableViewIndex!))\(indexPath.row)")
        
        //α値（チェックマークの色の濃さ）の設定
        let buttonAlpha = ud.float(forKey: "\(String(describing: CheckTableViewIndex!))\(indexPath.row)1")
        
        if  buttonAlpha == 0 || buttonAlpha == 0.05{
            cell.Button!.alpha = 0.05
        } else {
            cell.Button!.alpha = 1
        }
        
        let buttonAlpha2 = UserDefaults.standard.float(forKey: "\(String(describing: CheckTableViewIndex!))\(indexPath.row)2")
        
        if  buttonAlpha2 == 0 || buttonAlpha2 == 0.05{
            cell.Button2!.alpha = 0.05
        } else {
            cell.Button2!.alpha = 1
        }
        
        
        return cell
    }
    
    
    func doubleButtonPushed(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier:"PresentView")
        self.show(nextView, sender: nil)
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
