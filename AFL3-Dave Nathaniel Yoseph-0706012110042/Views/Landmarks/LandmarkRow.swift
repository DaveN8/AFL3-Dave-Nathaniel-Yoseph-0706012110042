//
//  LandmarkRow.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        //membuat tampilan horizontal, untuk template list landmark yang akan muncul diakhir
        HStack{
            landmark.image
                .resizable() // berarti ukuran gambar mengikuti space yang tersedia
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmark = ModelData().landmarks
    
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
            //menginclude atau memasukkan 2 template list dalam satu grup, atau dalam kata lain mengrup setiap list
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
