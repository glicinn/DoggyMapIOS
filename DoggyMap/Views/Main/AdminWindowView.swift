//
//  AdminWindowView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 25.04.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


struct AdminWindowView: View {
    
    @AppStorage("uLogin") var userLogin: String = ""
    @State private var showAddUser = false
    @State private var showAddNews = false
    @State var isTapped = false
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                Text ("Admin Window")
                    .bold()
                    .font(Font.custom("Avenir", size: 40))
                    .padding()
                    .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                
            
//                Button(action: {
//
//                }){
//
//                    Text("Add Place")
//                        .frame(width: UIScreen.main.bounds.size.width - 50)
//                        .frame(minHeight: 55,
//                        maxHeight: UIScreen.main.bounds.size.height/15)
//                        .bold()
//                        .font(Font.custom("Avenir", size: 22))
//                        .background(Color.black)
//                        .foregroundColor(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//
//                }
            
            
            Button(action: {
                showAddNews = true
            }){
                
                Text("News Settings")
                    .frame(width: UIScreen.main.bounds.size.width - 50)
                    .frame(minHeight: 55,
                    maxHeight: UIScreen.main.bounds.size.height/15)
                    .bold()
                    .font(Font.custom("Avenir", size: 22))
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .sheet(isPresented: $showAddNews){
                        AddNews()
                    }


                
            }
            
            Button(action: {
                showAddUser = true
            }){
                
                Text("User Settings")
                    .frame(width: UIScreen.main.bounds.size.width - 50)
                    .frame(minHeight: 55,
                    maxHeight: UIScreen.main.bounds.size.height/15)
                    .bold()
                    .font(Font.custom("Avenir", size: 22))
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .sheet(isPresented: $showAddUser){
                        AddUser()
                    }
                
            }
            
            
            Spacer()
            Spacer()
            
            Button(action: {
                self.isTapped.toggle()
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    withAnimation{
                        userLogin = ""
                    }
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }){
                Text("Log out")
                    .frame(width: UIScreen.main.bounds.size.width - 50)
                    .frame(minHeight: 55,
                    maxHeight: UIScreen.main.bounds.size.height/15)
                    .bold()
                    .font(Font.custom("Avenir", size: 22))
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        

        
    }
}





struct AddUser: View {
    @AppStorage("uLogin") var userLogin: String = ""

    
    @State private var showError = false
    @State private var email = ""
    @State private var password = ""
    @State private var repPassword = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var middleName = ""
    @ObservedObject var model = FirebaseTestViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            
            
            
            
            VStack{
                
                
                
                
                List(model.list){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.id)
                                .bold()
                            Text(item.name)
                            Text(item.surname)
                        }
                        Spacer()
                        
                        Button(action: {
                            model.updateData(userToUpdate: item, newName: name, newSurname: surname)
                        }){
                            Image(systemName: "pencil")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .background(Color.white)
                        .padding(.horizontal, 20)
                        Button(action: {
                            model.deleteData(usersToDelete: item)
                            print("hello")
                        }){
                            Image(systemName: "minus.circle")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .background(Color.white)
                    }

                }
  
                
                
                
                
                
                Text("Add user")
                    .foregroundColor(.primary)
                    .font(Font.custom("Avenir", size: 30))
                    .bold()
                
                
                TextField("User's name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("User's surname", text: $surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("User's email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                .border(Color.black)
                    .padding(.horizontal, 50)
                
                SecureField("User's password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
            }
            .padding(.bottom, 30)
        
            
            
            Button(action: { // Кнопка регистрации
                if name != "" && surname != ""{
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error{
                            print(error)
                            self.showError.toggle()
                            return
                        }
                        if let authResult = authResult{
                            print(authResult.user.uid)
                            //                                userID = authResult.user.uid
                            //                                userName = name
                            //                                userSurname = surname
                            model.addData(name: name, surname: surname, login: email)
                        }
                    }
                }
                else{
                    self.showError.toggle()
                }
                
                //                    self.showError.toggle()
            }){
                Text("Add")
                    .frame(width: UIScreen.main.bounds.size.width - 50)
                    .frame(minHeight: 55,
                           maxHeight: UIScreen.main.bounds.size.height/15)
                    .bold()
                    .font(Font.custom("Avenir", size: 22))
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .sheet(isPresented: $showError){
                        RegistrationError()
                    }
                
            }
        }
        .frame(minHeight: UIScreen.main.bounds.size.height/1.14)
        .overlay(backButton ,alignment: .topTrailing)
        
    }
    
    init(){
        model.getData()
    }
    
}

extension AddUser{
    private var backButton: some View{
        
        Button(action:{
//            vm.sheetLocation = nil
            dismiss()
        }){
            Image(systemName: "xmark")
                .font(.headline)
                .padding(10)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}










struct AddNews: View {

    
    @State private var showError = false
    @State private var appDescription = ""
    @State private var appLogo = ""
    @State private var appName = ""
    @State private var artwork = ""
    @State private var bannerTitle = ""
    @State private var platformTitle = ""
    @ObservedObject var model = FirebaseNewsViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            
            
            
            
            VStack{
                
                
                
                
                List(model.list){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.bannerTitle)
                                .bold()
                            Text(item.appDescription)

                        }
                        Spacer()
                        
                        Button(action: {
                            model.updateData(newsToUpdate: item, newappDescription: appDescription, newappLogo: appLogo, newappName: appName, newartwork: artwork, newbannerTitle: bannerTitle, newplatformTitle: platformTitle)
                        }){
                            Image(systemName: "pencil")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .background(Color.white)
                        .padding(.horizontal, 20)
                        Button(action: {
                            model.deleteData(newsToDelete: item)
                            print("hello")
                        }){
                            Image(systemName: "minus.circle")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .background(Color.white)
                    }

                }
  
                
                
                
                
                
                Text("Add news")
                    .foregroundColor(.primary)
                    .font(Font.custom("Avenir", size: 30))
                    .bold()
                
                
                
                
                TextField("App Description", text: $appDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("App Logo", text: $appLogo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("App Name", text: $appName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("Artwork", text: $artwork)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("Banner Title", text: $bannerTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("Platform Title", text: $platformTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
            }
            .padding(.bottom, 30)
        
            
            
            Button(action: { // Кнопка Добавления
                if appDescription != "" && appLogo != "" && appName != "" && artwork != "" && bannerTitle != "" && platformTitle != ""{
                    
                            model.addData(appDescription: appDescription, appLogo: appLogo, appName: appName, artwork: artwork, bannerTitle: bannerTitle, platformTitle: platformTitle)
                    }
                else{
                    self.showError.toggle()
                }

            }){
                Text("Add")
                    .frame(width: UIScreen.main.bounds.size.width - 50)
                    .frame(minHeight: 55,
                           maxHeight: UIScreen.main.bounds.size.height/15)
                    .bold()
                    .font(Font.custom("Avenir", size: 22))
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .sheet(isPresented: $showError){
                        RegistrationError()
                    }
                
            }
        }
        .frame(minHeight: UIScreen.main.bounds.size.height/1.14)
        .overlay(backButton ,alignment: .topTrailing)
        
    }
    
    init(){
        model.getData()
    }
    
}

extension AddNews{
    private var backButton: some View{
        
        Button(action:{
//            vm.sheetLocation = nil
            dismiss()
        }){
            Image(systemName: "xmark")
                .font(.headline)
                .padding(10)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}










struct AdminWindowView_Previews: PreviewProvider {
    static var previews: some View {
        AdminWindowView()
    }
}








