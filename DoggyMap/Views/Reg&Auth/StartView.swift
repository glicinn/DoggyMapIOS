//
//  StartView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 25.03.2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            TabView{
                OnboardView(
                    systemImageName: "map",
                    title: "Map",
                    description: "Great forgiotting down your ideas and brainstorming your next feature."
                )
                
                
                OnboardView(
                    systemImageName: "newspaper",
                    title: "News",
                    description: "Great forgiotting down your ideas and brainstorming your next feature."
                )
                
                VStack{
                    Spacer()
                    Spacer()
                    
                    OnboardView(
                        systemImageName: "person",
                        title: "Walkers",
                        description: "Great forgiotting down your ideas and brainstorming your next feature."
                    )
                    
                    

                    
                    NavigationLink(destination: AuthorizationView().navigationBarBackButtonHidden(true)){
                        Text("Start")
                            .bold()
                            .font(Font.custom("Avenir", size: 22))
                            .padding(12)
                            .padding(.horizontal, 125)
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))

                    } .padding(.vertical, 30)
                    
                    Spacer()

                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always)) // Чтобы пролистывались
            .indexViewStyle(.page (backgroundDisplayMode: .always)) // Три точки внизу
        }
    }
    
}




struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}



struct OnboardView: View {
    let systemImageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image (systemName: systemImageName )
                .resizable()
                .scaledToFit ()
                .frame (width: 100, height: 100)
                .foregroundColor (.teal)
            Text (title)
                .font (.title) .bold ()
            Text (description)
                .multilineTextAlignment (.center)
                .foregroundColor (.secondary)
        }
        .padding (.horizontal, 40)
    }
}

