//
//  LoginController+extension.swift
//  OOTD
//
//  Created by Aubre Body on 4/1/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase
extension EmailLoginViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
    func handleProfilePic() {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var TheselectedImage: UIImage?
        
        if let orignalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            TheselectedImage = orignalImage
        }
            
        else if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            TheselectedImage = editedImage
            
        }
        
        dismiss(animated: true, completion: nil)
        
        //attaching selected image to view
        if let selectedImage = TheselectedImage  {
            userimageView.image = selectedImage
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func registerHandleButton() {
        guard let email = Emailtextfield.text, let name = usernametextFiled.text, let password = PasswordtextFeild.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
                self.Emailtextfield.text = nil
                self.PasswordtextFeild.text = nil
                
                return
            }
            
            else {
                
                //uploading
                let imageID = NSUUID().uuidString
                let stroageref = Storage.storage().reference().child("profile_images").child("\(imageID).jpg")
                
                
                guard let imageData = UIImageJPEGRepresentation(self.userimageView.image!, 0.1) else {
                    return print("error")
                }
                
                stroageref.putData(imageData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                        }
                    if let profileImageURL = metadata?.downloadURL()?.absoluteString {
                        let value = ["username":name,"Email":email,"Password":password,"profileImageURL": profileImageURL ]
                        self.ref = Database.database().reference()
                        self.ref.child("Users").child((user?.uid)!).setValue(value)
                        
                    }
                })
            }
        }
        performSegue(withIdentifier: "loginSeugeway", sender: nil)
    }
    
}
