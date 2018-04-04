//
//  CameraViewController.swift
//  OOTD
//
//  Created by Aubre Body on 4/2/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import AVFoundation
class CameraViewController: UIViewController {
    var takenPhoto:UIImage?
    @IBOutlet weak var CameraView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Snapshotbutton(_ sender: Any) {
    }
    @IBAction func IUimagepickerhandler(_ sender: Any) {
    }
}
