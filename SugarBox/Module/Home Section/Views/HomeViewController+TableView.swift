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
        if indexPath.section == 0 {
            let cell: CarouselTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Home.carouselTableViewCell, for: indexPath) as! CarouselTableViewCell
            return cell
        } else {
            let cell: OTTContentTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Home.ottContentTableViewCell, for: indexPath) as! OTTContentTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250.0
        } else {
            return 100.0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Home.customHeaderTableViewCell) as! CustomHeaderTableViewCell
            view.setTitle(value: "Movie Section \(section + 1)")
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(velocity.y>0) {
            UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
//                self.navigationController?.setToolbarHidden(true, animated: true)
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
//                self.navigationController?.setToolbarHidden(false, animated: true)
            }, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let lastSectionIndex = tableView.numberOfSections - 1
       let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
       if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
           spinner.startAnimating()
           spinner.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 44.0)
           self.doPagination()
           self.tableview.tableFooterView = spinner
           self.tableview.tableFooterView?.isHidden = false
       }
   }
    
}
