//
//  String+HTML-String.swift
//  GameChanger
//
//  Created by Qazi Naveed on 8/1/18.
//  Copyright © 2018 Qazi Naveed. All rights reserved.
//

import Foundation
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    func getDouble() -> Double? {
        return Double(self)
    }
}
