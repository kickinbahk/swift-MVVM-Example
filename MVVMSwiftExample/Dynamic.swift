//
//  Dynamic.swift
//  MVVMSwiftExample
//
//  Created by Josiah Mory on 8/8/17.
//  Copyright © 2017 Toptal. All rights reserved.
//

import Foundation

class Dynamic<T> {
  typealias Listener = (T) -> ()
  var listener: Listener?
  
  func bind(_ listener: Listener?) {
    self.listener = listener
  }
  
  func bindAndFire(_ listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ v: T) {
    value = v
  }
}
