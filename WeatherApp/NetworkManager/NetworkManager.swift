//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Artim on 16.04.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    enum Consts: Error {
        static let error = "error"
    }
    
    enum Result {
        case success
        case failere(String)
    }
    
    
    let baseURL = "https://api.weatherapi.com/v1"
    let apiKey = "f29cc468a6044a168b8161048221604"
    let forecast = "forecast.json?"
    let city = "London"
    
    func sendRequest(
        request: Request,
        success: @escaping (([String: Any]?) -> Void),
        failure: @escaping ((String) -> Void)
    ) {
        let url = "\(baseURL)/\(request.url)"
        let request = AF.request(
            url,
            method: .get,
            parameters: request.parameters
        )
        request.responseJSON { response in
            let data = response.data
            do {
                let json = try JSONSerialization.jsonObject(with: data ?? Data()) as? [String: Any]
                if (200...299).contains(response.response?.statusCode ?? 0) {
                    success(json)
                } else {
                    failure("Ошибка сервера")
                }
            } catch {
                failure("Ошибка обработки данных")
            }
        }
    }
}


extension HTTPMethods {
    func convertSelfToAFHTTPMethod() -> HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        }
    }
}
