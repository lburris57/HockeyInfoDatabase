//
//  TeamStatistics.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class TeamStatistics : Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var teamId : Int = 0
    @Persisted var abbreviation : String = Constants.EMPTY_STRING
    @Persisted var gamesPlayed: Int = 0
    @Persisted var wins: Int = 0
    @Persisted var losses: Int = 0
    @Persisted var overtimeWins: Int = 0
    @Persisted var overtimeLosses: Int = 0
    @Persisted var points: Int = 0
    @Persisted var powerplays: Int = 0
    @Persisted var powerplayGoals: Int = 0
    @Persisted var powerplayPercent: Double = 0.0
    @Persisted var penaltyKills: Int = 0
    @Persisted var penaltyKillGoalsAllowed: Int = 0
    @Persisted var penaltyKillPercent: Double = 0.0
    @Persisted var goalsFor: Int = 0
    @Persisted var goalsAgainst: Int = 0
    @Persisted var shots: Int = 0
    @Persisted var penalties: Int = 0
    @Persisted var penaltyMinutes: Int = 0
    @Persisted var hits: Int = 0
    @Persisted var faceoffWins: Int = 0
    @Persisted var faceoffLosses: Int = 0
    @Persisted var faceoffPercent: Double = 0.0
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "statistics") var parentTeam : LinkingObjects<NHLTeam>
}
