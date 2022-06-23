//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artim on 05.04.2022.
//

import UIKit
import SDWebImage

class WeatherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }
    
    @objc func addButtonTapped() {
        let storyboard = UIStoryboard(name: "LocationSelector", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondScreen")
        self.present(vc, animated: true)
    }
    
    func startActivityIndicator() {
        loader.startAnimating()
    }
    
    func stopActivityIndicator() {
        loader.stopAnimating()
        loader.hidesWhenStopped = true
    }
    
    func showErrorMsg() {
        let errorMsg = UIAlertController(title: "Error", message: "Powel nahuy, bidla", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        errorMsg.addAction(action)
        self.present(errorMsg, animated: true)
    }
}

extension WeatherListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "cities"
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
//        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let shittyUrl = "https://\(String(data[indexPath.row].temperature?.condition?.icon ?? "").dropFirst(2))"
        guard let url = URL(string: shittyUrl) else { return cell }
        cell.cityLabel.text = data[indexPath.row].location?.name ?? ""
        cell.degreesLabel.text = "\(Int(data[indexPath.row].temperature?.temp ?? 0))ºC"
        cell.weatherIcon.sd_setImage(with: url, completed: nil)
        return cell
    }
}

extension WeatherListViewController: WeatherListViewInput {
    
    func update(with model: WeatherListMO) {
        data.append(model)
        tableView.reloadData()
    }
}
