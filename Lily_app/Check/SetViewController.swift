//
//  SetViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/10.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    タイトル
    @IBOutlet weak var TitleTextField: UITextField!
//     CheckTableViewのインデックス値を保持しておく変数
    var CheckTableViewIndex : Int?
    
    var checkArray : Array<String> = []
    let ud = UserDefaults.standard
    


    @IBOutlet weak var cellLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TitleTextField.text = UserDefaults.standard.string(forKey: "Title\(String(describing: CheckTableViewIndex!))")
        
        
        //titletextfieldいじり
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: TitleTextField.frame.size.height - width, width:  TitleTextField.frame.size.width, height: 1)
        border.borderWidth = width
        
        
        TitleTextField.layer.addSublayer(border)
        TitleTextField.placeholder = "Christmas Present"
        
        
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
            checkArray.append("新規作成")
        }
        
        //userdefaultsに保存
        ud.set(checkArray, forKey: "check")
        ud.synchronize()

        
//        タイトルを保存
       // UserDefaults.standard.set(TitleTextField.text, forKey: "Title\(String(describing: CheckTableViewIndex!))")

    }
    
    
//    UITableViewDataSourceのデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! SetTableViewCell
        
//         cellにCheckTableViewとSetTableViewのインデックスをわたす
        cell.key = "\(String(describing: CheckTableViewIndex!))\(indexPath.row)"
        
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
