//
//  LocationSelectorPresenter.swift
//  WeatherApp
//
//  Created by Artim on 08.06.2022.
//

import Foundation

class LocationSelectorPresenter {
    
    private weak var view: LocationSelectroViewInput?
    let firstScreen: ModuleOutput
    
    init(view: LocationSelectroViewInput, firstScreen: WeatherListPresenter) {
        self.view = view
        self.firstScreen = firstScreen
    }
    
}

extension LocationSelectorPresenter: LocationSelectorViewOutput {
    func viewDidLoad() {
        
    }
}
