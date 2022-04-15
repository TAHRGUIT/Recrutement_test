//
//  BooksModel.swift
//  recruitment-tests
//
//  Created by ytahrgui on 14/4/2022.
//

import Foundation

struct BooksModel: Hashable, Identifiable  {
    
    var idd = UUID()
    var id : Int = 0
    var isbn : String = ""
    var title : String = ""
    var price : Double = 0.0
    var cover : String = ""
    var synopsis : String = ""
    
}
