//
//  BaseNaviagtionBar.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 25/11/23.
//

import UIKit


protocol BaseNaviagtionBar: AnyObject where Self: UIViewController {
    func setNavBar(title value: String)
}

extension BaseNaviagtionBar {
    func setNavBar(title value: String) {
        title = value
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // prevent Nav Bar color change on scroll view push behind NavBar
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = .darkBlueI

        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
    }
}


//Confirm this to ViewController
extension UIViewController: BaseNaviagtionBar { }
