//
//  NHLGameLog.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLGameLog: Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var gameId : Int = 0
    @Persisted var date : String = Constants.EMPTY_STRING
    @Persisted var time : String = Constants.EMPTY_STRING
    @Persisted var playedStatus : String = Constants.EMPTY_STRING
    @Persisted var homeTeamId : Int = 0
    @Persisted var homeTeamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var homeWins : Int = 0
    @Persisted var homeLosses : Int = 0
    @Persisted var homeOvertimeWins : Int = 0
    @Persisted var homeOvertimeLosses : Int = 0
    @Persisted var homePoints : Int = 0
    @Persisted var homeFaceoffWins : Int = 0
    @Persisted var homeFaceoffLosses : Int = 0
    @Persisted var homeFaceoffPercent : Double = 0.0
    @Persisted var homePowerplays: Int = 0
    @Persisted var homePowerplayGoals: Int = 0
    @Persisted var homePowerplayPercent: Double = 0.0
    @Persisted var homePenaltyKills: Int = 0
    @Persisted var homePenaltyKillGoalsAllowed: Int = 0
    @Persisted var homePenaltyKillPercent: Double = 0.0
    @Persisted var homeGoalsFor: Int = 0
    @Persisted var homeGoalsAgainst: Int = 0
    @Persisted var homeShots: Int = 0
    @Persisted var homePenalties: Int = 0
    @Persisted var homePenaltyMinutes: Int = 0
    @Persisted var homeHits: Int = 0
    @Persisted var awayTeamId : Int = 0
    @Persisted var awayTeamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var awayWins : Int = 0
    @Persisted var awayLosses : Int = 0
    @Persisted var awayOvertimeWins : Int = 0
    @Persisted var awayOvertimeLosses : Int = 0
    @Persisted var awayPoints : Int = 0
    @Persisted var awayFaceoffWins : Int = 0
    @Persisted var awayFaceoffLosses : Int = 0
    @Persisted var awayFaceoffPercent : Double = 0.0
    @Persisted var awayPowerplays: Int = 0
    @Persisted var awayPowerplayGoals: Int = 0
    @Persisted var awayPowerplayPercent: Double = 0.0
    @Persisted var awayPenaltyKills: Int = 0
    @Persisted var awayPenaltyKillGoalsAllowed: Int = 0
    @Persisted var awayPenaltyKillPercent: Double = 0.0
    @Persisted var awayGoalsFor: Int = 0
    @Persisted var awayGoalsAgainst: Int = 0
    @Persisted var awayShots: Int = 0
    @Persisted var awayPenalties: Int = 0
    @Persisted var awayPenaltyMinutes: Int = 0
    @Persisted var awayHits: Int = 0
    @Persisted var lastUpdatedOn: String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "gameLogs") var parentTeam : LinkingObjects<NHLTeam>
}
