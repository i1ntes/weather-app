//
//  Request.swift
//  WeatherApp
//
//  Created by Artim on 25.04.2022.
//

import Foundation
import Alamofire

class Request {
    let url: String
    let parameters: [String: String]
    let method: HTTPMethod
    
    init(url: String,
         parameters: [String: String],
         method: HTTPMethod = .get) {
        
        self.url = url
        self.parameters = parameters
        self.method = method
    }
}
