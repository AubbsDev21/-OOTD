//
//  PhotoViewCell.swift
//  OOTD
//
//  Created by Aubre  Body on 4/20/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase
class PhotoViewCell: UITableViewCell {

    var post: Posts? {
        didSet{
            self.updateCell()
        }
    }
    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionView: UIView!
    @IBOutlet weak var CaptionLabel: UILabel!
    

    func updateCell() {
        captionView.layer.shadowPath = UIBezierPath(rect: captionView.bounds).cgPath
        captionView.layer.shadowColor = UIColor.black.cgColor
        captionView.layer.shadowOpacity = 0.1
        captionView.layer.shadowOffset = CGSize(width: 2, height: 2)
        captionView.layer.shadowRadius = 2
        captionView.layer.masksToBounds = false
        captionView.layer.cornerRadius = 3.0
        
        self.CaptionLabel.text = post?.Description
        
        
        self.postImageView.loadImagewithURLString(URLString: (post?.postPic)!)
    }
    
}
