//
//  Presenter.swift
//  WeatherApp
//
//  Created by Artim on 07.04.2022.
//

import Foundation

class WeatherListPresenter {
    
    private enum Consts {
        static let baseURL = "https://api.weatherapi.com/v1"
        static let apiKey = "f29cc468a6044a168b8161048221604"
        static let forecast = "forecast.json?"
        static var city = "Penza"
    }
    
    private weak var view: WeatherListViewInput?
    private let model: WeatherListModelProtocol
    private let networkManager = NetworkManager()
    let secondScreen = LocationSelectorViewController()
    
    init(view: WeatherListViewInput, model: WeatherListModelProtocol) {
        self.view = view
        self.model = model
    }
    
    // MARK: - Private methods
    
    private func successBlock(_ response: [String: Any]?) {
        guard let response = response,
              let model = model.getModel(response: response) else { return }
        view?.stopActivityIndicator()
        view?.update(with: model)
    }
    
    private func failureBlock(_ errorMsg: String?) {
        guard let _ = errorMsg else { return }
        view?.stopActivityIndicator()
        view?.showErrorMsg()
    }
}

extension WeatherListPresenter: WeatherListViewOutput {
    func viewDidLoad() {
        addCity(Consts.city)
    }
    
    func addCity(_ city: String) {
        let params = ["key": Consts.apiKey, "q": city]
        let request = Request(url: Consts.forecast, parameters: params, method: .get)
        
        networkManager.sendRequest(request: request, success: successBlock(_:), failure: failureBlock(_:))
    }
}
