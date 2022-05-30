//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Artim on 16.04.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private enum Consts {
        static let baseURL = "https://api.weatherapi.com/v1"
    }
    
    func sendRequest(
        request: Request,
        success: @escaping (([String: Any]?) -> Void),
        failure: @escaping ((String) -> Void)
    ) {
        let url = "\(Consts.baseURL)/\(request.url)"
        let request = AF.request(
            url,
            method: request.method,
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
