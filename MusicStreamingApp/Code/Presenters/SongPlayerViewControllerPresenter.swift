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
    
    var song: SongModel
    var album: AlbumModel
    var isPlaying: Bool = true {
        didSet {
            songPlayerViewDelegate?.togglePlayPauseBtn()
        }
    }
    
    init(album: AlbumModel, song: SongModel) {
        self.album = album
        self.song = song
    }
    
    func setViewDelegate(songPlayerViewDelegate: SongPlayerViewDelegate?){
        self.songPlayerViewDelegate = songPlayerViewDelegate
    }
    
}
