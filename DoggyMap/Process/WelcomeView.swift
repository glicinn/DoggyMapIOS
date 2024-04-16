//
//  WelcomeView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 03.06.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the weather Window")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text("Please share your current location to get the weather in your area")
                    .padding()
                    .foregroundColor(.white)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            // Объект библиотеки СoreLocationUI
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
