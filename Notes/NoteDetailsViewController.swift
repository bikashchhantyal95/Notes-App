//
//  NoteDetailsViewController.swift
//  Notes
//
//  Created by Deepshika Ghale on 2023-07-03.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    
    var note : Note?
    
    @IBOutlet weak var noteUITitle: UILabel!
    
    @IBOutlet weak var noteTimeStampLabel: UILabel!
    
    @IBOutlet weak var noteDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteUITitle.text = note!.title
        noteDescriptionLabel.text = note!.content
        //format to string from date of timestamp from core data
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let timestampString = formatter.string(from: note!.timestamp)
        noteTimeStampLabel.text = timestampString
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier{
                case "edit":
                    let destinationView = segue.destination as! NoteCreateVC
                    destinationView.note = note
        
                default:
                 preconditionFailure("Failure of indentify segue.")
                }
   
    }
 
    

}
