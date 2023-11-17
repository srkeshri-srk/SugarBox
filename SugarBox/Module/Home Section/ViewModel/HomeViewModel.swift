//
//  HomeViewModel.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation


protocol HomeProtocol: AnyObject {
    func fetchDataFromAPI(completion: @escaping ()->Void)
}


class HomeViewModel: HomeProtocol {
    private let networkLayerServices = NetworkLayerServices()
    private var homeModel: HomeModel?
    
    func fetchDataFromAPI(completion: @escaping ()->Void) {
        guard let url = URL(string: Constants.NetworkLayer.homeDetailsURL) else { return }
        
        let apiRequest = APIRequest(url: url, method: .GET, headers: nil, queryParams: ["page": 1, "perPage": 20], body: nil)
        
        networkLayerServices.dataTask(apiRequest) { (result: Result<HomeModel, NetworkError>) in
            switch result {
            case .success(let success):
                print(success)
                self.homeModel = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
