//
//  EmailLoginViewController.swift
//  OOTD
//
//  Created by Aubre Body on 4/1/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase
class EmailLoginViewController: UIViewController  {
    var ref: DatabaseReference!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var Emailtextfield: UITextField!
    @IBOutlet weak var usernametextFiled: UITextField!
    @IBOutlet weak var PasswordtextFeild: UITextField!
    @IBOutlet weak var userimageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.blue.cgColor
        usernametextFiled.layer.borderWidth = 2
        usernametextFiled.layer.borderColor = UIColor.lightGray.cgColor
        
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginButton(_ sender: Any) {
        registerHandleButton()
        
    }
    
    @IBAction func picpickerbutton(_ sender: Any) {
        handleProfilePic()
    }
    
    @IBAction func CancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
