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
  
  func storeNewUser(_ userData: UserData) {
    guard !getUserExistStatus(for: userData.login.uuid) else { return }
    let entity = UserItem(context: viewContext)
    entity.uuid = userData.login.uuid
    entity.timestamp = Date()
    
    do {
      let encoded = try JSONEncoder().encode(userData)
      entity.userData = encoded
      try viewContext.save()
    } catch {
      print("Failed to save user: \(error)")
    }
  }
  
  func getUserExistStatus(for uuid: String) -> Bool {
    return try! fetchUsers().contains(where: { $0.uuid == uuid })
  }
  
  func fetchUsers(matchStatus: MatchStatus? = nil) throws -> [UserItem] {
    let request: NSFetchRequest<UserItem> = UserItem.fetchRequest()
    
    if let status = matchStatus {
      request.predicate = NSPredicate(format: "matchStatus == %@", status.rawValue)
    }
    
    return try viewContext.fetch(request)
  }
  
  func updateUser(_ userData: UserData) throws {
    guard getUserExistStatus(for: userData.login.uuid) else { return }
    let request: NSFetchRequest<UserItem> = UserItem.fetchRequest()
    request.predicate = NSPredicate(format: "id.uuid == %@", userData.login.uuid)
    
    if let _ = try viewContext.fetch(request).first {
      try viewContext.save()
    }
  }
  
  func deleteUser(uuid: String) throws {
    guard getUserExistStatus(for: uuid) else { return }
    let request: NSFetchRequest<UserItem> = UserItem.fetchRequest()
    request.predicate = NSPredicate(format: "id.uuid == %@", uuid)
    
    if let userToDelete = try viewContext.fetch(request).first {
      viewContext.delete(userToDelete)
      try viewContext.save()
    }
  }
  
  func deleteAllObjects() throws {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserItem")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    try viewContext.execute(deleteRequest)
    try viewContext.save()
  }
  
}
