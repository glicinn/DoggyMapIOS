//
//  WeatherView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 03.06.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack (alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                            
                            Text(weather.weather[0].main)
                                .foregroundColor(.white)
                        }
                        .frame(width: 140, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelslike.roundDouble() + "°")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                        .frame(height: 0)
                    
//                    Image("city")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 350)
                    Image("city2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                        .padding(.top)
                    
                    Spacer()
                    
                    
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }

                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 130)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.black)
//        .preferredColorScheme(.dark)
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }

}
