//
//  HomeViewModel.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation


protocol HomeProtocol: AnyObject {
    var paginationLimit: Int { get }
    func fetchDataFromAPI(currentPage: Int, completion: @escaping ()->Void)
    func getInfo(index: Int)
}


class HomeViewModel: HomeProtocol {
    private let networkLayerServices = NetworkLayerServices()
    private var homeModel: HomeModel?
    private let perPage: Int = 10
    let paginationLimit: Int = 3
    
    func fetchDataFromAPI(currentPage: Int, completion: @escaping ()->Void) {
        guard let url = URL(string: Constants.NetworkLayer.homeDetailsURL) else {
            completion()
            return
        }
        
        let apiRequest = APIRequest(url: url, 
                                    method: .GET,
                                    headers: nil,
                                    queryParams: ["page": currentPage, "perPage": perPage],
                                    body: nil)
        
        networkLayerServices.dataTask(apiRequest) { (result: Result<HomeModel, NetworkError>) in
            switch result {
            case .success(let success):
                self.configureData(data: success)
                print("Successfull!! 🎉")
                completion()
            case .failure(let failure):
                print(failure)
                completion()
            }
        }
    }
    
    private func configureData(data: HomeModel) {
        self.homeModel = data
    }
    
    func getInfo(index: Int) {
        
    }
}
