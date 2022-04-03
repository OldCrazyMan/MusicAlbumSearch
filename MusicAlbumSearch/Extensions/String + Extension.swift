//
//  String + Extension.swift
//  MusicAlbumSearch
//
//  Created by Тимур Ахметов on 03.04.2022.
//

import Foundation

extension String {
    
    enum ValueTypes {
        case name
        case email
        case password
    }
    
    enum RegEx: String {
        case name = "[a-zA-Z]{1,}"
        case email = "[a-zA-Z0-9._]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }
    
    func isValid(validType: ValueTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = ""
        
        switch validType {
        case .name:
            regEx = RegEx.name.rawValue
        case .email:
            regEx = RegEx.email.rawValue
        case .password:
            regEx = RegEx.password.rawValue
        }
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
