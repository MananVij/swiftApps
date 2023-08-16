//
//  Image.swift
//  imageVIP
//
//  Created by Manan Vij on 17/08/23.
//

import Foundation
struct ImageModel: Decodable {
    let urls: URLs
}
struct URLs: Decodable {
    let raw: String
}
