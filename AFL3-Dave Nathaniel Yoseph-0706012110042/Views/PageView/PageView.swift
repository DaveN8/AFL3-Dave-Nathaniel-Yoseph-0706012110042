//
//  PageView.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 21/04/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
//    @State private var currentPage2 = 2
//    @State private var skip = false
    
    var body: some View {
        //                VStack (alignment: .leading){
        //                    Button("Skip") {
        //                        skip.toggle()
        //                    }
        //
        //                    if skip {
        //                        PageViewController(pages: pages, currentPage: $currentPage2)
        //                    } else {
        //                        PageViewController(pages: pages, currentPage: $currentPage)
        //                    }
        //
        //
        //    }
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
//        VStack {
//            PageViewController(pages: pages, currentPage: $currentPage)
//            Text("Current Page: \(currentPage)")
//        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map {
            FeatureCard(landmark: $0)
        })
        .aspectRatio(3/2, contentMode: .fit)
        
        //        Ambil data tampilan dari feature card
    }
}
