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
                
                Text("registration-string".localized)
                    .font(Font.custom("Avenir", size: 30))
                    .bold()
                
                
                TextField("reg-name-string".localized, text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                TextField("reg-surname-string".localized, text: $surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)

                TextField("reg-email-string".localized, text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                .border(Color.black)
                    .padding(.horizontal, 50)
                
                SecureField("reg-password-string".localized, text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                SecureField("reg-repeat-password-string".localized, text: $repPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                HStack{
                    Text("reg-to-auth-string".localized)
                    NavigationLink(destination: AuthorizationView().navigationBarBackButtonHidden(true)){
                        Text("to-auth-string".localized)
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
                    Text("log-up-string".localized)
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
        Text("reg-crash-string".localized)
            .font (.system(size: 20, weight: .bold))
            .foregroundColor(.primary)
            .padding(10)
        Text("repeat-string".localized)
            .font (.system(size: 15, weight: .bold))
            .foregroundColor(Color.gray)
    }
}



struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
