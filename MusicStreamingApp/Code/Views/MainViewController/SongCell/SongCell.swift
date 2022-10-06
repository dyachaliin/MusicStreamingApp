//
//  SongCell.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 06.10.2022.
//

import UIKit

class SongCell: UITableViewCell {
    
    static let identifier = String(describing: SongCell.self)

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(model: SongCollectionItemModel) {
        songNameLabel.text = model.name
        songDurationLabel.text = model.time
    }
    
}
