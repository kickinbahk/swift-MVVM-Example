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
  var time: String { get }
  var score: String { get }
  var isFinished: Bool { get }
  
  var isPaused: Bool { get }
  func togglePause()
}
