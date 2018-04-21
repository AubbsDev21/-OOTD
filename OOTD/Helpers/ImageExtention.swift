//
//  ImageExtention.swift
//  OOTD
//
//  Created by Aubre  Body on 4/20/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
let cacheBank = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImagewithURLString(URLString: String) {
        
        if let cacheImage = cacheBank.object(forKey: URLString as AnyObject) as? UIImage {
            self.image = cacheImage
            return
        }
        
        let url = NSURL(string: URLString)
        let reqeust = URLRequest(url: url! as URL)
        URLSession.shared.dataTask(with: reqeust) { (data, res, err) in
         
            if err != nil {
                print(err)
                return
            }
            DispatchQueue.main.async {
                //dowloads everyimage from firebase and puts it into a cache bank
                if let downloadedImage = UIImage(data: data!) {
                    cacheBank.setObject(downloadedImage, forKey: URLString as AnyObject)
                    self.image = downloadedImage
                }
                
            }
        }
        
    }
}
