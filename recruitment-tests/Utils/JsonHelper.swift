//
//  JsonHelper.swift
//  recruitment-tests
//
//  Created by ytahrgui on 14/4/2022.
//

import Foundation
import SwiftyJSON
import SwiftUI

enum JsonKeys: String {
    
    case id = "id"
    case isbn = "isbn"
    case title  = "title"
    case price  = "price"
    case cover  = "cover"
    case synopsis  = "synopsis"
}

class JsonHelper {
    
    static  func getBooks(items: [JSON]) -> [BooksModel]{
           var bookList : [BooksModel] = []
               for item in items {
                bookList.append(getBook(item: item.dictionaryValue))
               }
              return bookList
       }
       
    static  func getBook(item: [String: JSON]) -> BooksModel{
        
        var book = BooksModel()
        if let id = item[JsonKeys.id.rawValue]?.int{
            book.id = id
        }
        if let isbn = item[JsonKeys.isbn.rawValue]?.string{
            book.isbn = isbn
        }
        if let title = item[JsonKeys.title.rawValue]?.string{
            book.title = title
        }
        if let price = item[JsonKeys.price.rawValue]?.double{
            book.price = price
        }
        if let cover = item[JsonKeys.cover.rawValue]?.string{
            book.cover = cover
        }
        if let synopsis = item[JsonKeys.synopsis.rawValue]?.string{
            book.synopsis = synopsis
        }
       
                
        return book
        
    }

}
