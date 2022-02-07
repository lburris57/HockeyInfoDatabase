//
//  PlayerStatistics.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class PlayerStatistics : Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var playerId : Int = 0
    @Persisted var gamesPlayed: Int = 0
    @Persisted var goals: Int = 0
    @Persisted var assists: Int = 0
    @Persisted var points: Int = 0
    @Persisted var hatTricks: Int = 0
    @Persisted var powerplayGoals: Int = 0
    @Persisted var powerplayAssists: Int = 0
    @Persisted var powerplayPoints: Int = 0
    @Persisted var shortHandedGoals: Int = 0
    @Persisted var shortHandedAssists: Int = 0
    @Persisted var shortHandedPoints: Int = 0
    @Persisted var gameWinningGoals: Int = 0
    @Persisted var gameTyingGoals: Int = 0
    @Persisted var penalties: Int = 0
    @Persisted var penaltyMinutes: Int = 0
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    //  Skater Data
    @Persisted var plusMinus: Int = 0
    @Persisted var shots: Int = 0
    @Persisted var shotPercentage: Double = 0.0
    @Persisted var blockedShots: Int = 0
    @Persisted var hits: Int = 0
    @Persisted var faceoffs: Int = 0
    @Persisted var faceoffWins: Int = 0
    @Persisted var faceoffLosses: Int = 0
    @Persisted var faceoffPercent: Double = 0.0
    
    //  Goaltending data
    @Persisted var wins: Int = 0
    @Persisted var losses: Int = 0
    @Persisted var overtimeWins: Int = 0
    @Persisted var overtimeLosses: Int = 0
    @Persisted var goalsAgainst: Int = 0
    @Persisted var shotsAgainst: Int = 0
    @Persisted var saves: Int = 0
    @Persisted var goalsAgainstAverage: Double = 0.0
    @Persisted var savePercentage: Double = 0.0
    @Persisted var shutouts: Int = 0
    @Persisted var gamesStarted: Int = 0
    @Persisted var creditForGame: Int = 0
    @Persisted var minutesPlayed: Int = 0
    
    @Persisted(originProperty: "playerStatisticsList") var parentPlayer : LinkingObjects<NHLPlayer>
}
