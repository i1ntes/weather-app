//
//  WeatherListProtocol.swift
//  WeatherApp
//
//  Created by Artim on 23.04.2022.
//

import Foundation

protocol WeatherListViewInput: AnyObject {
    func update(with model: WeatherListMO)
    func stopActivityIndicator()
    func startActivityIndicator()
    func showErrorMsg()
}

protocol WeatherListViewOutput {
    func viewDidLoad()
}

protocol WeatherListModelProtocol {
    func getModel(response: [String: Any]) -> WeatherListMO?
}

protocol ModuleOutput {
    func addCity(city: String)
}
