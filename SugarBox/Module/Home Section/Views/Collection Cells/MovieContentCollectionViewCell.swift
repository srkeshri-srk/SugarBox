//
//  MovieContentCollectionViewCell.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit
import Kingfisher

class MovieContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var artworkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        artworkImageView.layer.cornerRadius = 10.0
        artworkImageView.layer.masksToBounds = true
    }
    
    func configureUI(value: String) {
        guard let url = URL(string: value) else { return }
        
        let processor = DownsamplingImageProcessor(size: artworkImageView.bounds.size)
        artworkImageView.kf.indicatorType = .activity
        artworkImageView.kf.setImage(with: url, placeholder: UIImage(named: "SugarboxPlaceHolder"), options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(0.2)), .cacheOriginalImage])
    }

}
