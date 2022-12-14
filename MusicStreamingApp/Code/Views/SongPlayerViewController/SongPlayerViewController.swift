//
//  SongPlayerViewController.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 07.10.2022.
//

import UIKit
import FirebaseStorage
import AVFoundation
import Tom

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
    @IBOutlet weak var playButtonBackground: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var equalizerView: TomView!
    
    required init(presenter: SongPlayerViewControllertPresenter) {
        self.presenter = presenter
        super.init(nibName: "SongPlayerViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .crossDissolve
        presenter.setViewDelegate(songPlayerViewDelegate: self)
        setBackButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerView.layer.cornerRadius = 20.0
        playButtonBackground.layer.cornerRadius = playButtonBackground.frame.width/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        setupPlayer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        equalizerView.start()
        playSong()
       
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
        
        playButtonBackground.image = UIImage(named: "backgroundCircle")
        
        setLabelText()
    }
    
    func setLabelText() {
        songNameLabel.text = presenter.song.name
    }
    
    func setBackButton() {
        let image = UIImage(named: "backButton")
        backButton.setImage(image, for: .normal)
    }
    
    func setupPlayer() {
        togglePlayPauseBtn()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func playPauseBtnTapped(_ sender: UIButton) {
        presenter.isPlaying.toggle()
        
        if presenter.isPlaying == false {
            player.pause()
        } else {
            player.play()
        }
    }
    
    
    @IBAction func previousSongTapped(_ sender: UIButton) {
        player.pause()
        presenter.previousSong()
        playSong()
        setLabelText()
    }
    
    @IBAction func nextSongTapped(_ sender: UIButton) {
        player.pause()
        presenter.nextSong()
        playSong()
        setLabelText()
    }
    
    
    private func playSong() {
        let storage = Storage.storage().reference(forURL: presenter.song.file)
        storage.downloadURL { (url, error) in
            if error != nil {
               print(error)
            } else {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                }
                catch {
                    
                }
                
                self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                self.player.play()
            }
        }
    }
    
}

extension SongPlayerViewController: SongPlayerViewDelegate {
    func togglePlayPauseBtn() {
        let image = UIImage(named: presenter.isPlaying ? "pause" : "play")!
        playPauseButton.setImage(image, for: .normal)
    }
}
