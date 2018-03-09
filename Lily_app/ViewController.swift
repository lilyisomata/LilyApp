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
    
    @IBOutlet var checkbutton : UIButton!
    @IBOutlet var profilebutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        checkbutton.titleLabel?.font = UIFont(name:"07LogoTypeGothic7", size:40)
        profilebutton.titleLabel?.font = UIFont(name:"07LogoTypeGothic7", size:40)

        
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        performSegue(withIdentifier: "Next", sender: nil)
    }
    
    
    
}

