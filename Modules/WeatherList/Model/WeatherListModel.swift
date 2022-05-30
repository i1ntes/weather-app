//
//  Weather.swift
//  WeatherApp
//
//  Created by Artim on 07.04.2022.
//

import Foundation
import ObjectMapper

class WeatherListModel: WeatherListModelProtocol {
    func getModel(response: [String: Any]) -> WeatherListMO? {
        return WeatherListMO(JSON: response)
    }
}

class WeatherListMO: Mappable {
    var temperature: Temperature?
    var location: Location?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        temperature <- map["current"]
        location <- map["location"]
    }
}

class Temperature: Mappable {
    var temp: Double?
    var condition: Condition?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        temp <- map["temp_c"]
        condition <- map["condition"]
    }
}

class Location: Mappable {
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}

class Condition: Mappable {
    var icon: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        icon <- map["icon"]
    }
}
