//
//  PlayerScoreboardMoveEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by Josiah Mory on 8/1/17.
//  Copyright © 2017 Toptal. All rights reserved.
//

import Foundation

protocol PlayerScoreboardMoveEditorViewModel {
  var playerName: String { get }
  
  var onePointMoveCount: String { get }
  var twoPointMoveCount: String { get }
  var assistMoveCount: String { get }
  var reboundMoveCount: String { get }
  var foulMoveCount: String { get }
  
  func onePointMove()
  func twoPointMove()
  func assistMove()
  func reboundMove()
  func foulMove()
}
