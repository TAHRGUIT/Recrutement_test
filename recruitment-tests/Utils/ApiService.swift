//
//  ApiService.swift
//  recruitment-tests
//
//  Created by ytahrgui on 14/4/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI

class APIService {
    
    @Published var books : [BooksModel] = []
    
    public func getBooks(onSuccess successCallback: ((_ response: JSON) -> Void)?,
                               onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let headers : HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
       let url = "https://henri-potier.techx.fr/books"
        APICallManager.shared.createRequest(url, method: .get, headers: headers, parameters: nil,onSuccess: {(responseObject: JSON) -> Void in
            
            //let response = responseObject[].arrayValue
            
           successCallback?(responseObject)
         
        }, onFailure: {(errorMessage: String) -> Void in
            failureCallback?("Une erreur est survenue, veuillez réessayer plus tart")
        })
    }
}
