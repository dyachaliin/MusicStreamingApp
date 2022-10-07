//
//  MainViewController.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 04.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    enum Constants {
        static var rowHeight: CGFloat = 60.0
    }
    
    @IBOutlet weak var songTableView: UITableView!
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    
    private let presenter = MainViewControllertPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Band"
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.setViewDelegate(mainViewDelegate: self)
        setupCollectionView()
        setupTableView()
    }
    
    func setupCollectionView() {
        albumsCollectionView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellWithReuseIdentifier: AlbumCell.identifier)
        albumsCollectionView.delegate = self
        albumsCollectionView.dataSource = self
    }
    
    func setupTableView() {
        songTableView.register(UINib(nibName: "SongCell", bundle: nil), forCellReuseIdentifier: SongCell.identifier)
        songTableView.delegate = self
        songTableView.dataSource = self
    }

}

extension MainViewController: MainViewDelegate {
    func reloadTableView() {
        songTableView.reloadData()
    }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = presenter.collectionModel(at: indexPath.row),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell else { return UICollectionViewCell() }
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfCollectionItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.setCurrentAlbum(at: indexPath.row)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfSongItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.identifier) as? SongCell,
            let model = presenter.songModel(at: indexPath.row) {
            cell.set(model: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let album = presenter.currentAlbum,
                let song = presenter.getSelectedSong(at: indexPath.row) else { return }
        let vc = SongPlayerViewController(presenter: SongPlayerViewControllertPresenter(album: album, song: song))
        navigationController?.pushViewController(vc, animated: true)
    }
}
