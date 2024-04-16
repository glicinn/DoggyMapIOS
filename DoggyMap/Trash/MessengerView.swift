//
//  MessengerView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 02.04.2023.
//

import SwiftUI

struct MessengerView: View {
    
    @State var selectedTab = "message"
    @State var isTapped = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                Spacer()
                
                Image(systemName: "xmark.circle")
                    .font (.system(size: 80, weight: .light))
                    .foregroundColor(Color.red)
                Text("The window is not available")
                    .font (.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(10)
                Text("This tab is under development")
                    .font (.system(size: 15, weight: .bold))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
//                CustomTabBar(selectedTab: $selectedTab, isTapped: $isTapped)
                
            }
        }
    }
}

struct MessengerView_Previews: PreviewProvider {
    static var previews: some View {
        MessengerView()
    }
}
