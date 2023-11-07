//
//  Score.swift
//  Memorize
//
//  Created by Peter on 06/11/23.
//

import Foundation

struct Score {
  var value: Int = 0
  
  mutating func increment() {
    change(by: 2)
  }
  
  mutating func decrement() {
    change(by: -1)
  }
  
  private mutating func change(by value: Int) {
    self.value += value
  }
}
