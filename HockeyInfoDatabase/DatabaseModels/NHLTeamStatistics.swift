//
//  NHLTeamStatistics.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLTeamStatistics : Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamId : Int = 0
    @Persisted var abbreviation : String = Constants.EMPTY_STRING
    @Persisted var gamesPlayed: Int = 0
    @Persisted var wins: Int = 0
    @Persisted var losses: Int = 0
    @Persisted var overtimeWins: Int = 0
    @Persisted var overtimeLosses: Int = 0
    @Persisted var points: Int = 0
    @Persisted var powerPlays: Int = 0
    @Persisted var powerPlayGoals: Int = 0
    @Persisted var powerPlayPercent: Double = 0.0
    @Persisted var penaltyKills: Int = 0
    @Persisted var penaltyKillGoalsAllowed: Int = 0
    @Persisted var penaltyKillPercent: Double = 0.0
    @Persisted var goalsFor: Int = 0
    @Persisted var goalsAgainst: Int = 0
    @Persisted var shots: Int = 0
    @Persisted var penalties: Int = 0
    @Persisted var penaltyMinutes: Int = 0
    @Persisted var hits: Int = 0
    @Persisted var faceOffs: Int = 0
    @Persisted var faceOffWins: Int = 0
    @Persisted var faceOffLosses: Int = 0
    @Persisted var faceOffPercent: Double = 0.0
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "statistics") var parentTeam : LinkingObjects<NHLTeam>
    
    override init()
    {
        super.init()
        
        if dateCreated == Constants.EMPTY_STRING
        {
            dateCreated = TimeAndDateUtils.getCurrentDateAsString()
        }
        
        if lastUpdated == Constants.EMPTY_STRING
        {
            lastUpdated = TimeAndDateUtils.getCurrentDateAsString()
        }
    } 
}
