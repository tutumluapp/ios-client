//
//  ProfileButtonExtension.swift
//  tutumlu
//
//  Created by ali-kerem on 5.12.2023.
//

// ProfileButtonExtension.swift

import UIKit

extension UIViewController {
    func addProfileButton(target: Any?, action: Selector?) {
        let profileImage = UIImage(systemName: "person")?.withRenderingMode(.alwaysOriginal)
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: target, action: action)
        navigationItem.rightBarButtonItem = profileButton
    }
}
