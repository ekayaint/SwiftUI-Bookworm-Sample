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
            }
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
            }) //: List
        } //: Nav
    }
}

#Preview {
    ContentView()
}
