//
//  HomeViewController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let home = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Constants.NetworkLayer.homeDetailsURL)
        home.fetchDataFromAPI()

    }
}
