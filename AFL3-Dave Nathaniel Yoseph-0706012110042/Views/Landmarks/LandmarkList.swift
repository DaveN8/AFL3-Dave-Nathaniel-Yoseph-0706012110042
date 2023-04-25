//
//  LandmarkList.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
//    membuat nilai default filter adalah all
    @State private var selectedLandmark: Landmark?
    
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
// untuk memberikan nilai pada setiap filter
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            &&  (filter == .all || filter.rawValue == landmark.category.rawValue)
//            menambahkan kondisi untuk memilih filter dan menampilkan sesuai filter pilihan
        }
    }

    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationView {
            List (selection: $selectedLandmark) {

                ForEach(filteredLandmarks)
                    {landmark in
                        // untuk menyambungkan list dengan tampilan detail
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                            // mengarahkan kehalaman detail landmark
                        }label: {
                            LandmarkRow(landmark: landmark)
                            // memberikan tampilan pada list
                        }
//                        LandmarkRow(landmark: landmark)
                        .tag(landmark)
                    }

                }

                .navigationTitle(title)
                .frame(minWidth: 300)
                .toolbar() {
                    ToolbarItem {
                        Menu {
                            Picker("Category", selection: $filter) {
                                ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .pickerStyle(.inline)
//                            untuk memberikan category pada filter. Dan inline untuk meanmpilkan mereka semua dalam satu layar
                            
                            Toggle(isOn: $showFavoritesOnly){
                                Text("Favorites Only")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }
            
            Text("Select a Landmark")
            }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
//        NavigationStack {
//            List(landmarks) { landmark in
//                NavigationLink {
//                    LandmarkDetail(landmark: landmark)
//                } label:{
//                    LandmarkRow(landmark: landmark)
//                }
//            }
//            .navigationTitle("Landmarks")
//        }
        
//        NavigationView(content: <#T##() -> View#>)
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        // mencontohkan tampilan pada device berbeda
//        ForEach(["iPhone SE (3rd generation)", "iPhone 14"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarkList()
            .environmentObject(ModelData())
    }
}
