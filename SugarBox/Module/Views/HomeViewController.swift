//
//  HomeViewController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeVM: HomeProtocol = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabelView()
    }
    
    private func setupUI() {
        title = Constants.Home.Title
    }
    
    private func setupTabelView() {
        
    }
    
    func fetchData() {
        homeVM.fetchDataFromAPI {
            print("Hello!!")
        }
    }
}
