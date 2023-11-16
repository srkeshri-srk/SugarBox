//
//  ConfigManager.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation

public struct ConfigManager {
    enum Keys {
        static let baseURL = "BASE_URL"
        static let imageBaseURL = "IMAGE_BASE_URL"
        static let version = "VERSION"
    }
        
    static let baseURL: String = {
        guard let property = Bundle.main.object(forInfoDictionaryKey: Keys.baseURL) as? String else {
            fatalError("BASE_KEY not found")
        }
        
        return property
    }()
    
    static let imageBaseURL: String = {
        guard let property = Bundle.main.object(forInfoDictionaryKey: Keys.imageBaseURL) as? String else {
            fatalError("IMAGE_BASE_URL not found")
        }
        
        return property
    }()

    
    static let version: String = {
        guard let property = Bundle.main.object(forInfoDictionaryKey: Keys.version) as? String else {
            fatalError("VERSION not found")
        }
        
        return property
    }()
}
