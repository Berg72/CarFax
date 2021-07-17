//
//  ViewController.swift
//  CarFax
//
//  Created by Mark bergeson on 7/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var datasource = [CarList]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadDatasource()
        // Do any additional setup after loading the view.
    }

}

private extension ViewController {
    
    func setupView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
        tableView.register(UINib(nibName: "CarListCell", bundle: nil), forCellReuseIdentifier: "CarListCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadDatasource() {
        API.shared.getCarData { (items) in
            guard let items = items else { return }
            self.datasource = items
            self.tableView.reloadData()
            
        }
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarListCell", for: indexPath)
        
        if let cell = cell as? CarListCell {
            cell.configure(carlist: self.datasource[indexPath.row])
        }
        
        return cell
    }
}
