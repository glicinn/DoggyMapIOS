//
//  CustomTabBar.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 23.03.2023.
//

import SwiftUI



struct CustomTabBar: View {

    @Binding var selectedTab: String
    @Binding var isTapped: Bool
    

    @State var mapTab = "magnifyingglass"
    @State var newsTab = "safari"
    @State var messageTab = "message"
    @State var profileTab = "person"
    @State var present = true

    @State var showView = false

    @StateObject private var vm = LocationsViewModel()
    


    var body: some View {
        
            

            HStack(spacing: 0){
                

                TabBarButton(image: "magnifyingglass", selectedTab: $selectedTab, text: "Places", isTapped: $isTapped)
                
                TabBarButton(image: "safari", selectedTab: $selectedTab, text: "News", isTapped: $isTapped)

                
                TabBarButton(image: "message", selectedTab: $selectedTab, text: "Messages", isTapped: $isTapped)

                
                TabBarButton(image: "person", selectedTab: $selectedTab, text: "Profile", isTapped: $isTapped)
                
                
            }
            .padding()
            .background(.thickMaterial) //цвет меню
            .cornerRadius(30)
            .padding(.horizontal)
            .shadow(
                color: Color.black.opacity(0.3),
                radius: 5)
            .frame(height: 80) // Высота меню
        
            
            
            
            
            
            
            //        if(isTapped == true){
            //            switch selectedTab{
            //                    case "magnifyingglass":
            //                        return MainView(selectedTab: 1)
            //                    case "safari":
            //                        return MainView(selectedTab: 2)
            //                    case "message":
            //                        return MainView(selectedTab: 3)
            //                    case "person":
            //                        return MainView(selectedTab: 4)
            //                    }
            //        }
            
            
            
            
            
//        ZStack{
//            if(isTapped == true){
//                if(selectedTab == "magnifyingglass"){
//                    MainView(selectedTab: 1)
//                }
//                else if(selectedTab == "safari"){
//
//                        MainView(selectedTab: 2)
//
//                }
//                else if(selectedTab == "message"){
//
//                        MainView(selectedTab: 3)
//
//                }
//                else if(selectedTab == "person"){
//
//                        MainView(selectedTab: 4)
//
//                }
//            }
//        }
        
        
        
        
        
            
            
//            ZStack{
//                if(isTapped == true){
//                    if(selectedTab == "magnifyingglass"){
//                        ZStack{}.fullScreenCover(isPresented: $isTapped){
//
//                            MapView()
//                            //                            .environmentObject(vm)
//                        }
//                    }
//                    else if(selectedTab == "safari"){
//                        ZStack{}.fullScreenCover(isPresented: $isTapped){
//                            NewsView()
//                        }
//                    }
//                    else if(selectedTab == "message"){
//                        ZStack{}.fullScreenCover(isPresented: $isTapped){
//                            MessengerView()
//                        }
//                    }
//                    else if(selectedTab == "person"){
//                        ZStack{}.fullScreenCover(isPresented: $isTapped){
//                            ProfileView()
//                        }
//                    }
//                }
//            }
            
            
            
            //
            
            
            //        if selectedTab == messageTab{
            //            Text("")
            //                .sheet(isPresented: $present){
            //                    News()
            //                }
            //        };
            
            
        

    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct TabBarButton: View{
    
    @Environment (\.presentationMode) var presentationMode
    
    var image: String
    @Binding var selectedTab: String
    var text: String
    @Binding var isTapped: Bool
    
    
    
    var body: some View {
        
        // For getting mid Point of each button for curve Animation...
//        GeometryReader{reader in
            
            Button (action: {
                withAnimation{
                    selectedTab = image
                }
                self.isTapped.toggle()
            }, label: {
                
                VStack{
                    Image (systemName: image)
                        .font (.system(size: (selectedTab == image ? 25 : 20), weight: .semibold)) // Шрифт символа
                    //                    .foregroundColor(Color("TabSelected"))
                        .foregroundColor(Color.gray) // Цвет символа
//                        .offset (y: selectedTab == image ? -5 : 0) // Изменение позиции при выборе
                    
                    
                    Text(text)
                        .font (.system(size: 10, weight: (selectedTab == image ? .bold : .light))) // Выделение текста при выборе
                        .foregroundColor(Color.gray)
                        .padding(.top, 1)
               
                }
               
                
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
//        }
//        .frame(height: 50) // Высота меню
    }
}

