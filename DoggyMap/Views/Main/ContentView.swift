//
//  ContentView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 31.03.2023.
//

import SwiftUI

struct ContentView: View {

//    @AppStorage("uid") var userID: String = ""
    @AppStorage("uLogin") var userLogin: String = ""
    
    
//    init() {
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundImage = UIImage()
//        UITabBar.appearance().isTranslucent = true
//        UITabBar.appearance().backgroundColor = .clear
//    }
//    init() {
//        UITabBar.appearance().isHidden = true
//    }

    var body: some View {
        if userLogin == ""{
            StartView()
            
//            MapView()
//                .environmentObject(vm)
            
//            MainView(selectedTab: $selectedTab, isTapped: $isTapped, tabSelection: 1)
            

        } else {
            
            if userLogin == "ad@ad.com"{
                AdminWindowView()
                    .edgesIgnoringSafeArea(.top)
            }
            else{
                MainView()
                    .edgesIgnoringSafeArea(.top)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




