//
//  ContentView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  @State private var selectedTab = 0
  
  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView()
        .tabItem {
          Label("Home", systemImage: "house")
        }
        .tag(0)
      
      SearchView()
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }
        .tag(1)
      
      BookmarkView()
        .tabItem {
          Label("Bookmark", systemImage: "bookmark")
        }
        .tag(2)
    }
  }
  
}

#Preview {
  ContentView()
}


struct ContentView1: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \UserItem.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<UserItem>
  
  var body: some View {
    NavigationView {
      List {
        ForEach(items) { item in
          NavigationLink {
            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
          } label: {
            Text(item.timestamp!, formatter: itemFormatter)
          }
        }
        .onDelete(perform: deleteItems)
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        ToolbarItem {
          Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
      Text("Select an item")
    }
  }
  
  private func addItem() {
    withAnimation {
      let newItem = UserItem(context: viewContext)
      newItem.timestamp = Date()
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()


#Preview {
  ContentView().environment(\.managedObjectContext,
                             PersistenceController.preview.container.viewContext)
}

 
