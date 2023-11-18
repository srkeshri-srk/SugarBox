//
//  HomeViewModel.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import Foundation


protocol HomeProtocol: AnyObject {
    var sectionCount: Int { get }
    var paginationLimit: Int { get }
    
    func fetchDataFromAPI(currentPage: Int, completion: @escaping ()->Void)
    func getContentsInfo(index: Int) -> [Content]?
    func getDesignType(index: Int) -> DesignSlug
    func getSectionTitle(index: Int) -> String
}


class HomeViewModel: HomeProtocol {
    private let networkLayerServices = NetworkLayerServices()
    private var homeData: [DataModel]?
    private let perPage: Int = 10
    let paginationLimit: Int = 3
    
    var sectionCount: Int {
        return homeData?.count ?? 0
    }
    
    
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
                self.configureData(model: success)
                print("Successfull!! 🎉")
                completion()
            case .failure(let failure):
                print(failure)
                completion()
            }
        }
    }
    
    private func configureData(model: HomeModel) {
        self.homeData = model.data
    }
    
    func getContentsInfo(index: Int) -> [Content]? {
        guard let homeData = self.homeData?[index] else { return nil }
        return homeData.contents
    }
    
    func getDesignType(index: Int) -> DesignSlug {
        guard let homeData = self.homeData?[index], let design = homeData.designSlug else { return .ottContent }
        return design
    }
    
    func getSectionTitle(index: Int) -> String {
        guard let homeData = self.homeData?[index], let title = homeData.title else { return "" }
        return title
    }

}
