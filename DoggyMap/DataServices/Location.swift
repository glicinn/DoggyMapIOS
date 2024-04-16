//
//  Location.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 01.04.2023.
//

import Foundation
import MapKit



struct Location: Identifiable, Equatable {


//    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String

    // Identifiable
    var id: String{
        name + cityName
    }

    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}




//struct Location: Identifiable, Equatable {
//
//
//    // Identifiable
//    var id: String?
//    let name: String
//    let cityName: String
//    let coordinates: GeoPoint
//    let description: String
//    let imageNames: [String]
//    let link: String
//
//
//    // Equatable
//    static func == (lhs: Location, rhs: Location) -> Bool {
//        lhs.id == rhs.id
//    }
//}





//struct Location: Identifiable {
//
//    var id: String // ID записи
//    let cityName: String
//    let coordinates: GeoPoint
//    let description: String
//    let imageNames: [String]
//    let link: String
//
//}



//struct Location: Identifiable, Equatable {
//    var id: String?
//    var name: String
//    var cityName: String
//    var coordinates: GeoPoint
//    var description: String
//    var imageNames: [String]
//    var link: String
//    
//    static func == (lhs: Location, rhs: Location) -> Bool {
//            lhs.id == rhs.id
//        }
//}
