//
//  DatabaseHelper.swift
//  Notes
//
//  Created by Deepshika Ghale on 2023-07-03.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    //access the data from core data
    private var context: NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    //add new note to the core data
    func addNote(note: Note){
        let notesEntity = NotesEntity(context: context)
        notesEntity.title = note.title
        notesEntity.content = note.content
        notesEntity.timestamp = note.timestamp
        //saves the note entity
        do{
            try
            context.save()
        }
        catch{
            print(error) //catches an error incase of exceptions
        }
    }
    
    //retrieve all the notes from core data
    func getAllNotes(){
        var notes: [NotesEntity] = []
        do{
            notes = try context.fetch(NotesEntity.fetchRequest()) //retrieves all the data from the core data
        }catch{
            print(error) //catches an error incase of exceptions
        }
    }
}

//a model class to access the entity class attributes
struct Note{
    let title: String
    let content: String
    let timestamp: Date
}
