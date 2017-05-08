//
//  RequestFromResource.swift
//  P6 Futbol
//
//  Created by Daniel S on 20/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation


extension Resource {
    
    var method: Method {
        return .GET
    }
    
    
    func requestWithBaseURL(baseURL: URL) -> NSURLRequest {
        let URL = baseURL.appendingPathComponent(path)
        
        // NSURLComponents can fail due to programming errors, so
        // prefer crashing than returning an optional
        
        guard var components = URLComponents(url: URL, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components from \(URL)")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let finalURL = components.url else {
            fatalError("Unable to retrieve final URL")
        }
        
        let request = NSMutableURLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        
        return request
    }
}
