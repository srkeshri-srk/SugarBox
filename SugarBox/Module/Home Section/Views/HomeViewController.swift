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
    var currentPage: Int = 1
    let spinnerVC = SpinnerViewController()

    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabelView()
        fetchData {
            self.spinnerVC.willMove(toParent: nil)
            self.spinnerVC.view.removeFromSuperview()
            self.spinnerVC.removeFromParent()
            self.tableview.reloadData()
        }
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Home.title)
        self.view.backgroundColor = Constants.Color.controllerBG
        
        createSpinnerView()
    }
    
    private func setupTabelView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .clear
        tableview.register(UINib(nibName: Constants.Home.carouselTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.carouselTableViewCell)
        tableview.register(UINib(nibName: Constants.Home.ottContentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.ottContentTableViewCell)
        tableview.register(CustomHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: Constants.Home.customHeaderTableViewCell)
    }
    
    private func createSpinnerView() {
        addChild(spinnerVC)
        spinnerVC.view.frame = view.frame
        view.addSubview(spinnerVC.view)
        spinnerVC.didMove(toParent: self)
    }

    
    func fetchData(completion: @escaping ()->Void) {
        DispatchQueue.global(qos: .background).async {
            self.homeVM.fetchDataFromAPI(currentPage: self.currentPage) { 
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    func doPagination() {
        if currentPage < homeVM.paginationLimit {
            self.currentPage += 1
            fetchData {
                self.spinner.stopAnimating()
                self.tableview.reloadData()
            }
        } else {
            self.spinner.stopAnimating()
        }
    }
}
