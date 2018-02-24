//
//  ProfileViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/05/27.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit
import RealmSwift


extension UITextField {
    func addUnderline(width: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
}


class ProfileViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var birthdaylabel: UILabel!

    //選択したセルの番号を取得
    var index : Int?
    
    //realmのインスタンスを生成
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //フォント設定
     navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "07LogoTypeGothic7", size: 10)!]
        
        
        namelabel.font = UIFont(name:"07LogoTypeGothic7", size:20)
        birthdaylabel.font = UIFont(name:"07LogoTypeGothic7", size:20)
        nameTextField.font = UIFont(name:"07LogoTypeGothic7", size:25)
        birthdayTextField.font = UIFont(name:"07LogoTypeGothic7", size:25)
        
        // セーブデータを取得
        let saveData = realm.objects(ProfileViewSaveData.self)
        self.nameTextField.text = saveData[index!].title
        self.birthdayTextField.text = saveData[index!].birthday
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // realmに保存されているSaveFileを全て取得
        let saveData = realm.objects(ProfileViewSaveData.self)
        
        // 書き込み
        try! realm.write {
            saveData[index!].title = self.nameTextField.text!
            saveData[index!].birthday = self.birthdayTextField.text!
            // リストの最後の要素だったら新規作成
            if index! == saveData.count - 1{
                let newData = ProfileViewSaveData()
                newData.title = "new"
                newData.birthday = ""
                realm.add(newData)
            }
        }
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる,後で、可変にする
        return 10;
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

