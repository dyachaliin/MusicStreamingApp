//
//  AlbumModel.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 09.10.2022.
//

import Foundation

struct AlbumModel: Equatable {
    let id = UUID()
    let image: String
    let title: String
    let songs: [SongModel]
}
