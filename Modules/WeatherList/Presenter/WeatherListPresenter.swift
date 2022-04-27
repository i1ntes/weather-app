//
//  Presenter.swift
//  WeatherApp
//
//  Created by Artim on 07.04.2022.
//

import Foundation

class WeatherListPresenter {
    private weak var view: WeatherListViewInput?
    private let networkManager = NetworkManager()
    
    init(view: WeatherListViewInput) {
        self.view = view
    }
}

extension WeatherListPresenter: WeatherListViewOutput {
    
    func viewDidLoad() {
        networkManager.sendRequest()
    }
    
}
