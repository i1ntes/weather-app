//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artim on 05.04.2022.
//

import UIKit

class WeatherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let city = ["Penza", "Moscow", "SPB"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        tableView.register(UINib.init(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        tableView.dataSource = self
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

extension WeatherListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.city.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.cityLabel.text = self.city[indexPath.row]
        return cell
    }
}





