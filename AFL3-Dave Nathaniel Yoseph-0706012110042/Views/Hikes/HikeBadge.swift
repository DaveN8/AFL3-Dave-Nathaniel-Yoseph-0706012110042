//
//  HikeBadge.swift
//  AFL3-Dave Nathaniel Yoseph-0706012110042
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack (alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
