//
//  JSONParser.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//  Copyright (c) 2023 SRK. All rights reserved.
//
//  This file was generated by the Shreyansh Raj Keshri 👾
//


import Foundation

public class JSONParser {
    private let jsonDecoder = JSONDecoder()
    
    func decode<T: Codable>(_ data: Data) -> T? {
        return try? jsonDecoder.decode(T.self, from: data)
    }
}
