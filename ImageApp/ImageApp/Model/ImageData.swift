//
//  ImageModel.swift
//  ImageApp
//
//  Created by Manan Vij on 04/08/23.
//

import Foundation
struct ImageData: Decodable {
    let urls: URLs
}
struct URLs: Decodable {
    let raw: String
}
