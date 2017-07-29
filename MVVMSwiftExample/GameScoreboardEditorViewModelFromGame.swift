//
//  GameScoreboardEditorViewModelFromGame.swift
//  MVVMSwiftExample
//
//  Created by Josiah Mory on 7/29/17.
//  Copyright © 2017 Toptal. All rights reserved.
//

import Foundation

class GameScoreboardEditorViewModelFromGame: NSObject, GameScoreboardEditorViewModel {
  let game: Game
  
  struct Formatter {
    static let durationFormatter: DateComponentsFormatter = {
      let dateFormatter = DateComponentsFormatter()
      dateFormatter.unitsStyle = .positional
      return dateFormatter
    }()
  }
  
  var homeTeam: String
  var awayTeam: String
  
  var time: String
  var score: String

  var isFinished: Bool
  var isPaused: Bool
  
  func togglePause() {
    if isPaused {
      startTimer()
    } else {
      pauseTimer()
    }
    
    self.isPaused = !isPaused
  }
  
  init(withGame game: Game) {
    self.game = game
    
    self.homeTeam = game.homeTeam.name
    self.awayTeam = game.awayTeam.name
    
    self.time = GameScoreboardEditorViewModelFromGame.timeRemainingPretty(for: game)
    self.score = GameScoreboardEditorViewModelFromGame.scorePretty(for: game)
    self.isFinished = game.isFinished
    self.isPaused = true
  }
  
  
  
  
  
}















