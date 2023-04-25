//
//  LandmarkCommands.swift
//  AFL3-Dave Nathaniel Yoseph-0706012110042
//
//  Created by MacBook Pro on 25/04/23.
//

import SwiftUI

struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
//    untuk mencari tau landmark yang sedang terpilih
    
    var body: some Commands{
        SidebarCommands()
        
        CommandMenu("Lanmdark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get {self[SelectedLandmarkKey.self]}
        set {self[SelectedLandmarkKey.self] = newValue}
    }
}
