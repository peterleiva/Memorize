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
    change(by: 200)
  }
  
  mutating func decrement() {
    change(by: -100)
  }
  
  private mutating func change(by value: Int) {
    self.value += value
  }
}
