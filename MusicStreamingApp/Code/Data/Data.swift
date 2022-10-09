//
//  Data.swift
//  MusicStreamingApp
//
//  Created by Alina Diachenko on 09.10.2022.
//

import Foundation
import UIKit
import FirebaseFirestore

class Data {
    public var albums = [AlbumModel]()
    
    func loadAlbums(completion: @escaping () -> Void) {
        Firestore.firestore().collection("albums").getDocuments { (snapshot, error) in
            if error == nil {
                for document in snapshot!.documents {
                    let name = document.data()["name"] as? String ?? ""
                    let image = document.data()["image"] as? String ?? "1"
                    let songs = document.data()["songs"] as? [String : [String : Any]]
                    
                    var songsArray = [SongModel]()
                    if let songs = songs {
                        for song in songs {
                           let songName =  song.value["name"] as? String ?? ""
                           let songTime = song.value["time"] as? String ?? ""
                           let songFile = song.value["file"] as? String ?? ""
                            songsArray.append(SongModel(name: songName, time: songTime, file: songFile))
                        }
                    }
                    self.albums.append(AlbumModel(image: image, title: name, songs: songsArray))
                }
                completion()
            } else {
                print(error)
            }
        }
    }
}
