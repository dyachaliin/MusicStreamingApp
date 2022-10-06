//
//  MainViewControllerPresenter.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 05.10.2022.
//

import Foundation

protocol MainViewDelegate: NSObjectProtocol {
    func reloadTableView()
}

class MainViewControllertPresenter {
    weak private var mainViewDelegate: MainViewDelegate?
    
    var currentIndex: Int = 0
    var currentAlbum: AlbumCollectionItemModel? = nil
    var collectionItems: [AlbumCollectionItemModel]
    
    init(){
        collectionItems = AlbumsFactory().createItems()
    }
    
    func setViewDelegate(mainViewDelegate: MainViewDelegate?){
        self.mainViewDelegate = mainViewDelegate
    }
    
    func numberOfCollectionItems() -> Int {
        return collectionItems.count
    }

    func collectionModel(at index: Int) -> AlbumCollectionItemModel? {
        return collectionItems[index]
    }
    
    func numberOfSongItems() -> Int {
        guard let currentAlbum = currentAlbum else { return 0 }
        return currentAlbum.songs.count
    }
    
    func songModel(at index: Int) -> SongCollectionItemModel? {
        guard let currentAlbum = currentAlbum else { return nil }
        return currentAlbum.songs[index]
    }
    
    func setCurrentAlbum(at index: Int) {
        self.currentAlbum = collectionItems[index]
        mainViewDelegate?.reloadTableView()
    }
    
    
}
