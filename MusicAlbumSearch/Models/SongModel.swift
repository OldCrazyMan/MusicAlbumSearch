//
//  SongModel.swift
//  MusicAlbumSearch
//
//  Created by Тимур Ахметов on 03.04.2022.
//

import Foundation

struct SongsModel: Decodable {
    let results: [Song]
}

struct Song: Decodable {
    let trackName: String?
}
