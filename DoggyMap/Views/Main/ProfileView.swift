//
//  ProfileView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 25.03.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ProfileView: View {
    
//    init(){
//            UINavigationBar.setAnimationsEnabled(false)
//        }
    
//    @ObservedObject var model = FirebaseTestViewModel()
    
//    @AppStorage("uid") var userID: String = ""
    @AppStorage("uLogin") var userLogin: String = ""
    
    @State var selectedTab = "person"
    @State var isTapped = false
    
    @State var NameSurname = ""
    @State var user: String = ""
    
    @State private var isStartViewPresented = false
    
    
    
    
    
    func viewName(){
        // Gete a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        let docRef = db.collection("users").document("\(userLogin)")
        
        docRef.getDocument { (document, error) in
               guard error == nil else {
                   print("error", error ?? "")
                   return
               }

               if let document = document, document.exists {
                   let data = document.data()
                   if let data = data {
                       self.user = data["name"] as? String ?? ""
                       self.user = data["surname"] as? String ?? ""
                       NameSurname = "\(data["name"] as? String ?? "") \(data["surname"] as? String ?? "")"
                   }
               }

           }
    }
    
    
    
    
    
    
    
    var body: some View {


            VStack{
                VStack{
                    ZStack{
                        Image("person")
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: UIScreen.main.bounds.size.width,
                                height: UIScreen.main.bounds.size.width)
                            .clipped()
                        
                        
                            
                        
//                        Text("Profile")
//                            .font(Font.custom("Avenir", size: 30))
//                            .foregroundColor(.white)
//                            .bold()
//                            .padding()
                    }
                    VStack(alignment: .leading){
//                        Text("\(userName) \(userSurname)")
//                            .font(Font.custom("Avenir", size: 30))
//                            .bold()
                        
                        
                        
                        
//                        Text(NameSurname)
                        Text("Dmitri Deren")
//                            .onAppear(perform: viewName)
                            .font(Font.custom("Avenir", size: 30))
                            .bold()
                        
                        // Кнопка Календаря
                        Button(action: {
                            self.isStartViewPresented = true
                        }){
                            Text("My Calendar")
                                .frame(width: UIScreen.main.bounds.size.width - 50)
                                .frame(minHeight: 55,
                                maxHeight: UIScreen.main.bounds.size.height/10)
                                .bold()
                                .font(Font.custom("Avenir", size: 22))
        //                        .background(Color.gray)
                                .background(.thinMaterial)
                                .foregroundColor(.primary)
                                .clipShape(RoundedRectangle(cornerRadius: 20))

                        }
                            

                        
                        
//                        Text("Your user ID is: \(userID)")
//                            .font(Font.custom("Avenir", size: 20))
                        
                    }
                    .sheet(isPresented: $isStartViewPresented) {
                               CalendarView()
                           }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                }
                .ignoresSafeArea()
                
                
                
                
                
                Spacer()
                
                
                
                // Кнопка выхода
                Button(action: {
                    self.isTapped.toggle()
                    let firebaseAuth = Auth.auth()
                    do {
                      try firebaseAuth.signOut()
                        withAnimation{
//                            userID = ""
                            userLogin = ""
                        }
                    } catch let signOutError as NSError {
                      print("Error signing out: %@", signOutError)
                    }
                }){
                    Text("Log Out")
                        .frame(width: UIScreen.main.bounds.size.width - 50)
                        .frame(minHeight: 55,
                        maxHeight: UIScreen.main.bounds.size.height/15)
                        .bold()
                        .font(Font.custom("Avenir", size: 22))
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.bottom, 50)
                
                
                
                
                
//                NavigationLink(destination: AuthorizationView().navigationBarBackButtonHidden(true)){
//                    Text("Log out")
//                        .bold()
//                        .font(Font.custom("Avenir", size: 22))
//                        .padding(12)
//                        .padding(.horizontal, 125)
//                        .background(Color.red)
//                        .foregroundColor(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//
//                } .padding(.bottom, 22)
                
                
                
//                Button(action: {self.isTapped.toggle()}){
//                    Text("Log out")
//                        .bold()
//                        .font(Font.custom("Avenir", size: 22))
//                        .padding(12)
//                        .padding(.horizontal, 125)
//                        .background(Color.red)
//                        .foregroundColor(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .fullScreenCover(isPresented: $isTapped){
//                            AuthorizationView()
//                        }
//                }
                
                
                
//                CustomTabBar(selectedTab: $selectedTab, isTapped: $isTapped)
            }
            .background(Color("BackColor").ignoresSafeArea())
        

        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


