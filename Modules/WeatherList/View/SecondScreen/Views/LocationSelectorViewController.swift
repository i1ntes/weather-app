//
//  LocationSelectorView.swift
//  WeatherApp
//
//  Created by Artim on 07.06.2022.
//

import UIKit

class LocationSelectorViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectorTF: UITextField!
    
    private var presenter: LocationSelectorViewOutput?
    var completion: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func start(nc: UINavigationController, completion: @escaping ((String) -> Void)) {
        let storyboard = UIStoryboard(name: "LocationSelector", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondScreen") as? LocationSelectorViewController else { return }
        vc.completion = completion
        nc.present(vc, animated: true)
    }
    
    private func showErrorMsg() {
        let errorMsg = UIAlertController(title: "Error", message: "Введите название города", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        errorMsg.addAction(action)
        self.present(errorMsg, animated: true)
    }
    
    @IBAction private func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func searchButtonTapped(_ sender: UIButton) {
        guard let city = selectorTF.text, !city.isEmpty else {
            showErrorMsg()
            return
        }
        
        dismiss(animated: true) { [weak self] in
            self?.completion?(city)
        }
    }
}

extension LocationSelectorViewController: LocationSelectroViewInput {
    
}

