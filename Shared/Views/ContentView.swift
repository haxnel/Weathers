//
//  ContentView.swift
//  Shared
//
//  Created by Lintang Hannan M on 02/01/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            if let location = locationManager.location {
                if let weather = weather {
                    if let weather = weather {
                        WeatherView(weather: weather)
                    }
                } else {
                    Loading()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                    if locationManager.isLoading{
                        Loading()
                    } else {
                        Welcome()
                            .environmentObject(locationManager)
                    }
                }
        }
        .background(Color(hue: 0.751, saturation: 1.0, brightness: 0.808))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
