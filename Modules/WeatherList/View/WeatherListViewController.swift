//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artim on 05.04.2022.
//

import UIKit

class WeatherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var data = [WeatherListMO]()
    
    private var presenter: WeatherListViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = WeatherListPresenter(view: self, model: WeatherListModel())
        
        setNavigationController()
        tableView.register(UINib.init(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        tableView.dataSource = self
        presenter?.viewDidLoad()
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

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "cities"
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.cityLabel.text = data[indexPath.row].location?.name ?? ""
        cell.degreesLabel.text = "\(Int(data[indexPath.row].temperature?.temp ?? 0))ºC"
        return cell
    }
}

extension WeatherListViewController: WeatherListViewInput {
    func update(with model: WeatherListMO) {
        data.append(model)
        tableView.reloadData()
    }
}
