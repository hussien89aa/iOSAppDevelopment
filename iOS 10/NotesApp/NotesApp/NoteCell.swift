//
//  NoteCell.swift
//  NotesApp
//
//  Created by hussien alrubaye on 1/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var laDateNote: UILabel!
    @IBOutlet weak var txtDetails: UITextView!
    @IBOutlet weak var txtTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func SetCell(note:MyNotes )  {
        txtTitle.text=note.title
        txtDetails.text=note.details
        // Convert Date to String ( read date_save filed and convert it to string)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yy h:mm a"
        let now = dateformatter.string(from: note.date_save as! Date)
        
        laDateNote.text = now
      
    }

}
