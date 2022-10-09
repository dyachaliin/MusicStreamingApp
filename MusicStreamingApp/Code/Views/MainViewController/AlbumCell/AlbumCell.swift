//
//  AlbumCell.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 05.10.2022.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let identifier = String(describing: AlbumCell.self)
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImageView.contentMode = .scaleAspectFill
        albumImageView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20.0
        contentView.layer.masksToBounds = true
        
        layer.cornerRadius = 20.0
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 7.0
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    var model: AlbumModel! {
        didSet {
            if let model = model {
                albumImageView.image = UIImage(named: model.image)
                albumLabel.text = model.title
            }
        }
    }
}
