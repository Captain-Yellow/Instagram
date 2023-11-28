//
//  SearchResaultViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 27/11/2023.
//

import UIKit

protocol SearchResaultViewControllerDelegate: AnyObject {
    /// Dont Forget: Create a optional weak delegate property - Pass self as argument of protocol methods
    func searchResaultViewController(_ vc: SearchResaultViewController, didSelectResaultWith: User)
}

class SearchResaultViewController: UIViewController {
    private var users = [User]()
    public weak var delegate: SearchResaultViewControllerDelegate?
    
    private let resaultTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(resaultTableView)
        resaultTableView.frame = view.bounds
        resaultTableView.delegate = self
        resaultTableView.dataSource = self
    }
    
    func update(with resault: [User]) {
        self.users = resault
        resaultTableView.reloadData()
        resaultTableView.isHidden = users.isEmpty
    }
}

extension SearchResaultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if #available(iOS 14.0, *) {
            var config = cell.defaultContentConfiguration()
            config.text = users[indexPath.row].username
            cell.contentConfiguration = config
        } else {
            cell.textLabel?.text = users[indexPath.row].username
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.searchResaultViewController(self, didSelectResaultWith: users[indexPath.row])
    }
}
