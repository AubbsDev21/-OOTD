//
//  PostViewController.swift
//  OOTD
//
//  Created by Aubre Body on 4/1/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase
class PostViewController: UIViewController {
    var ref: DatabaseReference!
    @IBOutlet weak var postimageview: UIImageView!
    @IBOutlet weak var posttextview: UITextView!
    @IBOutlet weak var Postbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Postbutton.layer.cornerRadius = 3
    }

    

    @IBAction func dismisscontroller(_ sender: Any){
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func postbutton(_ sender: Any) {
        PostHandler()
    }
    @IBAction func addimageHandler(_ sender: Any) {
        PostPicHandler()
    }
    
    func PostHandler() {
        guard let description = posttextview.text else {
            return
        }
        let imageID = NSUUID().uuidString
        let stroageref = Storage.storage().reference().child("Post_images").child("\(imageID).jpg")
        
        guard let imageData = UIImageJPEGRepresentation(self.postimageview.image!, 0.1) else {
            return print("error")
        }
        
        stroageref.putData(imageData, metadata: nil) { (metadata, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
        
            if let postImageURL = metadata?.downloadURL()?.absoluteString {
                self.ref = Database.database().reference().child("Post")
                
                let userid = Auth.auth().currentUser?.uid
                let childref = self.ref.childByAutoId()
                let timestamp = NSDate().timeIntervalSince1970
                let value = ["description": description, "postImageURL": postImageURL, "UID": userid, "timestamp": timestamp] as [String : Any]
                
                childref.updateChildValues(value)
                
               
            }
             self.performSegue(withIdentifier: "backseguewway", sender: nil)
        }
       
    }
    
}
