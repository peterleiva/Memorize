//
//  ContentView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack {
        CardView(name: "👻", hidden: true)
        CardView(name: "👻")
        CardView(name: "👻")
        CardView(name: "👻")
      }
    }
}

#Preview {
    ContentView()
}
