//
//  CitiesListViewModel.swift
//  SampleStateListApp
//
//  Created by Sunil Kumar on 01/02/24.
//

import Foundation

class CitiesListViewModel: ObservableObject {
    @Published var items: [CitiesList] = [] {
        didSet {
            groupCitiesByStateName()
        }
    }
    @Published var groupedCities: [StateListModel] = []
    
    init() {
        loadData()
    }
    func loadData() {
        if let cachedItems: [CitiesList] = DataStorageHelper.loadData(fromKey: DataStorageKeys.citiesList.rawValue) {
            items = cachedItems
            
        } else {
            if let url = Bundle.main.url(forResource: "au_cities", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    
                    if let decodedItems = CodableHelper.decode([CitiesList].self, from: data) {
                        items = decodedItems
                        DataStorageHelper.saveData(data: decodedItems, toKey: DataStorageKeys.citiesList.rawValue)
                    }
                    
                } catch {
                    print("Error : \(error)")
                }
            }
        }
    }
    
    
    func groupCitiesByStateName() {
        let groupedArray = Dictionary(grouping: items, by: { $0.admin_name ?? "" })
        self.groupedCities = groupedArray.map({StateListModel(stateName: $0.key, citylist: $0.value)}).sorted{$0.stateName < $1.stateName}
    
    }
    private func clearCache() {
        DataStorageHelper.clearData(forKey: DataStorageKeys.citiesList.rawValue )
    }
    
    func refreshData() {
        clearCache()
        loadData()
    }
}

