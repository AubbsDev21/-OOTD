//
//  ViewController.swift
//  #OOTD
//
//  Created by Aubre Body on 3/30/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    var ref : DatabaseReference!
    @IBOutlet weak var loginbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       loginbutton.layer.cornerRadius = 20
        
    }
  
   

    @IBAction func loginbuttonaction(_ sender: Any) {
        
       
        
        
    }
    
    @IBAction func Emailsegueway(_ sender: Any) {
        performSegue(withIdentifier: "loginemail", sender: nil)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        FacebookAuth()
        
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print()
        
    }
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    
    
    
    
    func FacebookAuth() {
      let asscessToken = FBSDKAccessToken.current()
        
      let credential = FacebookAuthProvider.credential(withAccessToken: (asscessToken?.tokenString)!)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let user = user {
                let uid = user.uid
                let name = user.displayName
                let email = user.email
                let photourl = user.photoURL
                
                
                if let profileImageURL = photourl?.absoluteString {
                    let values = ["Email": email, "Username": name, "profileImageURL": profileImageURL]
                    
                    self.ref = Database.database().reference()
                    self.ref.child("Users").child(uid).setValue(values)
                    
                 
                    
                }
            }
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            print(result)
        }
         performSegue(withIdentifier: "feedsegue", sender: nil)
    }
    
}

