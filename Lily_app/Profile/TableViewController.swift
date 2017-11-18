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

class TableViewController: UITableViewController {

    var nameArray: Array<String> = []
    let ud = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        
        //-------------------名前リストの取得-------------------------//
        
        //名前リストが既に存在するならそのリストを取得
        if let aaa = ud.object(forKey: "name"){
            nameArray = aaa as! Array<String>
        } else {
        //存在しないなら「新規作成」という名前の配列を追加し、保存
            nameArray.append("新規作成")
            ud.set(nameArray, forKey: "name")
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
        return nameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = nameArray[indexPath.row]
                
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
