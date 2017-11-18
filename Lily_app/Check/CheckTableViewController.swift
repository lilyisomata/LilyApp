//
//  CheckTableViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/10.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class CheckTableViewController: UITableViewController {

    var checkArray: Array<String> = []
    let ud = UserDefaults.standard

    
    override func viewWillAppear(_ animated: Bool) {
        
        //-------------------名前リストの取得-------------------------//
        
        //名前リストが既に存在するならそのリストを取得
        if let aaa = ud.object(forKey: "check"){
            checkArray = aaa as! Array<String>
        } else {
            //存在しないなら「新規作成」という名前の配列を追加し、保存
            checkArray.append("新規作成")
            ud.set(checkArray, forKey: "check")
        }
        
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
        return checkArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")
       // let title = UserDefaults.standard.string(forKey :"Title\(String(describing: indexPath.row))")
        cell?.textLabel?.text = checkArray[indexPath.row]
        
      //  if title == nil {
       //     cell!.textLabel!.text = String(indexPath.row)
       // } else {
         //   cell!.textLabel!.text = title!
       // }
        
        
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
            // Delete the row from the data source
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
