//
//  MainTabBarController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let storyboard1 = UIStoryboard(name: Constants.Home.storyboard, bundle: nil)
        let viewController1 = storyboard1.instantiateViewController(withIdentifier: Constants.Home.storyboardIdentifier)

        let storyboard2 = UIStoryboard(name: Constants.Movie.storyboard, bundle: nil)
        let viewController2 = storyboard2.instantiateViewController(withIdentifier: Constants.Movie.storyboardIdentifier)
        
        let storyboard3 = UIStoryboard(name: Constants.Profile.storyboard, bundle: nil)
        let viewController3 = storyboard3.instantiateViewController(withIdentifier: Constants.Profile.storyboardIdentifier)

        // Set up tab bar items
        viewController1.tabBarItem = UITabBarItem(title: Constants.Home.title, image: UIImage(systemName: "house"), tag: 0)
        viewController2.tabBarItem = UITabBarItem(title: Constants.Movie.title, image: UIImage(systemName: "movieclapper"), tag: 1)
        viewController3.tabBarItem = UITabBarItem(title: Constants.Profile.title, image: UIImage(systemName: "person.crop.circle"), tag: 2)

        UITabBar.appearance().backgroundColor = .blueIII
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .blueIII

        // Set the view controllers for the tab bar
        self.viewControllers = [viewController1, viewController2, viewController3]
    }
}
