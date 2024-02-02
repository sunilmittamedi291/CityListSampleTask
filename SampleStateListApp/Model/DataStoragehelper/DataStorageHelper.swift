//
//  DataStorageHelper.swift
//  SampleStateListApp
//
//  Created by Sunil Kumar on 01/02/24.
//

import Foundation

enum DataStorageKeys: String {
    case citiesList = "CityListCache"
}

class DataStorageHelper {
    static func loadData<T: Decodable>(fromKey key: String) -> T? {
        if let cachedData = UserDefaults.standard.data(forKey: key),
           let decodedData = CodableHelper.decode(T.self, from: cachedData) {
            return decodedData
        }
        return nil
    }
    
    static func saveData<T: Encodable>(data: T, toKey key: String) {
        
        if let encodedData = CodableHelper.encode(data) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
       
        
    }
    
    static func clearData(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
