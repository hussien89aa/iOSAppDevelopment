//
//  TableViewCell.swift
//  StoreApp
//
//  Created by hussien alrubaye on 1/25/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var laStoreName: UILabel!
    
    @IBOutlet weak var laDateAdded: UILabel!

    @IBOutlet weak var laImage: UIImageView!
    @IBOutlet weak var laItemName: UILabel!
    
    func setMyCell(item:Items) {
   laStoreName.text=item.toStore?.name
        laImage.image=item.image as? UIImage
        laItemName.text=item.item_name
        // convert date to string
        let dateformat=DateFormatter()
        dateformat.dateFormat="MM/DD/yy h:mm a"
        laDateAdded.text=dateformat.string(from: item.date_add as! Date)
    }
    
}
