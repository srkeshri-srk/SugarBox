//
//  MovieContentCollectionViewCell.swift
//  SugarBox
//
//  Created by Shreyansh Raj  Keshri on 17/11/23.
//

import UIKit

class MovieContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        artworkImageView.layer.cornerRadius = 10.0
        artworkImageView.layer.masksToBounds = true
    }

}
