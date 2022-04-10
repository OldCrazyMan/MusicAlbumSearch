//
//  UIViewController + Extension.swift
//  MusicAlbumSearch
//
//  Created by Тимур Ахметов on 03.04.2022.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
