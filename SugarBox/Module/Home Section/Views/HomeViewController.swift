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
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private var currentPage: Int = 1 {
        didSet {
            print(currentPage)
            fetchData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabelView()
        fetchData()
    }
    
    private func setupUI() {
        title = Constants.Home.title
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.view.backgroundColor = .darkBlueI
    }
    
    private func setupTabelView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .clear
        tableview.register(UINib(nibName: Constants.Home.carouselTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.carouselTableViewCell)
        tableview.register(UINib(nibName: Constants.Home.ottContentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.ottContentTableViewCell)
        tableview.register(CustomHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: Constants.Home.customHeaderTableViewCell)
    }
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            self.homeVM.fetchDataFromAPI(currentPage: self.currentPage) { 
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.tableview.reloadData()
                }
            }
        }
    }
    
    func doPagination() {
//        if currentPage < homeVM.paginationLimit {
//            self.currentPage += 1
//        }
    }
}
