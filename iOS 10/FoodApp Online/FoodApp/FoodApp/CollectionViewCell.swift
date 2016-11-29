//
//  CollectionViewCell.swift
//  FoodApp
//
//  Created by hussien alrubaye on 11/27/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var laName: UILabel!
    @IBOutlet weak var laImage: UIImageView!
    
    
    func SetImage(url:String){
        //paralel process
        DispatchQueue.global().async {
            
            do{
                // load json server
                let AppURL=URL(string: url)!
                let data=try Data(contentsOf: AppURL)
             
                // access to UI
                DispatchQueue.global().sync {
             self.laImage.image = UIImage(data: data)
                }
                
            }
            catch {
                print("cannot load from server")
            }
   
    }
    }
}
