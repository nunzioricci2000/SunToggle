//
//  ContentView.swift
//  ExampleProject
//
//  Created by Nunzio Ricci on 15/06/23.
//

import SwiftUI
import SunToggle

struct ContentView: View {
    
    @State var isOn: Bool = false
    @State var isOff: Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn) { EmptyView() }
                .toggleStyle(.sun)
            Toggle(isOn: $isOff) { EmptyView() }
        }
            .fixedSize()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
