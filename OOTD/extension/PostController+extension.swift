//
//  PostController+extension.swift
//  OOTD
//
//  Created by Aubre Body on 4/2/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase

extension PostViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    func PostPicHandler() {
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
            postimageview.image = selectedImage
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
