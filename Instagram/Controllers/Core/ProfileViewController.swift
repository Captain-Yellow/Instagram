//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    /*
    private var user: User
    private var isCurrentUser: Bool {
        user.username.lowercased() == UserDefaults.standard.string(forKey: "username")?.lowercased() ?? ""
    }
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
     required init?(coder: NSCoder) {
         fatalError()
     }
    */
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        viewConfiguration()
//        title = user.username.uppercased()
    }
    
    private func viewConfiguration() {
        view.backgroundColor = .systemBackground
        if true/*isCurrentUser*/ {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSetting))
        }
    }
    
    @objc private func didTapSetting() {
        let settingVC = SettingViewController()
        self.present(UINavigationController(rootViewController: settingVC), animated: true)
    }
}
