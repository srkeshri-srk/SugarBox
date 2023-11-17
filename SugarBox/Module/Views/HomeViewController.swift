//
//  HomeViewController.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    let homeVM: HomeProtocol = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabelView()
    }
    
    private func setupUI() {
        title = Constants.Home.Title
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.view.backgroundColor = .darkBlueI
    }
    
    private func setupTabelView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .clear
        tableview.register(UINib(nibName: Constants.Home.OTTContentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Home.OTTContentTableViewCell)
        tableview.register(CustomHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: Constants.Home.CustomHeaderTableViewCell)
    }
    
    func fetchData() {
        homeVM.fetchDataFromAPI {
            print("Hello!!")
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OTTContentTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Home.OTTContentTableViewCell, for: indexPath) as! OTTContentTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Home.CustomHeaderTableViewCell) as! CustomHeaderTableViewCell
        view.setTitle(value: "Movie Section \(section + 1)")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(velocity.y>0) {
            UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
//                self.navigationController?.setToolbarHidden(true, animated: true)
                print("Hide")
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
//                self.navigationController?.setToolbarHidden(false, animated: true)
                print("Unhide")
            }, completion: nil)
        }
    }

}
