//
//  MainViewController.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 04.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var albumsCollectionView: UICollectionView!
    private let presenter = MainViewControllertPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        albumsCollectionView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellWithReuseIdentifier: AlbumCell.identifier)
        albumsCollectionView.delegate = self
        albumsCollectionView.dataSource = self
    }

}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = presenter.model(at: indexPath.row),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell else { return UICollectionViewCell() }
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
}
