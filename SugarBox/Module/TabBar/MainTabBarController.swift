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
        let storyboard1 = UIStoryboard(name: "Home", bundle: nil)
        let viewController1 = storyboard1.instantiateViewController(withIdentifier: "HomeViewController")

        let storyboard2 = UIStoryboard(name: "Movie", bundle: nil)
        let viewController2 = storyboard2.instantiateViewController(withIdentifier: "MovieViewController")
        
        let storyboard3 = UIStoryboard(name: "Profile", bundle: nil)
        let viewController3 = storyboard3.instantiateViewController(withIdentifier: "ProfileViewController")


        // Set up tab bar items
        viewController1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        viewController2.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "movieclapper"), tag: 1)
        viewController3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 2)


        // Set the view controllers for the tab bar
        self.viewControllers = [viewController1, viewController2, viewController3]
    }
}
