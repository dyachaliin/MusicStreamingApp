//
//  MainViewControllerPresenter.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 05.10.2022.
//

import Foundation

protocol MainViewDelegate: NSObjectProtocol {
    func updatePage(model: AlbumCollectionItemModel, scrollTo: Int, animate: Bool, scroll: Bool)
}

class MainViewControllertPresenter {
    weak private var mainViewDelegate: MainViewDelegate?
    
    var currentIndex: Int = 0
    var items: [AlbumCollectionItemModel]
    
    init(){
        items = AlbumsFactory().createItems()
    }
    
    func setViewDelegate(mainViewDelegate: MainViewDelegate?){
        self.mainViewDelegate = mainViewDelegate
    }
    
    func numberOfItems() -> Int {
        return items.count
    }

    func model(at index: Int) -> AlbumCollectionItemModel? {
        return items[index]
    }
    
}
