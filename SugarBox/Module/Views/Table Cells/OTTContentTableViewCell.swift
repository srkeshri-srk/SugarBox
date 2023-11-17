//
//  OTTContentTableViewCell.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class OTTContentTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionview: UICollectionView!
    
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
        collectionview.register(UINib(nibName: Constants.Home.MovieContentCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Home.MovieContentCollectionViewCell)
    }
}


extension OTTContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Home.MovieContentCollectionViewCell, for: indexPath) as! MovieContentCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 10)*0.4, height: 100)
    }
}
