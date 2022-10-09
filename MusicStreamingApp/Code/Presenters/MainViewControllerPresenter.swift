//
//  MainViewControllerPresenter.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 05.10.2022.
//

import Foundation

protocol MainViewDelegate: NSObjectProtocol {
    func reloadTableView()
    func reloadCollection()
}

class MainViewControllertPresenter {
    weak private var mainViewDelegate: MainViewDelegate?
    
    var currentIndex: Int = 0
    var currentAlbum: AlbumModel? = nil
    var collectionItems = [AlbumModel]()
    var data = Data()
    
    init() {
        data.loadAlbums {
            self.collectionItems = self.data.albums
            self.mainViewDelegate?.reloadCollection()
        }
    }
    
    func setViewDelegate(mainViewDelegate: MainViewDelegate?){
        self.mainViewDelegate = mainViewDelegate
    }
    
    func numberOfCollectionItems() -> Int {
        return collectionItems.count
    }

    func collectionModel(at index: Int) -> AlbumModel? {
        return collectionItems[index]
    }
    
    func numberOfSongItems() -> Int {
        guard let currentAlbum = currentAlbum else { return 0 }
        return currentAlbum.songs.count
    }
    
    func songModel(at index: Int) -> SongModel? {
        guard let currentAlbum = currentAlbum else { return nil }
        return currentAlbum.songs[index]
    }
    
    func setCurrentAlbum(at index: Int) {
        self.currentAlbum = collectionItems[index]
        mainViewDelegate?.reloadTableView()
    }
    
    func getSelectedSong(at index: Int) -> SongModel? {
        guard let currentAlbum = currentAlbum else { return nil }
        return currentAlbum.songs[index]
    }
    
}
