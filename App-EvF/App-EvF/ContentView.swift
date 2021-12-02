//
//  ContentView.swift
//  App-EvF
//
//  Created by Azael Reyna on 27/11/21.
//

import SwiftUI

struct ContentView: View {

    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)

            VStack {
                CityTextView(cityName: "Monterrey, NL")

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill"
                    : "cloud.sun.fill",
                    temperature: 14)

                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Lun",
                        imageName: "sun.max.fill",
                        temperature: 15)

                    WeatherDayView(dayOfWeek: "Mar",
                        imageName: "cloud.fog.fill",
                        temperature: 16)

                    WeatherDayView(dayOfWeek: "Mie",
                        imageName: "cloud.sun.fill",
                        temperature: 17)

                    WeatherDayView(dayOfWeek: "Jue",
                        imageName: "sun.max.fill",
                        temperature: 18)

                    WeatherDayView(dayOfWeek: "Vie",
                        imageName: "cloud.drizzle.fill",
                        temperature: 19)

                    WeatherDayView(dayOfWeek: "Sab",
                        imageName: "cloud.fill",
                        temperature: 21)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WheatherButton(title: "Actualizar",
                        textColor: .blue,
                        backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct WeatherView: View {

    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
            Text(viewModel.cityname)
                .font(.largeTitle)
                .padding()
            Text(viewModel.temperature)
                .font(.system(size: 70))
                .bold()
            Text(viewModel.weatherIcon)
                .font(.largeTitle)
                .padding()
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService:
                WeatherService()))
    }
}

struct WeatherDayView: View {

    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {

    var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .gray : .blue,
            isNight ? .black : Color("LightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {

    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
            .padding(.bottom, 40)
    }
}
