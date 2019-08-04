//
//  WebServices.swift
//  Quartrly
//
//  Created by Babar Hassan on 4/6/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import Alamofire

typealias apiSuccess = (_ data: Data) -> ()
typealias apiFailure = (_ errorString: String) -> ()
typealias HTTPfailure = (_ errorString: String) -> ()
//Qazi Ammar Api typeAlies.
typealias successApi = (_ responseObject: Any) -> ()




class WebServices{
    
    static let baseUrl = "http://www.mocky.io/v2/59bbc4640f00001102ff872f"
    static let skakuBaseURL = "https://api.shaku.it/"
    static let imageBaseURL = "https://shaku.it/"
    
    
    class func URLResponse(_ url:String, method: HTTPMethod ,parameters: [String: Any]?, withSuccess success: @escaping apiSuccess, withapiFiluer failure: @escaping apiFailure) {
        
        //  let completeUrl : String = baseUrl + url
        _ =  HTTPHeaders()
        
        Alamofire.request(url, method:method, parameters: parameters, encoding: URLEncoding.default, headers:[:]).validate(statusCode: 200..<600).responseData(completionHandler: {   respones in
            switch respones.result {
            case .success(let value):
                
                success(value)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
        
    }
    
    class func callApiWith(url: URL, method: HTTPMethod, parameters: [String: Any]?, withSucces success: @escaping successApi,  withapiFiluer failure: @escaping apiFailure) {
        
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).validate().responseJSON(completionHandler: {
            respones in
            switch respones.result {
            case .success(let responseObject):
                success(responseObject)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
        
    }
    
}
