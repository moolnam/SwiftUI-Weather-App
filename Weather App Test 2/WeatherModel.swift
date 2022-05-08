//
//  WeatherModel.swift
//  Weather App Test 2
//
//  Created by KimJongHee on 2022/05/08.
//

import Foundation
import SwiftUI

class WeatherModel: ObservableObject {
    
    @Published var title: String = "-"
    // 현재 도시이름 실시간으로
    @Published var descriptionText: String = "-"
    // 현재 날씨 상태 실시간으로
    @Published var temp: String = "-"
    // 현재 온도 실시간으로
    @Published var conditionId: Int = 0
    // 현재 컨디션 아이디 
    
    var conditionDescription: String {
        switch descriptionText {
        case "scattered clouds":
            return "희미한 구름"
        case "clear sky":
            return "완죤 맑음"
        case "light rain":
            return "약간 비"
        case "moderate rain":
            return "약간 비"
        default:
            return "날씨 정보 모름"
        }
    }
    
    var conditionColor: Color {
        switch conditionId {
        case 200...232:
            return Color.yellow
        case 300...321:
            return Color.yellow
        case 500...531:
            return Color.yellow
        case 600...622:
            return Color.yellow
        case 701...711:
            return Color.red
        case 721:
            return Color.red
        case 731:
            return Color.red
        case 741...751:
            return Color.red
        case 761:
            return Color.red
        case 762:
            return Color.red
        case 771...781:
            return Color.red
        case 800:
            return Color.white
        default:
            return Color.white
        }
    }
    
    var conditionString: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...711:
            return "smoke.fill"
        case 721:
            return "sun.haze.fill"
        case 731:
            return "sun.dust.fill"
        case 741...751:
            return "cloud.fog.fill"
        case 761:
            return "sun.dust.fill"
        case 762:
            return "cloud.fog.fill"
        case 771...781:
            return "tornado"
        case 800:
            return "sun.max"
        default:
            return "cloud.fill"
        }
    }
    
    init() {
        petchWeather()
    }
    
    
    
    func petchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?&appid=27edc121638773d8a67d862806f2d6c9&q=Seoul&units=metric") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(WeatherData.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.name
                    self.descriptionText = model.weather[0].description
                    self.temp = "\(model.main.temp)"
                    
                }
            } catch {
                print("Failed")
            }
        }
        task.resume()
        
        
    }
    
}
