//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by MacBook Pro on 27/04/23.
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
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
