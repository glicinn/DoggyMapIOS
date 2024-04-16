//
//  RegistrationView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 25.03.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct RegistrationView: View {
    
//    @AppStorage("uid") var userID: String = ""
    @AppStorage("uLogin") var userLogin: String = ""

    
    @State private var showError = false
    @State private var email = ""
    @State private var password = ""
    @State private var repPassword = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var middleName = ""
    
    @ObservedObject var model = FirebaseTestViewModel()
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                
                Spacer()
                
                Text("Registration")
                    .font(Font.custom("Avenir", size: 30))
                    .bold()
                
                
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("Enter your surname", text: $surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)

                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                .border(Color.black)
                    .padding(.horizontal, 50)
                
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                SecureField("Repeat your password", text: $repPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                HStack{
                    Text("Have an account?")
                    NavigationLink(destination: AuthorizationView().navigationBarBackButtonHidden(true)){
                        Text("Authorize")
                            .foregroundColor(Color.gray)
                    }
                } .padding(.top, 20)
                
                
                Spacer()
                
                Button(action: {
                    if password == repPassword && name != "" && surname != ""{
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if let error = error{
                                print(error)
                                self.showError.toggle()
                                return
                            }
                            if let authResult = authResult{
                                print(authResult.user.uid)
                                userLogin = email
                                model.addData(name: name, surname: surname, login: email)
                            }
                        }
                    }
                    else{
                        self.showError.toggle()
                    }
                    
//                    self.showError.toggle()
                }){
                    Text("Log up")
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
        }
    }
}



struct RegistrationError: View {
    var body: some View {
        Image(systemName: "xmark.circle")
            .font (.system(size: 80, weight: .light))
            .foregroundColor(Color.red)
        Text("Registration Crashed")
            .font (.system(size: 20, weight: .bold))
            .foregroundColor(.primary)
            .padding(10)
        Text("Repeat, please")
            .font (.system(size: 15, weight: .bold))
            .foregroundColor(Color.gray)
    }
}



struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
