//
//  TableViewCell.swift
//  ChatApp
//
//  Created by hussien alrubaye on 1/27/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import Firebase
class TableViewCell: UITableViewCell {

    @IBOutlet weak var txtText: UILabel!
  
    @IBOutlet weak var iv_Image_post: UIImageView!
    func setText(msg:Message){
        txtText.text="\(msg.UserName!):\(msg.text!)"
      
    }
    func setTextWithImage(msg:Message){
       txtText.text="\(msg.UserName!):\(msg.text!)"
        SetImage(url: msg.ImagePath!)
       //self.iv_Image_post.layer.cornerRadius = 25;
      // self.iv_Image_post.layer.masksToBounds = true;
    }
    
    func SetImage(url:String){
        //load images
        let storageRef = FIRStorage.storage().reference(forURL: "gs://demoyoutubeios.appspot.com")
        // Create a reference to the file you want to download
        let islandRef = storageRef.child(url)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.data(withMaxSize: 8 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Data for "images/island.jpg" is returned
                // let image = UIImage(data: data!)
                self.iv_Image_post.image = UIImage(data: data!)
            }
        }
        
        
        
    }
}
