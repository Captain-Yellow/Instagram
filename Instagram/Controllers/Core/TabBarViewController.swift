//
//  TabBarViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define VCs
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let notification = NotificationsViewController()
        let profile = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: explore)
        let nav3 = UINavigationController(rootViewController: camera)
        let nav4 = UINavigationController(rootViewController: notification)
        let nav5 = UINavigationController(rootViewController: profile)
        
        // Define Tab Items
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Notificatios", image: UIImage(systemName: "bell"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 5)
        
        // Set Controller
        self.setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: false)
    }

}
