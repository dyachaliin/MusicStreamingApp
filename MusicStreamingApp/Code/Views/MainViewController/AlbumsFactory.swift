//
//  AlbumsFactory.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 04.10.2022.
//

import Foundation
import UIKit

struct AlbumCollectionItemModel {
    let image: UIImage
    let title: String
    let songs: [SongCollectionItemModel]
}

struct SongCollectionItemModel {
    let name: String
    let time: String
}

class AlbumsFactory: NSObject {

    func createItems() -> [AlbumCollectionItemModel] {
        
        return [
            AlbumCollectionItemModel(image: UIImage(named: "1")!, title: "Album 1", songs: [SongCollectionItemModel(name: "Song 1", time: "3:41"), SongCollectionItemModel(name: "Song 2", time: "2:00")]),
            AlbumCollectionItemModel(image: UIImage(named: "2")!, title: "Album 2", songs: [SongCollectionItemModel(name: "Song 3", time: "2:20")]),
            AlbumCollectionItemModel(image: UIImage(named: "3")!, title: "Album 3", songs: [SongCollectionItemModel(name: "Song 5", time: "4:30"), SongCollectionItemModel(name: "Song 6", time: "4:56")]), AlbumCollectionItemModel(image: UIImage(named: "4")!, title: "Album 4", songs: [SongCollectionItemModel(name: "Song 7", time: "2:45"), SongCollectionItemModel(name: "Song 7", time: "1:43")])
           ]
    }
}
