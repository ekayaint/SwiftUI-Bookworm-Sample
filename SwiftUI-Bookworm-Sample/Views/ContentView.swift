//
//  ContentView.swift
//  SwiftUI-Bookworm-Sample
//
//  Created by ekayaint on 30.09.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
       // try? moc.save()
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading, content: {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundStyle(.secondary)
                            }) //: VStack
                            
                        } //: HStack
                    } //: Navlink
                } //: ForEach
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
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
            }) //: List
        } //: Nav
    }
}

#Preview {
    ContentView()
}
