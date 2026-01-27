//
//  DiceModel.swift
//  DicePro
//
//  Created by Dmitri on 30.11.25.
//

import UIKit

// MARK: - Dice Model
/// Core logic for dice rolling, score tracking and reset functionality.
/// Works together with `GameData` and `Player` models.
struct DiceModel  {
    
    // MARK: - Dice Types
    /// Available dice color themes with their mapped image sets.
    enum Dices {
        case blackGrey, blackRed, blackYellow, blueGrey, greyBlack, greyRed, whiteBlue
        
        /// Returns an array of dice face image names for the selected theme.
        var diceArray: [String] {
            switch self {
            case .blackGrey:
                return ["BlackGrey1", "BlackGrey2", "BlackGrey3",
                        "BlackGrey4", "BlackGrey5", "BlackGrey6"]
                
            case .blackRed:
                return ["BlackRed1", "BlackRed2", "BlackRed3",
                        "BlackRed4", "BlackRed5", "BlackRed6"]
                
            case .blackYellow:
                return ["BlackYellow1", "BlackYellow2", "BlackYellow3",
                        "BlackYellow4", "BlackYellow5", "BlackYellow6"]
                
            case .blueGrey:
                return ["BlueGrey1", "BlueGrey2", "BlueGrey3",
                        "BlueGrey4", "BlueGrey5", "BlueGrey6"]
                
            case .greyBlack:
                return ["GreyBlack1", "GreyBlack2", "GreyBlack3",
                        "GreyBlack4", "GreyBlack5", "GreyBlack6"]
                
            case .greyRed:
                return ["GreyRed1", "GreyRed2", "GreyRed3",
                        "GreyRed4", "GreyRed5", "GreyRed6"]
                
            case .whiteBlue:
                return ["WhiteBlue1", "WhiteBlue2", "WhiteBlue3",
                        "WhiteBlue4", "WhiteBlue5", "WhiteBlue6"]
            }
            
            
        }
    }
    
    
    // MARK: - Stored Game Data
    /// Tracks all players and their scores.
    var data: GameData = GameData(players: [
        Player(name: Players.player1.name),
        Player(name: Players.player2.name)
    ])
    
    
    // MARK: - Score State
    /// Indicates whether any player already has non-zero score or attempts.
    var hasScores: Bool {
        return data.players.contains { $0.totalScore > 0 || $0.attempts > 0 }
    }
    
    
    // MARK: - Dice Roll
    /// Returns a random number in range 0...5 (representing dice index).
    func roll() -> Int {
        Int.random(in: 0...5)
    }
    
    
    // MARK: - Ranking
    /// Updates player rankings via GameData's ranking logic.
    mutating func updateRanks() {
        data.updateRanks()
    }
    
    
    // MARK: - Dice Image Mapping
    /// Returns an image name for a specific score and selected dice theme.
    func setDice(score: Int, color: Dices) -> String {
        let dice = color.diceArray
        return dice[score]
    }
    
    
    // MARK: - Reset Scores
    /// Resets all players’ game statistics to zero.
    mutating func resetAllScores() {
        if hasScores {
            for i in data.players.indices {
                data.players[i].totalScore = 0
                data.players[i].currentScore = 0
                data.players[i].attempts = 0
                data.players[i].rank = 0
            }
        }
    }
}
