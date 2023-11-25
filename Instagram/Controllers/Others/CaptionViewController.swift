//
//  CaptionViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit

class CaptionViewController: UIViewController {
    private let image: UIImage
    
    private let captionTextField: UITextField = {
        let custom = UITextField()
        custom.font = .systemFont(ofSize: 20)
        custom.placeholder = "Add Caption..."
        custom.contentMode = .scaleAspectFit
        return custom
    }()
    
    private let imageView: UIImageView = {
        let custom = UIImageView()
        custom.clipsToBounds = true
//        custom.alignmentRectInsets = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        return custom
    }()
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(captionTextField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(didTapPost))
    }
    
    override func viewDidLayoutSubviews() {
        let imageSize = view.width / 4
        imageView.frame = CGRect(x: (view.width - imageSize) / 2, y: view.safeAreaInsets.top + 10.0, width: imageSize, height: imageSize)
        captionTextField.frame = CGRect(x: 20, y: imageView.bottom + 10, width: view.width - 40, height: 100)
    }
    
    @objc func didTapPost() {
        
    }
}
