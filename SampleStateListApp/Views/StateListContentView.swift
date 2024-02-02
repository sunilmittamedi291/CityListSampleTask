//
//  StateListContentView.swift
//  SampleStateListApp
//
//  Created by Sunil Kumar on 01/02/24.
//

import SwiftUI



struct StateListContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var cityListViewModel = CitiesListViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                List(cityListViewModel.groupedCities) { item in
                    DisclosureGroup {
                        ForEach(item.citylist, id: \.city) { citymodel in
                            Text(citymodel.city ?? "")
                        }
                        
                    } label: {
                        Text(item.stateName).bold()
                    }
                    
                    
                    
                }.listStyle(.plain)
                
            }.padding().foregroundColor(colorScheme == .dark ? .white : .black).navigationTitle("State List").toolbar {
                Button("Refresh") {
                    Task {
                        cityListViewModel.refreshData()
                    }
                }
            }
        }

    }
}

struct StateListContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateListContentView()
    }
}
