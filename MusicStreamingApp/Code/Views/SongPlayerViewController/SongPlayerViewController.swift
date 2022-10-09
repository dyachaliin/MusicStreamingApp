//
//  SongPlayerViewController.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 07.10.2022.
//

import UIKit
import FirebaseStorage
import AVFoundation

class SongPlayerViewController: UIViewController {

    private let presenter: SongPlayerViewControllertPresenter
    private var player = AVPlayer()
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    required init(presenter: SongPlayerViewControllertPresenter) {
        self.presenter = presenter
        super.init(nibName: "SongPlayerViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(songPlayerViewDelegate: self)
        playSong()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerView.layer.cornerRadius = 20.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        setupPlayer()
    }
    
    func setupView() {
        backgroundImageView.image = UIImage(named: presenter.album.image)
        backgroundImageView.contentMode = .scaleAspectFill
        
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.3
        outerView.layer.shadowOffset = CGSize.zero
        outerView.layer.shadowRadius = 7
        outerView.layer.cornerRadius = 20.0
        
        albumImageView.image = UIImage(named: presenter.album.image)
        albumImageView.contentMode = .scaleAspectFill
        albumImageView.layer.cornerRadius = 20.0
        albumImageView.clipsToBounds = true
        
        songNameLabel.text = presenter.song.name
    }
    
    func setupPlayer() {
        togglePlayPauseBtn()
        
        let mediumConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        let previousImage = UIImage(systemName: "arrow.left.circle", withConfiguration: mediumConfiguration)
        previousButton.setImage(previousImage, for: .normal)
        
        let nextImage = UIImage(systemName: "arrow.right.circle", withConfiguration: mediumConfiguration)
        nextButton.setImage(nextImage, for: .normal)
    }
    
    
    @IBAction func playPauseBtnTapped(_ sender: UIButton) {
        if presenter.isPlaying == true {
            player.pause()
        } else {
            player.play()
        }
        
        presenter.isPlaying.toggle()
    }
    
    private func playSong() {
        let storage = Storage.storage().reference(forURL: presenter.song.file)
        storage.downloadURL { (url, error) in
            if error != nil {
               print(error)
            } else {
                self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                self.player.play()
            }
        }
    }
    
}

extension SongPlayerViewController: SongPlayerViewDelegate {
    func togglePlayPauseBtn() {
        let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
        let playPauseImage = UIImage(systemName: presenter.isPlaying ? "pause.circle.fill" : "play.circle.fill", withConfiguration: largeConfiguration)
        playPauseButton.setImage(playPauseImage, for: .normal)
    }
}
