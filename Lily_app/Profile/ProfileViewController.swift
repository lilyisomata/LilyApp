//
//  ProfileViewController.swift
//  Lily_app
//
//  Created by Lily Isomata on 2017/05/27.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit



extension UITextField {
    func addUnderline(width: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
}


class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var birthdaylabel: UILabel!
    
    let ud = UserDefaults.standard
    //選択したセルの番号を取得
    var index : Int?
    var nameArray : Array<String> = []
    var birthdayArray : Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        namelabel.font = UIFont(name: "07LogoTypeGothic-Condense", size: 20)
        birthdaylabel.font = UIFont(name: "07LogoTypeGothic-Condense", size: 20)
        
        //textfieldを打ち終わった時にキーボードを閉じるためのdelegate
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        
        
        
        //配列が存在するなら(まあこのViewに来るまでには存在しているはず)配列を取得
        if let aaa = ud.object(forKey: "name"){
            nameArray = aaa as! Array<String>
            self.nameTextField.text = nameArray[index!]
        }
        
        if let bbb = ud.object(forKey: "birthday"){
            birthdayArray = bbb as! Array<String>
            self.birthdayTextField.text = birthdayArray[index!]
        } else {
            birthdayArray.append("/")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        //選択したセルの番号と同じところに保存
        nameArray[index!] = self.nameTextField.text!
        birthdayArray[index!] = self.birthdayTextField.text!
        
        //新規作成していたなら
        if (index == nameArray.count-1){
            nameArray.append("New friends")
            birthdayArray.append("/")
        }
        
        //userdefaultsに保存
        ud.set(nameArray, forKey: "name")
        ud.set(birthdayArray, forKey: "birthday")
        ud.synchronize()
        
    }
    
    
    //textFieldを打ち終わった時にキーボードを閉じるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる,100にしとけば足りなくならないでしょう
        return 100;
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
