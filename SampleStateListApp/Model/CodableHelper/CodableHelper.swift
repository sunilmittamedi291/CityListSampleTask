//
//  CodableHelper.swift
//  SampleStateListApp
//
//  Created by Sunil Kumar on 01/02/24.
//

import Foundation
class CodableHelper {
    static func encode<T: Encodable>(_ value: T) -> Data? {
        do {
            return try JSONEncoder().encode(value)
        } catch {
            return nil
        }
    }
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            return nil
        }
    }
}
