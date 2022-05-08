//
//  WeatherData.swift
//  Weather App Test 2
//
//  Created by KimJongHee on 2022/05/08.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
