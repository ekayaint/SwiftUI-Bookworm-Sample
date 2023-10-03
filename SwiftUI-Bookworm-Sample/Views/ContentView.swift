//
//  ContentView.swift
//  SwiftUI-Bookworm-Sample
//
//  Created by ekayaint on 30.09.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    } //: ToolbarItem
                } //: toolbar
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        } //: Nav
    }
}

#Preview {
    ContentView()
}
