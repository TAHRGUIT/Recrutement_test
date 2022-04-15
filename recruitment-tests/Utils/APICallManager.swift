//
//  APICallManager.swift
//  recruitment-tests
//
//  Created by ytahrgui on 14/4/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class APICallManager {
    
    static let shared = APICallManager()
    
    func createRequest(
            _ url: String,
            method: HTTPMethod,
            headers: HTTPHeaders?,
            parameters: [String: Any]?,
            onSuccess successCallback: ((JSON) -> Void)?,
            onFailure failureCallback: ((String) -> Void)?
        ) {
        /*
        print("Hello url : ", url)
        print("Hello Params : ", parameters as Any)
        */
        AF.request(url, method: method , parameters: parameters, encoding: URLEncoding.default , headers: headers).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    successCallback?(json)
                case .failure(let error):
                    if let callback = failureCallback {
                        callback(error.localizedDescription)
                    }
                }
            }
        }
    
    
    func createUploadRequest(_ url: String,
                         method: HTTPMethod,
                         headers: HTTPHeaders?,
                         image: UIImage,
                         parameters: [String: Any],
                         onSuccess successCallback: ((JSON) -> Void)?,
                         onFailure failureCallback: ((String) -> Void)?) {
        print(url)
        print(parameters)
            AF.upload(multipartFormData: { multiPart in
                for p in parameters {
                    multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
                }
               multiPart.append(image.jpegData(compressionQuality: 0.4)!, withName: "file", fileName: "file.jpg", mimeType: "image/jpg")
            }, to: url, method: .post, headers: headers)
            .uploadProgress(queue: .main, closure: { progress in
            }).responseJSON(completionHandler: { data in
                //successCallback?(json)
            }).response { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value!)
                    successCallback?(json)
                case .failure(let error):
                    if let callback = failureCallback {
                        callback(error.localizedDescription)
                    }
                }
            }
        }
    
    

}
