//
//  CheckTableViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/10.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit
import RealmSwift

class CheckTableViewController: UITableViewController {
    
    
    var image: UIImageView!
    var checkArray: Array<String> = []
    let ud = UserDefaults.standard
    
    let realm = try! Realm()
    
    override func viewWillAppear(_ animated: Bool) {
        //tableViewの更新
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // セーブデータを取得
        let saveData = realm.objects(CheckViewSaveData.self)
        
        // 初回起動時のみ
        if saveData.count == 0 {
            let newData = CheckViewSaveData()
            newData.title = "new"
            try! realm.write {
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
        
        return saveData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableviewのcellに表示されるtextはcheckArrayのcellのindexpathに入っているtext
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")
        
        let saveData = realm.objects(CheckViewSaveData.self)
        cell?.textLabel?.text = saveData[indexPath.row].title
        
        //        cell?.textLabel?.text = checkArray[indexPath.row]
        
        return cell!
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            checkArray.remove(at: indexPath.row)
            ud.set(checkArray, forKey: "check")
            
            for i in 0 ..< 9{
                ud.removeObject(forKey: "\(indexPath.row)"+"\(i)")
                ud.removeObject(forKey: "\(indexPath.row)"+"\(i)"+"1")
                ud.removeObject(forKey: "\(indexPath.row)"+"\(i)"+"2")
            }
            
            // todo: CollectionViewの番号に対応したキーの情報も削除
            for i in indexPath.row+1 ..< 10{
                for j in 0 ..< 10{
                    ud.set(ud.string(forKey: "\(i+1)"+"\(j)"), forKey: "\(i)"+"\(j)")
                    ud.set(ud.float(forKey: "\(i+1)"+"\(j)"+"1"), forKey: "\(i)"+"\(j)"+"1")
                    ud.set(ud.float(forKey: "\(i+1)"+"\(j)"+"2"), forKey: "\(i)"+"\(j)"+"2")
                }
            }
            
            ud.synchronize()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    //セルが選択された時
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //storyboardを取得
        let storyboard : UIStoryboard = self.storyboard!
        //遷移先のViewControllerを取得
        let setVC = storyboard.instantiateViewController(withIdentifier: "SetVC") as! SetViewController
        
        //遷移先のに選択されたセルの番号(indexPath.row)を渡す
        setVC.CheckTableViewIndex = indexPath.row
        
        //showで画面遷移(NavigationControllerが受け継がれるので戻るボタンが自動的について嬉しい)
        self.show(setVC, sender: nil)
        
        
    }
    
    
}

