//
//  BooksViewModel.swift
//  recruitment-tests
//
//  Created by ytahrgui on 14/4/2022.
//

import Foundation
class BooksViewModel: ObservableObject{
 
    private var apiService: APIService = APIService()

    @Published var books : [BooksModel] = []
    
    func getBooks() {
        
        apiService.getBooks(onSuccess: { response in
            
            let resp = response[].arrayValue
            for item in resp {
                var book = BooksModel()
                
                book.isbn  = item[JsonKeys.isbn.rawValue].stringValue
                book.title = item[JsonKeys.title.rawValue].stringValue
                book.price = item[JsonKeys.price.rawValue].doubleValue
                book.cover = item[JsonKeys.cover.rawValue].stringValue
                book.synopsis = item[JsonKeys.synopsis.rawValue].stringValue
                self.books.append(book)
                
            }
           print(self.books)
            
            
        }, onFailure: { errorMessage in
        })
    }
    
}
