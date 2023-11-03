//
//  Theme.swift
//  Memorize
//
//  Created by Peter on 02/11/23.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
  case halloween, people, animals, toys
  var id: Self { self }
  
  func color() -> Color {
    switch self {
    case .halloween:
      return .orange
    case .people:
      return .blue
    case .animals:
      return .green
      
    case .toys:
      return .red
    }
  }
  
  func symbol() -> String {
    switch self {
    case .toys:
      return "car.front.waves.up.fill"
    case .people:
      return "person.fill.badge.plus"
    case .animals:
        return "pawprint.fill"
    default:
      return "pencil.tip.crop.circle.fill"
    }
  }
}
