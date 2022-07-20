//
//  LocationSelectorPresenter.swift
//  WeatherApp
//
//  Created by Artim on 08.06.2022.
//

import Foundation

class LocationSelectorPresenter {
    
    private weak var view: LocationSelectroViewInput?
    
    init(view: LocationSelectroViewInput) {
        self.view = view
    }
    
}

extension LocationSelectorPresenter: LocationSelectorViewOutput {
    func viewDidLoad() {
        
    }
}
