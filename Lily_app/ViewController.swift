//
//  ViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/05/13.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
<<<<<<< HEAD
    @IBOutlet var checkbutton : UIButton!
    @IBOutlet var profilebutton: UIButton!

=======
>>>>>>> master
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
<<<<<<< HEAD
        checkbutton.titleLabel?.font = UIFont(name:"07LogoTypeGothic7", size:40)
        profilebutton.titleLabel?.font = UIFont(name:"07LogoTypeGothic7", size:40)
        
        //アプリを開始するたびにUserDefaultsの中身をリセット
        let ud = UserDefaults.standard
        ud.removeObject(forKey: "name")
        ud.removeObject(forKey: "check")
        ud.removeObject(forKey: "birthday")
        //ud.removeObject(forKey: "\(String(describing: CheckTableViewIndex!))\(indexPath.row)")
=======
        //フォント設定ロゴたいぷゴシック
       // guard let myfont = UIFont(name: "07LogoTypeGothic-Condense", size: 20) != nil else { return}
        
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
>>>>>>> master
        
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        performSegue(withIdentifier: "Next", sender: nil)
    }
    
    
    
}

