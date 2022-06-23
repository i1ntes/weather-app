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
    @IBOutlet weak var SelectorTF: UITextField!
    
    private var presenter: LocationSelectorViewOutput?
    var firstScreen: ModuleOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showErrorMsg() {
        let errorMsg = UIAlertController(title: "Error", message: "Введите название города", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        errorMsg.addAction(action)
        self.present(errorMsg, animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let newCity = SelectorTF.text else { return }
        if newCity == "" {
            showErrorMsg()
        } else {
            dismiss(animated: true)
        }
    }
}

extension LocationSelectorViewController: LocationSelectroViewInput {
    
}

