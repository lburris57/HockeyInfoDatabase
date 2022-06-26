//
//  PlayerStatistics.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLPlayerStatistics database class
struct PlayerStatistics: Identifiable
{
    let nhlPlayerStatistics: NHLPlayerStatistics
    
    var id: ObjectId
    {
        return nhlPlayerStatistics._id
    }
    
    var gamesPlayed: Int
    {
        return nhlPlayerStatistics.gamesPlayed
    }
    
    var goals: Int
    {
        return nhlPlayerStatistics.goals
    }
    
    var assists: Int
    {
        return nhlPlayerStatistics.assists
    }
    
    var points: Int
    {
        return nhlPlayerStatistics.points
    }
    
    var hatTricks: Int
    {
        return nhlPlayerStatistics.hatTricks
    }
    
    var powerPlayGoals: Int
    {
        return nhlPlayerStatistics.powerplayGoals
    }
    
    var powerPlayAssists: Int
    {
        return nhlPlayerStatistics.powerplayAssists
    }
    
    var powerPlayPoints: Int
    {
        return nhlPlayerStatistics.powerplayPoints
    }
    
    var shortHandedGoals: Int
    {
        return nhlPlayerStatistics.shortHandedGoals
    }
    
    var shortHandedAssists: Int
    {
        return nhlPlayerStatistics.shortHandedAssists
    }
    
    var shortHandedPoints: Int
    {
        return nhlPlayerStatistics.shortHandedPoints
    }
    
    var gameWinningGoals: Int
    {
        return nhlPlayerStatistics.gameWinningGoals
    }
    
    var gameTyingGoals: Int
    {
        return nhlPlayerStatistics.powerplayAssists
    }
    
    var penalties: Int
    {
        return nhlPlayerStatistics.penalties
    }
    
    var penaltyMinutes: Int
    {
        return nhlPlayerStatistics.penaltyMinutes
    }
    
    var lastUpdated: String
    {
        return nhlPlayerStatistics.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlPlayerStatistics.dateCreated
    }
    
    var plusMinus: Int
    {
        return nhlPlayerStatistics.plusMinus
    }
    
    var shots: Int
    {
        return nhlPlayerStatistics.shots
    }
    
    var faceOffs: Int
    {
        return nhlPlayerStatistics.faceoffs
    }
    
    var shotPercentage: Double
    {
        return nhlPlayerStatistics.shotPercentage
    }
    
    var blockedShots: Int
    {
        return nhlPlayerStatistics.blockedShots
    }
    
    var hits: Int
    {
        return nhlPlayerStatistics.hits
    }
    
    var faceOffWins: Int
    {
        return nhlPlayerStatistics.faceoffWins
    }
    
    var faceOffLosses: Int
    {
        return nhlPlayerStatistics.faceoffLosses
    }
    
    var faceOffPercent: Double
    {
        return nhlPlayerStatistics.faceoffPercent
    }
    
    var wins: Int
    {
        return nhlPlayerStatistics.wins
    }
    
    var losses: Int
    {
        return nhlPlayerStatistics.losses
    }
    
    var overtimeWins: Int
    {
        return nhlPlayerStatistics.overtimeWins
    }
    
    var overtimeLosses: Int
    {
        return nhlPlayerStatistics.overtimeLosses
    }
    
    var goalsAgainst: Int
    {
        return nhlPlayerStatistics.goalsAgainst
    }
    
    var shotsAgainst: Int
    {
        return nhlPlayerStatistics.shotsAgainst
    }
    
    var saves: Int
    {
        return nhlPlayerStatistics.saves
    }
    
    var goalsAgainstAverage: Double
    {
        return nhlPlayerStatistics.goalsAgainstAverage
    }
    
    var savePercentage: Double
    {
        return nhlPlayerStatistics.savePercentage
    }
    
    var shutouts: Int
    {
        return nhlPlayerStatistics.shutouts
    }
    
    var gamesStarted: Int
    {
        return nhlPlayerStatistics.gamesStarted
    }
    
    var creditForGame: Int
    {
        return nhlPlayerStatistics.creditForGame
    }
    
    var minutesPlayed: Int
    {
        return nhlPlayerStatistics.minutesPlayed
    }
    
    var player: LinkingObjects<NHLPlayer>
    {
        return nhlPlayerStatistics.parentPlayer
    }
}
