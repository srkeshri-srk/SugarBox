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
    }
    
    private func setupCollectionView() {
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .clear
        collectionview.register(UINib(nibName: Constants.Home.movieContentCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Home.movieContentCollectionViewCell)
    }
    
    func configureData(info: [Content]?) {
        contents = info
    }
    
    func getAssets() {
        guard let contents = contents else { return }
            
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
}
