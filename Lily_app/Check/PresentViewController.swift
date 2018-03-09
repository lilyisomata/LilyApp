//
//  PresentViewController.swift
//  Lily_app
//
//  Created by Lilico Isomata on 2017/07/08.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

extension UIView {
    
    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    // 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 角丸設定
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


class PresentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
   
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //フォント
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "07LogoTypeGothic7", size: 10)!]
        dateTextField.font = UIFont(name:"07LogoTypeGothic7", size:15)
        
        dateTextField.delegate = self

        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: dateTextField.frame.size.height - width, width:  dateTextField.frame.size.width, height: 4)
        border.borderWidth = width
        
        dateTextField.layer.addSublayer(border)
        dateTextField.addUnderline(width: 2.0, color: UIColor.darkGray)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func camera(){
        
        print("pushed")
            
            
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated:  true, completion:  nil)
    } else {
    
    print("error")
    //アラート
            let alert: UIAlertController = UIAlertController(title: "Erorr", message: "カメラを起動できません", preferredStyle: .alert)
            
        }
    }

    
    //写真を持ってくる
    @objc(imagePickerController:didFinishPickingMediaWithInfo:) func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    

    
   @IBAction func album(){
    
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        }
    }
    
    //textFieldを打ち終わった時にキーボードを閉じるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
