//
//  SongPlayerViewControllerPresenter.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 07.10.2022.
//

import Foundation

protocol SongPlayerViewDelegate: NSObjectProtocol {
    func togglePlayPauseBtn()
}

class SongPlayerViewControllertPresenter {
    weak private var songPlayerViewDelegate: SongPlayerViewDelegate?
    
    var song: SongCollectionItemModel
    var album: AlbumCollectionItemModel
    var isPlaying: Bool = false {
        didSet {
            songPlayerViewDelegate?.togglePlayPauseBtn()
        }
    }
    
    init(album: AlbumCollectionItemModel, song: SongCollectionItemModel) {
        self.album = album
        self.song = song
    }
    
    func setViewDelegate(songPlayerViewDelegate: SongPlayerViewDelegate?){
        self.songPlayerViewDelegate = songPlayerViewDelegate
    }
    
}
