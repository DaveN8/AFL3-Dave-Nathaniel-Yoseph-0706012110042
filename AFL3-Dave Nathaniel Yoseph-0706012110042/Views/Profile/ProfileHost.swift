//
//  ProfileHost.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    
    var body: some View {
//        Text("Profile for: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 10) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
