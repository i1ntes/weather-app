//
//  WeatherListProtocol.swift
//  WeatherApp
//
//  Created by Artim on 23.04.2022.
//

import Foundation

protocol WeatherListViewInput: AnyObject {
    func update(with model: WeatherListMO)
}

protocol WeatherListViewOutput {
    func viewDidLoad()
}

protocol WeatherListModelProtocol {
    func getModel(response: [String: Any]) -> WeatherListMO?
}
