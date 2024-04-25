//
//  AuthorizationView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 25.03.2023.
//

import SwiftUI
import FirebaseAuth

struct AuthorizationView: View {
    
//    init(){
//        UINavigationBar.setAnimationsEnabled(false)
//    }
    
//    @AppStorage("uid") var userID: String = ""
    @AppStorage("uLogin") var userLogin: String = ""
    
    @State private var showError = false
    @State private var email = ""
    @State private var password = ""
    @State var buttonTap = false

    
    
    var body: some View {
        NavigationView{
            
            
            VStack{
                
                Spacer()
                
                Text("authorization-string".localized)
                    .font(Font.custom("Avenir", size: 30))
                    .bold()
                
                TextField("auth-email-string".localized, text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                .border(Color.black)
                    .padding(.horizontal, 50)
                
                SecureField("auth-password-string".localized, text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                
                HStack{
                    Text("auth-to-reg-string".localized)
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)){
                        Text("to-reg-string".localized)
                            .foregroundColor(Color.gray)
                    }
                } .padding(.top, 20)
                
                
                Spacer()
                
                
                    Button(action: {
                        
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            if let error = error{
                                print(error)
                                self.showError.toggle()
                                return
                            }
                            if let authResult = authResult{
                                
                                print(authResult.user.uid)
                                withAnimation{
                                }
                                userLogin = email
                            }
                        }
                    }){
//                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                        Text("log-in-string".localized)
                            .frame(width: UIScreen.main.bounds.size.width - 50)
                            .frame(minHeight: 55,
                            maxHeight: UIScreen.main.bounds.size.height/15)
                            .bold()
                            .font(Font.custom("Avenir", size: 22))
//                            .padding(12)
//                            .padding(.horizontal, 125)
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .sheet(isPresented: $showError){
                                AuthorizationError()
                            }
                }
                

            }
        }
        
    }
}




struct AuthorizationError: View {
    var body: some View {
        Image(systemName: "xmark.circle")
            .font (.system(size: 80, weight: .light))
            .foregroundColor(Color.red)
        Text("auth-crash-string".localized)
            .font (.system(size: 20, weight: .bold))
            .foregroundColor(.primary)
            .padding(10)
        Text("repeat-string".localized)
            .font (.system(size: 15, weight: .bold))
            .foregroundColor(Color.gray)
        
    }
}




struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
