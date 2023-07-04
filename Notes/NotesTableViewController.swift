//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Bikash Chhantyal on 2023-07-03.
//

import UIKit



class NotesTableViewController: UITableViewController {

    //initialize notesentity
    private var notes: [NotesEntity] = []
    
    //instantiate databasehelper
    var databaseHelper = DatabaseHelper()
    
    //to retrieve data from the core data
    override func viewWillAppear(_ animated: Bool) {
        
        notes = databaseHelper.getAllNotes()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows according to the length of notes
        return notes.count
    }

    //retrieving data for each cell in a table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteRow", for: indexPath)
        
        // Configure the cell...
        
        var content = cell.defaultContentConfiguration()
        
        let row = indexPath.row
        
        let note = notes[row]
        content.text = note.title
        
        //format to string from date of timestamp from core data
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let timestampString = formatter.string(from: note.timestamp!)
                
        content.secondaryText = timestampString
        cell.contentConfiguration = content

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier{
                case "details":
                    let destinationView = segue.destination as! NoteDetailsViewController
                    let currentRow = tableView.indexPathForSelectedRow!
                    let index = currentRow.row
            destinationView.note = Note(title: notes[index].title!, content: notes[index].description, timestamp: notes[index].timestamp!)
                
                case "Add":
                    let destinationView = segue.destination as! NoteCreateVC
                    
                    
                default:
                 preconditionFailure("Failure of indentify segue.")
                }
    }
    

}
