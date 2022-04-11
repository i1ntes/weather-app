//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artim on 05.04.2022.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
    }
    
    private func setNavigationController() {
        title = "Weather"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

