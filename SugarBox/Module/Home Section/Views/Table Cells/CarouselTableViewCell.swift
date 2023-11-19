//
//  CarouselTableViewCell.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var assets = [Asset]() {
        didSet {
            colletionView.reloadData()
            pageControl.numberOfPages = assets.count
        }
    }
    var contents: [Content]? {
        didSet {
            getAssets()
        }
    }
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupPageContol()
        setupCollectionView()
        addNotifications()
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = .clear
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }
    
    private func setupPageContol() {
        pageControl.currentPage = .zero
    }

    
    private func setupCollectionView() {
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.register(UINib(nibName: Constants.Home.movieContentCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Home.movieContentCollectionViewCell)
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
        colletionView.reloadData()
    }
    
}
