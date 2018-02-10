//
//  ViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/05/13.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    
    //フォント設定ロゴたいぷゴシック
   // guard; let myfont = UIFont(name: "07LogoTypeGothic-Condense", size: 20) != nil else { return}
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //フォント設定ロゴたいぷゴシック
       // guard let myfont = UIFont(name: "07LogoTypeGothic-Condense", size: 20) != nil else { return}
        
        
        
        
        //アプリを開始するたびにUserDefaultsの中身をリセット
        let ud = UserDefaults.standard
        ud.removeObject(forKey: "name")
        ud.removeObject(forKey: "check")
        ud.removeObject(forKey: "birthday")
        //ud.removeObject(forKey: "\(String(describing: CheckTableViewIndex!))\(indexPath.row)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        performSegue(withIdentifier: "Next", sender: nil)
    }
    
    
    
}

