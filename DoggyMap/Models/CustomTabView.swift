//
//  CustomTabView.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 19.04.2023.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    @Binding var showDetailPage: Bool
    
    let tabBarItems: [(image: String, title: String)] = [
        ("magnifyingglass", "places-string".localized),
        ("safari", "news-string".localized),
        ("cloud", "weather-string".localized),
        ("person", "profile-string".localized)
    ]
    
    var body: some View {
            ZStack{
                HStack(spacing: 0){
                    ForEach(0..<4){ index in
                        Button(action: {
                            if !showDetailPage { // Проверка на активацию showDetailPage
                                tabSelection = index + 1
                            }
                        }){
                            VStack(spacing: 8){
                                Spacer()
                                
                                Image(systemName: tabBarItems[index].image)
                                    .font (.system(size: (index + 1 == tabSelection ? 25 : 20), weight: .semibold)) // Шрифт символа
                                .foregroundColor(Color.gray) // Цвет символа
                                
                                Text(tabBarItems[index].title)
                                    .font (.system(size: 10, weight: (index + 1 == tabSelection ? .bold : .light))) // Выделение текста при выборе
                                    .foregroundColor(Color.gray)
                                    .padding(.top, 1)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                }
                .padding(.bottom)
                .padding(.horizontal)
                .background(.thickMaterial) //цвет меню
                .cornerRadius(30)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 5)
                .frame(height: 80) // Высота меню
                
                .offset(y: showDetailPage ? 120 : 0)
                
            }

            .padding(.horizontal)
        }
    }

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView(tabSelection: .constant(1))
//            .previewLayout(.sizeThatFits)
//            .padding(.vertical)
//    }
//}
