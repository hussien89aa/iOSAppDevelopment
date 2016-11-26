//
//  TableViewCell.swift
//  ZooApp
//
//  Created by hussien alrubaye on 11/26/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var laImage: UIImageView!
    @IBOutlet weak var laName: UILabel!
    @IBOutlet weak var laDes: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
