//
//  IGTextField.swift
//  Instagram
//
//  Created by Mohammad Afshar on 18/09/2023.
//

import UIKit

class IGTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        autocorrectionType = .no
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftViewMode = .always
        layer.cornerRadius = 8
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
