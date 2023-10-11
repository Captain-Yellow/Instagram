//
//  PostCaptionCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 03/10/2023.
//

import UIKit

protocol PostCaptionCollectionViewCellDelegate: AnyObject {
    /// Dont Forget: Create a optional weak delegate property - Pass self as argument of protocol methods
    func PostCaptionCollectionViewCellDidTapCaption(_ cell: PostCaptionCollectionViewCell)
}

class PostCaptionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostCaptionCollectionViewCell"
    weak var delegate: PostCaptionCollectionViewCellDelegate?
    
    private let captionLabel: UILabel = {
        let custom = UILabel()
        custom.numberOfLines = 0
        custom.textColor = .systemGray
        custom.font = .systemFont(ofSize: 14)
        return custom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
//        contentView.backgroundColor =  [.red, .blue, .green, .yellow, .brown, .purple].randomElement()
        contentView.addSubview(captionLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCaption))
        tapGesture.numberOfTapsRequired = 1
        captionLabel.isUserInteractionEnabled = true
        captionLabel.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let captionFrame = captionLabel.sizeThatFits(CGSize(width: contentView.bounds.size.width-15, height: 50))
//        captionLabel.frame = CGRect(x: 15, y: 0, width: captionFrame.width, height: captionFrame.height)
        captionLabel.frame = CGRect(x: 15, y: 0, width: contentView.width, height: 40)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: PostCaptionCollectionViewCellViewModel) {
        let text = "\(viewModel.username): \(viewModel.caption ?? "")"
        let string = NSMutableAttributedString(string: text)
        string.setColor(color: UIColor.label, forText: (viewModel.username + ": "))
        string.setColor(color: UIColor.darkGray, forText: viewModel.caption ?? "")
        captionLabel.attributedText = string
    }
    
    @objc func didTapCaption() {
        delegate?.PostCaptionCollectionViewCellDidTapCaption(self)
    }
}
