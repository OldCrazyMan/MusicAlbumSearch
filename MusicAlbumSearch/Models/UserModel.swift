//
//  UserModel.swift
//  MusicAlbumSearch
//
//  Created by Тимур Ахметов on 02.04.2022.
//

import Foundation

struct User: Codable {
    let firstName: String
    let secondName: String
    let phone: String
    let email: String
    let password: String
    let age: Date
}
