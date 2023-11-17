//
//  HomeViewController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    let homeVM: HomeProtocol = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabelView()
    }
    
    private func setupUI() {
        title = Constants.Home.Title
        self.view.backgroundColor = .blueI
    }
    
    private func setupTabelView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .clear
        tableview.register(UINib(nibName: Constants.Home.OTTContentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.OTTContentTableViewCell)
    }
    
    func fetchData() {
        homeVM.fetchDataFromAPI {
            print("Hello!!")
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OTTContentTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Home.OTTContentTableViewCell, for: indexPath) as! OTTContentTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
