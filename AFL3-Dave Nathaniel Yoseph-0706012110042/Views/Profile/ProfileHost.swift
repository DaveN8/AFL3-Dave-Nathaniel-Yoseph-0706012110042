//
//  ProfileHost.swift
//  0706012110042-Dave Nathaniel Y-AFL3
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    //    SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Access the editMode value to read or write the edit scope.
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        //        Text("Profile for: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(){
                        draftProfile = modelData.profile
                    }
                    .onDisappear(){
                        modelData.profile = draftProfile
                    }
                //                Apply the onAppear(perform:) and onDisappear(perform:) modifiers to populate the editor with the correct profile data and update the persistent profile when the user taps the Done button.
                //                Otherwise, the old values appear the next time edit mode activates.
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
