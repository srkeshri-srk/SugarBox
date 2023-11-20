//
//  OTTContentTableViewCell.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class OTTContentTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionview: UICollectionView!
    
    var assets = [Asset]() {
        didSet {
            collectionview.reloadData()
        }
    }
    var contents: [Content] = [] {
        didSet {
            assets = contents.flatMap{ $0.thumbnailImageAsset }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = .clear
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }
    
    private func setupCollectionView() {
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .clear
        collectionview.register(UINib(nibName: Constants.Home.movieContentCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Home.movieContentCollectionViewCell)
    }
    
    private func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.onOrientationChange(notification:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func configureData(info: [Content]?) {
        contents.removeAll()
        contents = info ?? []
    }
        
    @objc func onOrientationChange(notification: Notification) {
        print("onOrientationChange")
        collectionview.reloadData()
    }
}
