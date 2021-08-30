//
//  AppConstant.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 30/08/2021.
//

import Foundation
import UIKit
public enum HTTPMethods: String {
    case ptions = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
struct AppConstant {
    static var images = "https://pixabay.com/api/?key=23126903-d0b3f576c0a4c602ea60f5352&image_type=photo&q="
}
