//
//  ProfileViewController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        setNavBar(title: Constants.Profile.title)
        self.view.backgroundColor = Constants.Color.controllerBG
    }

}
