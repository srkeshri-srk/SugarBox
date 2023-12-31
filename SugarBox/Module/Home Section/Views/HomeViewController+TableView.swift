//
//  HomeViewController+TableView.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch homeVM.getDesignType(index: indexPath.section) {
        case .carousal:
            let cell: CarouselTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Home.carouselTableViewCell, for: indexPath) as! CarouselTableViewCell
            cell.configureData(info: homeVM.getContentsInfo(index: indexPath.section))
            return cell
        case .ottContent:
            let cell: OTTContentTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Home.ottContentTableViewCell, for: indexPath) as! OTTContentTableViewCell
            cell.configureData(info: homeVM.getContentsInfo(index: indexPath.section))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch homeVM.getDesignType(index: indexPath.section) {
        case .carousal:
            return 250.0
        case .ottContent:
            return 100.0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeVM.sectionCount
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch homeVM.getDesignType(index: section) {
        case .carousal:
            return nil
        case .ottContent:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Home.customHeaderTableViewCell) as! CustomHeaderTableViewCell
            view.setTitle(value: homeVM.getSectionTitle(index: section).components(separatedBy: "-").first)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
        
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex && currentPage < homeVM.paginationLimit {
            spinner.startAnimating()
            spinner.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 44.0)
            self.doPagination()
            self.tableview.tableFooterView = spinner
            self.tableview.tableFooterView?.isHidden = false
        }
    }
    
}
