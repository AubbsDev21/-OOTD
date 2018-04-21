//
//  FeedViewController.swift
//  #OOTD
//
//  Created by Aubre Body on 3/30/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit
import Firebase
class FeedViewController: UITableViewController {

    var posts = [Posts]()
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "camera"), style: .plain, target: self, action: #selector(postsegueway))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Logout", style: .plain, target: self, action: nil)
        FetchPost()
    }

    @objc func postsegueway() {
        performSegue(withIdentifier: "postsegueway", sender: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoViewCell
            let post = self.posts[indexPath.row]
            cell.post = post
        // Configure the cell...

        return cell
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func FetchPost() {
        ref = Database.database().reference().child("Post")
        
        ref.observe(.value, with: { (DataSnapshot) in
            for child in DataSnapshot.children.allObjects as! [DataSnapshot]{
                if let value = child.value as?  NSDictionary{
                    let post = Posts()
                    let uid = value["UID"] as? String ?? " "
                    let description = value["description"] as? String ?? " "
                    let postImageURL = value["postImageURL"] as? String ?? " "
                    let timestamp = value["timestamp"] as? NSNumber
                   
                    post.id = child.key
                    post.UID = uid
                    post.Description = description
                    post.postPic = postImageURL
                    self.posts.append(post)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }, withCancel: nil)
      
    }
    

    

}
