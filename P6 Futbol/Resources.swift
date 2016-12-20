//
//  Resources.swift
//  P6 Futbol
//
//  Created by Daniel S on 20/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation


enum Method: String {
    case GET = "GET"
}

protocol Resource {
    var method: Method { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

