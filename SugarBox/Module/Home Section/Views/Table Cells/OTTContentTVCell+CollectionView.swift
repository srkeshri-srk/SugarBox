//
//  OTTContentTVCell+CollectionView.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

extension OTTContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Home.movieContentCollectionViewCell, for: indexPath) as! MovieContentCollectionViewCell
        cell.configureUI(value: assets[indexPath.row].sourcePath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.Size.ottContentCell, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
