//
//  GameScoreboardEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by Josiah Mory on 7/29/17.
//  Copyright © 2017 Toptal. All rights reserved.
//

import Foundation

protocol GameScoreboardEditorViewModel {
  var homeTeam: String { get }
  var awayTeam: String { get }
  var homePlayers: [PlayerScoreboardMoveEditorViewModel] { get }
  var awayPlayers: [PlayerScoreboardMoveEditorViewModel] { get }
  var time: Dynamic<String> { get }
  var score: Dynamic<String> { get }
  var isFinished: Dynamic<Bool> { get }
  
  var isPaused: Dynamic<Bool> { get }
  func togglePause()
}
