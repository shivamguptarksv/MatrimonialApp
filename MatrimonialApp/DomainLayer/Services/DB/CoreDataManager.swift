//
//  CoreDataManager.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import CoreData
import SwiftUI

class CoreDataManager {
  
  static let shared = CoreDataManager()
  
  private var viewContext: NSManagedObjectContext {
    PersistenceController.shared.container.viewContext
  }
  
  func saveUser(_ userData: UserData) {
    let entity = UserItem(context: viewContext)
    entity.uuid = userData.login.uuid
    entity.matchStatus = userData.matchStatus.rawValue
    entity.timestamp = Date()
    
    do {
      let encoded = try JSONEncoder().encode(userData)
      entity.userData = encoded
      try viewContext.save()
    } catch {
      print("Failed to save user: \(error)")
    }
  }
  
  func fetchUsers(matchStatus: MatchStatus? = nil) throws -> [UserItem] {
    let request: NSFetchRequest<UserItem> = UserItem.fetchRequest()
    
    if let status = matchStatus {
      request.predicate = NSPredicate(format: "matchStatus == %@", status.rawValue)
    }
    
    return try viewContext.fetch(request)
  }
  
  func updateUser(_ userData: UserData) throws {
    let request: NSFetchRequest<UserItem> = UserItem.fetchRequest()
    request.predicate = NSPredicate(format: "id.uuid == %@", userData.login.uuid)
    
    if let _ = try viewContext.fetch(request).first {
      saveUser(userData)
    }
  }
  
  func deleteUser(uuid: String) throws {
    let request: NSFetchRequest<UserItem> = UserItem.fetchRequest()
    request.predicate = NSPredicate(format: "id.uuid == %@", uuid)
    
    if let userToDelete = try viewContext.fetch(request).first {
      viewContext.delete(userToDelete)
      try viewContext.save()
    }
  }
}
