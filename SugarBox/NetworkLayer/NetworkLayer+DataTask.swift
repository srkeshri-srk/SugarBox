//
//  NetworkLayer+DataTask.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//  Copyright (c) 2023 SRK. All rights reserved.
//
//  This file was generated by the Shreyansh Raj Keshri 👾
//


import Foundation

extension NetworkLayerServices {
    public func dataTask<T: Codable>(_ api: APIRequest, completion: @escaping (_ result: Result<T, NetworkError>) -> Void) {
        guard let urlRequest = URLGenerator.prepareURLRequest(with: api) else {
            return completion(.failure(.urlNotFound))
        }
        
        self.urlSession.dataTask(with: urlRequest) { data, response, error in
            //Data Validation
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            
            //Status Validation
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
                completion(.failure(.httpFailure))
                return
            }
            
            //Parsing
            do {
                let result: T = try JSONParser().decode(data)
                completion(.success(result))
            } catch {
                completion(.failure(.dataCantParse))
            }
            
        }.resume()
    }
}
