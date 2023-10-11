//
//  SettingViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    private let settingTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        self.view.addSubview(settingTableView)
        addTableViewFooter()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingTableView.frame = view.bounds
    }
    
    // MARK: - Logics
    private func addTableViewFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 50))
        footerView.clipsToBounds = true
        footerView.backgroundColor = .gray
        
        let button = UIButton(frame: footerView.bounds/*type: .system*/)
        footerView.addSubview(button)
/*
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: footerView.topAnchor),
            button.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: footerView.trailingAnchor)
        ])
 */
        button.addTarget(self, action: #selector(didTapSignOut), for: .touchUpInside)
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        settingTableView.tableFooterView = footerView
    }
    
    // MARK: - Button Actions
    @objc func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSignOut() {
        let alert = UIAlertController(title: "Sign Out", message: "Are you sure for Sign Out ?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Sign Out", style: .cancel))
        /*
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { [weak self] _ in
            AuthManager.shared.signOut { success in
                if success {
                    DispatchQueue.main.async {
                        let signInVC = SignInViewController()
                        signInVC.modalPresentationStyle = .fullScreen
                        let navVC = UINavigationController(rootViewController: signInVC)
                        self?.present(navVC, animated: true)
                    }
                }
            }
        }))
        */
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - TableView Delegate
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
