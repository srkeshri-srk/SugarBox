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
    var contents: [Content]? {
        didSet {
            getAssets()
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
        contents?.removeAll()
        contents = info
    }
    
    func getAssets() {
        guard let contents = contents else { return }
        assets.removeAll()

        for content in contents {
            if let assets = content.assets {
                for asset in assets {
                    if asset.assetType == .image && asset.type == .thumbnailList {
                        self.assets.append(asset)
                    }
                }
            }
        }
    }
    
    @objc func onOrientationChange(notification: Notification) {
        print("onOrientationChange")
        collectionview.reloadData()
    }
}
