//
//  UIViewController + Extension.swift
//  MusicAlbumSearch
//
//  Created by Тимур Ахметов on 03.04.2022.
//

import UIKit

extension UIViewController {
    
    func createCustomButton(selector: Selector, image: String, color: UIColor) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = color
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
