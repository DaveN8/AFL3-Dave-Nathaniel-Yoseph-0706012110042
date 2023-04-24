//
//  CategooryRow.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

struct CategooryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack{
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
            
            // making a template for the grouped landmark and the animation
//            HStack (alignment: .top, spacing: 0){
//                ForEach(items) { landmark in
//                    Text(landmark.name)
//                }
//            }
        }
    }
}

struct CategooryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategooryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
