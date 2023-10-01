//
//  AddBookView.swift
//  SwiftUI-Bookworm-Sample
//
//  Created by ekayaint on 1.10.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var  moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                }
            } //: Form
        } //: Nav
    }
}

#Preview {
    AddBookView()
}
