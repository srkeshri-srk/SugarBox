//
//  CarouselTableViewCell.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 18/11/23.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var pageContol: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupPageContol()
        setupCollectionView()
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = .clear
    }
    
    private func setupPageContol() {
        pageContol.numberOfPages = 5
        pageContol.currentPage = .zero
    }

    
    private func setupCollectionView() {
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.register(UINib(nibName: Constants.Home.movieContentCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Home.movieContentCollectionViewCell)
    }
}

extension CarouselTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Home.movieContentCollectionViewCell, for: indexPath) as! MovieContentCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.85, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageContol.currentPage = indexPath.row
    }
}
