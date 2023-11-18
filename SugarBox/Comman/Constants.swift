//
//  Constants.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation

struct Constants {
    //Home Landing
    struct Home {
        static let title = "SugarBox"
        static let ottContentTableViewCell = "OTTContentTableViewCell"
        static let movieContentCollectionViewCell = "MovieContentCollectionViewCell"
        static let customHeaderTableViewCell = "CustomHeaderTableViewCell"
        static let carouselTableViewCell = "CarouselTableViewCell"
    }
    
    //Network Layer
    struct NetworkLayer {
        static let homeDetailsURL = "https://" + ConfigManager.baseURL + "/ecm/" + ConfigManager.version + "/super/feeds/zee5-home/details"
        static let imageBaseURL = "https://" + ConfigManager.imageBaseURL
    }
}
