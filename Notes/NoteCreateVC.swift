//
//  NoteCreateVC.swift
//  Notes
//
//  Created by Bikash Chhantyal on 2023-07-03.
//

import UIKit

class NoteCreateVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    private let databaseHelper = DatabaseHelper()
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, !title.isEmpty else {
            return
        }
        
        guard let content = contentTextField.text, !content.isEmpty else {
            return
        }
        
        let newNote = Note(
        title: title,
        content: content,
        timestamp: Date()
        )
        databaseHelper.addNote(note: newNote)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
