//
//  CircleImage.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        // untuk templat desain pada gambar, secara berurutan, membuat gambar bulat, memberi border, dan memberi shadow
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
        //untuk contoh gambar atau preview tampilan gambar pada tampilan akhir
    }
}
