//
//  SongCell.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 06.10.2022.
//

import UIKit
import SwiftGifOrigin

class SongCell: UITableViewCell {
    
    static let identifier = String(describing: SongCell.self)

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songDurationLabel: UILabel!
    @IBOutlet weak var cdImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(model: SongModel) {
        songNameLabel.text = model.name
        songNameLabel.textColor = .black
        songDurationLabel.text = model.time
        songDurationLabel.textColor = .black
        cdImage.loadGif(asset: "cd")
    }
    
}
