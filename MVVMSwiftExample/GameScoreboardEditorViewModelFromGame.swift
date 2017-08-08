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
  
  var time: Dynamic<String>
  var score: Dynamic<String>

  var isFinished: Dynamic<Bool>
  var isPaused: Dynamic<Bool>
  
  var homePlayers: [PlayerScoreboardMoveEditorViewModel]
  var awayPlayers: [PlayerScoreboardMoveEditorViewModel]
  
  func togglePause() {
    if isPaused.value {
      startTimer()
    } else {
      pauseTimer()
    }
    
    self.isPaused.value = !isPaused.value
  }
  
  init(withGame game: Game) {
    self.game = game
    
    self.homeTeam = game.homeTeam.name
    self.awayTeam = game.awayTeam.name
    
    self.homePlayers = GameScoreboardEditorViewModelFromGame.playerViewModels(from: game.homeTeam.players,
                                                                              game: game)
    self.awayPlayers = GameScoreboardEditorViewModelFromGame.playerViewModels(from: game.awayTeam.players,
                                                                           game: game)
    
    self.time = Dynamic(GameScoreboardEditorViewModelFromGame.timeRemainingPretty(for: game))
    self.score = Dynamic(GameScoreboardEditorViewModelFromGame.scorePretty(for: game))
    self.isFinished = Dynamic(game.isFinished)
    self.isPaused = Dynamic(true)
  }
  
  fileprivate var gameTimer: Timer?
  fileprivate func startTimer() {
    let interval: TimeInterval = 0.001
    gameTimer = Timer.schedule(repeatInterval: interval) { timer in
      self.game.time += interval
      self.time.value = GameScoreboardEditorViewModelFromGame.timeRemainingPretty(for: self.game)
    }
  }
  
  fileprivate func pauseTimer() {
    gameTimer?.invalidate()
    gameTimer = nil
  }
  
  fileprivate static func timeFormatted(totalMillis: Int) -> String {
    let millis: Int = totalMillis % 1000 / 100  // "/ 100" <- Because we only want one digit
    let totalSeconds: Int = totalMillis / 1000
    
    let seconds: Int = totalSeconds % 60
    let minutes: Int = (totalSeconds / 60)
    
    return String(format: "\(minutes):\(seconds).\(millis)")
  }
  
  fileprivate static func timeRemainingPretty(for game: Game) -> String {
    return timeFormatted(totalMillis: Int(game.time * 1000))
  }
  
  fileprivate static func scorePretty(for game: Game) -> String {
    return String(format: "\(game.homeTeamScore) - \(game.awayTeamScore)")
  }
  
  fileprivate static func playerViewModels(from players: [Player], game: Game) -> [PlayerScoreboardMoveEditorViewModel] {
    
    var playerViewModels: [PlayerScoreboardMoveEditorViewModel] = [PlayerScoreboardMoveEditorViewModel]()
    for player in players {
      playerViewModels.append(PlayerScoreboardMoveEditorViewModelFromPlayer(withGame: game,
                                                                            player: player))
    }
    
    return playerViewModels
  }
  
  
}
