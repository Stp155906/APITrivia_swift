//
//  String+Extension.swift
//  Trivia
//
//  Created by Shantalia
//

import Foundation

extension String {
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        return try? NSAttributedString(data: data,
                                       options: [
                                           .documentType: NSAttributedString.DocumentType.html,
                                           .characterEncoding: String.Encoding.utf8.rawValue
                                       ],
                                       documentAttributes: nil)
    }
}
