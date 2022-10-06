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
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    
    var model: AlbumCollectionItemModel! {
        didSet {
            if let model = model {
                albumImageView.image = model.image
                albumLabel.text = model.title
            }
        }
    }
}
