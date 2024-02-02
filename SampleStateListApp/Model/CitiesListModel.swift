//
//  CitiesListModel.swift
//  SampleStateListApp
//
//  Created by Sunil Kumar on 01/02/24.
//

import Foundation


struct StateListModel: Identifiable {
    var id = UUID()
    let stateName: String
    let citylist:[CitiesList]
    
}
struct CitiesList: Codable, Identifiable {
    var id: UUID?
    let city: String?
    let country: String?
    let admin_name: String?
}
