//
//  ViewController2.swift
//  NotesApp
//
//  Created by hussien alrubaye on 1/21/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import CoreData
class ViewController2: UIViewController,
UITableViewDataSource,UITableViewDelegate {
 
    @IBOutlet weak var tvListNotes: UITableView!
    var lisNotes=[MyNotes]();
    override func viewDidLoad() {
        super.viewDidLoad()
//tvListNotes.contentInset = UIEdgeInsetsMake(50,50,50,50)
       loadNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lisNotes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoteCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteCell
        cell.SetCell(note: lisNotes[indexPath.row])
        return cell
    
    }
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func loadNotes() {
        let fetchRequest: NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        
        do{
            lisNotes = try context.fetch(fetchRequest)
            tvListNotes.reloadData()
            
        }catch{
            
        }
    }
}
