//
//  TableViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/05/13.
//  Copyright © 2017年 soufuru. All rights reserved.
//



//--------------------------------------------------------------------------------------//
//storyboardのsegueを消しておくこと！
//profileViewControllerのstoryboardIDを"ProfileVC"に変更！
//
//アプリを開始するたびにUserDefaultsの内容をリセットするようにしてます。(ViewController.swiftを参照)
//
//--------------------------------------------------------------------------------------//



import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var nameArray: Array<String> = []
    var birthdayArray: Array<String> = []
    let ud = UserDefaults.standard
    
    // realmのインスタンスを生成
    let realm = try! Realm()
    
    override func viewWillAppear(_ animated: Bool) {
        //tableViewの更新
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //フォント設定
//        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "07LogoTypeGothic7", size: 10)!]
       
//        self.navigationController?.navigationItem.backBarButtonItem?.
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.separatorInset = .zero
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セーブデータを取得
        let saveData = realm.objects(ProfileViewSaveData.self)
        
        // 初回起動時のみ
        if saveData.count == 0 {
            let newData = ProfileViewSaveData()
            newData.title = "new"
            newData.birthday = ""
            try! realm.write {
                realm.add(newData)
            }
        }
        
        return saveData.count
    }
    
    // セルの情報
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // セーブデータを取得
        let saveData = realm.objects(ProfileViewSaveData.self)
        cell?.textLabel?.text = saveData[indexPath.row].title
        
        return cell!
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //    エディットモード
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let saveData = realm.objects(ProfileViewSaveData.self)
            
            try! realm.write {
                realm.delete(saveData[indexPath.row])
                if indexPath.row != saveData.count{
                    for i in indexPath.row ..< saveData.count-1 {
                        saveData[i].title = saveData[i+1].title
                        saveData[i].birthday = saveData[i+1].birthday
                    }
                }
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    //セルが選択された時
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //storyboardを取得
        let storyboard : UIStoryboard = self.storyboard!
        //遷移先のViewControllerを取得
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        
        //遷移先のに選択されたセルの番号(indexPath.row)を渡す
        profileVC.index = indexPath.row
        
        //showで画面遷移(NavigationControllerが受け継がれるので戻るボタンが自動的について嬉しい)
        self.show(profileVC, sender: nil)
    }
    
    
    
    //前回、
    // -「~didSelectRowAt indexPath~」で選択セルの番号を取得
    // -「prepare(for segue)」でセル番号の受け渡し
    // っていうことをしようとしてた気がするけど、それだとうまくいかんかった！
    
    // それはすごく簡単な理由で、didSelectRowよりも先にPrepareが呼ばれて、値の受け渡しが後になっちゃうから。
    // 上記2つのメソッドを用意してprint()で何かしら出力してみればよくわかると思う！
    
}

