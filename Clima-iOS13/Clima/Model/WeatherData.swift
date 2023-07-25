//
//  WeatherData.swift
//  Clima
//
//  Created by Manan Vij on 25/07/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
}
struct Weather: Codable {
    let id: Int
    let description: String
}
struct Main: Codable {
    let temp: Double
}
