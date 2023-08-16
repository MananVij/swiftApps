//
//  WeatherManager.swift
//  Clima
//
//  Created by Manan Vij on 25/07/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=5a0bbe3c4602a95fdaaedf8af68dde64&units=metric"
    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let weatherURL = "\(baseURL)&q=\(cityName)"
        let noSpaceURL = weatherURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let url = noSpaceURL {
            performRequest(urlString: url)
        }
    }

    func fetchWeather(_ lat: Double, _ lon: Double) {
        let weatherURL = "\(baseURL)&lat=\(lat)&lon=\(lon)"
        let noSpaceURL = weatherURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let url = noSpaceURL {
            performRequest(urlString: url)
        }
    }
    func performRequest(urlString: String) {

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseData(weatherData: safeData) {

                        // trying to return the data to the weather vc
                        delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    func parseData(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()

        // try catch block
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)

            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temperature)

            return weather
        } catch {
            print(error)
            return nil
        }
    }
}
