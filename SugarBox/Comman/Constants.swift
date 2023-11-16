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
        static let Title = "SugarBox"
        static let WallyTableViewCell = "WallyTableViewCell"
        static let WallyCollectionViewCell = "WallyCollectionViewCell"
        static let CustomHeaderTableViewCell = "CustomHeaderTableViewCell"
    }
    
    //Network Layer
    struct NetworkLayer {
        static let homeDetailsURL = "https://" + ConfigManager.baseURL + "/ecm/" + ConfigManager.version + "/super/feeds/zee5-home/details"
    }
}
