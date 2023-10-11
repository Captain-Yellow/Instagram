//
//  Extentions.swift
//  Instagram
//
//  Created by Mohammad Afshar on 18/09/2023.
//

import Foundation
import UIKit

extension UIView {
    var height: CGFloat {
        frame.size.height
    }
    
    var width: CGFloat {
        frame.size.width
    }
    
    var top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        frame.origin.y + height
    }
    
    var left: CGFloat {
        frame.origin.x
    }
    
    var right: CGFloat {
        frame.origin.x + width
    }
}

extension Encodable {
    func asDictionary() -> [String:Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String:Any]
        return json
    }
}

extension Decodable {
    init?(with dictionary: [String:Any]) {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else {
            return nil
        }
        guard let result = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        self = result
    }
}

extension String {
    static func date(from date: Date) -> String {
        return DateFormatter.formatter.string(from: date)
    }
}

extension DateFormatter {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        return formatter
    }()
}

extension NSMutableAttributedString {
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
