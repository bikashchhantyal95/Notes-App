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
    func getAllNotes()-> [NotesEntity]{
        var notes: [NotesEntity] = []
        
        let fetchRequest: NSFetchRequest<NotesEntity> = NotesEntity.fetchRequest()
            
            // Sort the fetch request by title in ascending order
            let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor]
        
        
        do{
            notes = try context.fetch(fetchRequest) //retrieves all the data from the core data
        }catch{
            print(error) //catches an error incase of exceptions
        }
        
        return notes
    }
    
    func deleteNote(noteEntity: NotesEntity){
        context.delete(noteEntity)
        do{
            try context.save()
        }catch{
            print("Failed to delete note: \(error)")
        }
    }
    
}






//a model class to easily pass arguements to the core data
struct Note{
    let title: String
    let content: String
    let timestamp: Date
}
