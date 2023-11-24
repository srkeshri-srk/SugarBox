//
//  MainTabBarController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var controllers: [UIViewController] = [] {
        didSet {
            viewControllers = controllers
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupUI()
    }
    
    private func setupTabBar() {
        let homeVC = UIStoryboard(name: Constants.Home.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.Home.storyboardIdentifier)
        let movieVC = UIStoryboard(name: Constants.Movie.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.Movie.storyboardIdentifier)
        let profileVC = UIStoryboard(name: Constants.Profile.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.Profile.storyboardIdentifier)

        homeVC.tabBarItem = UITabBarItem(title: Constants.Home.title, image: UIImage(systemName: "house"), tag: 0)
        movieVC.tabBarItem = UITabBarItem(title: Constants.Movie.title, image: UIImage(systemName: "movieclapper"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: Constants.Profile.title, image: UIImage(systemName: "person.crop.circle"), tag: 2)
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let movieNC = UINavigationController(rootViewController: movieVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        self.viewControllers = [homeNC, movieNC, profileNC]
    }
    
    private func setupUI() {
        UITabBar.appearance().backgroundColor = .darkBlueI
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .darkBlueI
        UITabBar.appearance().unselectedItemTintColor = .blueI
    }
}
