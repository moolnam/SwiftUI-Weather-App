//
//  ContentView.swift
//  Weather App Test 2
//
//  Created by KimJongHee on 2022/05/08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var weatherModel = WeatherModel()
    
    var body: some View {
        VStack {
            Image(systemName: "\(weatherModel.conditionString)")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400, alignment: .center)
                .foregroundColor(weatherModel.conditionColor)
                .background(Color.blue)
                .cornerRadius(50)
            Text(weatherModel.title)
                .padding()
            Text(weatherModel.descriptionText)
                .padding()
            Text(weatherModel.temp)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
