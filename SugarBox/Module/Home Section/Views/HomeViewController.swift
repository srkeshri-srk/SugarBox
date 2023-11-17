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
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.view.backgroundColor = .darkBlueI
    }
    
    private func setupTabelView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .clear
        tableview.register(UINib(nibName: Constants.Home.OTTContentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.OTTContentTableViewCell)
        tableview.register(CustomHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: Constants.Home.CustomHeaderTableViewCell)
    }
    
    func fetchData() {
        homeVM.fetchDataFromAPI {
            print("Hello!!")
        }
    }
}
