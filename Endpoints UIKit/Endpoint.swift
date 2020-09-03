//
//  Endpoint.swift
//  Endpoints UIKit
//
//  Created by Joseph Rork on 9/3/20.
//  Copyright © 2020 Joseph Rork. All rights reserved.
//

import Foundation

struct Endpoint: Codable {
    var id: UUID?
    var name: String
    var URL: String
}
