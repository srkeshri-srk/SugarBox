//
//  Constants.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

struct Constants {
    
    static let orientation = UIDevice.current.orientation
    
    struct Size {
        static var screenWidth = UIScreen.main.bounds.width
        static var screenHeight = UIScreen.main.bounds.height
        static let carouselCell = orientation.isLandscape ? screenWidth * 0.50 : screenWidth * 0.85
        static let ottContentCell = orientation.isLandscape ? (screenWidth - 10) * 0.18 : (screenWidth - 10) * 0.4
    }
    
    //Home Section
    struct Home {
        static let title = "Home"
        static let storyboard = "Home"
        static let storyboardIdentifier = "HomeViewController"
        static let ottContentTableViewCell = "OTTContentTableViewCell"
        static let movieContentCollectionViewCell = "MovieContentCollectionViewCell"
        static let customHeaderTableViewCell = "CustomHeaderTableViewCell"
        static let carouselTableViewCell = "CarouselTableViewCell"
    }
    
    //Movie Section
    struct Movie {
        static let title = "Movie"
        static let storyboard = "Movie"
        static let storyboardIdentifier = "MovieViewController"
    }
    
    //Profile Section
    struct Profile {
        static let title = "Profile"
        static let storyboard = "Profile"
        static let storyboardIdentifier = "ProfileViewController"
    }
    
    //Network Layer
    struct NetworkLayer {
        static let homeDetailsURL = "https://" + ConfigManager.baseURL + "/ecm/" + ConfigManager.version + "/super/feeds/zee5-home/details"
        static let imageBaseURL = "https://" + ConfigManager.imageBaseURL
    }
}
