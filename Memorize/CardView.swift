//
//  CardView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

struct CardView: View {
  var name: String?
  var hidden = false
  
    var body: some View {
      ZStack {
        if !hidden {
          RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.white)

          RoundedRectangle(cornerRadius: 25)
            .strokeBorder(lineWidth: 2)

          Text(name ?? "").font(.largeTitle)
        } else {
          RoundedRectangle(cornerRadius: 25)
        }
        
      }
      .foregroundStyle(.orange)
      .padding()
    }
}

#Preview {
  CardView(name: "👻")
}
