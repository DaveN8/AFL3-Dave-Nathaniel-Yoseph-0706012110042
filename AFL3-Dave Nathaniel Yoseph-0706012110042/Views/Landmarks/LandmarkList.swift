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
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks)
                    {landmark in
                        // untuk menyambungkan list dengan tampilan detail
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        }label: {
                            LandmarkRow(landmark: landmark)
                        }
                        //
                    }

                }

                .navigationTitle("Landmark")
            }
        
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
