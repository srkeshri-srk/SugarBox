//
//  HomeViewModel.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation


class HomeViewModel {
    let networkLayerServices = NetworkLayerServices()
    var homeModel: HomeModel?
    
    func fetchDataFromAPI() {
        guard let url = URL(string: "https://apigw.sboxdc.com/ecm/v2/super/feeds/zee5-home/details?page=1&perPage=20") else { return }
        
        let apiRequest = APIRequest(url: url, method: .GET, headers: nil, queryParams: nil, body: nil)
        
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
