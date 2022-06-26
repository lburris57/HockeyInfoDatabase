//
//  NHLGameLog.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLGameLog: Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
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
    @Persisted var homefaceoffWins : Int = 0
    @Persisted var faceoffs : Int = 0
    @Persisted var homefaceoffLosses : Int = 0
    @Persisted var homefaceoffPercent : Double = 0.0
    @Persisted var homepowerplays: Int = 0
    @Persisted var homepowerplayGoals: Int = 0
    @Persisted var homepowerplayPercent: Double = 0.0
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
    @Persisted var awayfaceoffWins : Int = 0
    @Persisted var awayfaceoffLosses : Int = 0
    @Persisted var awayfaceoffPercent : Double = 0.0
    @Persisted var awaypowerplays: Int = 0
    @Persisted var awaypowerplayGoals: Int = 0
    @Persisted var awaypowerplayPercent: Double = 0.0
    @Persisted var awayPenaltyKills: Int = 0
    @Persisted var awayPenaltyKillGoalsAllowed: Int = 0
    @Persisted var awayPenaltyKillPercent: Double = 0.0
    @Persisted var awayGoalsFor: Int = 0
    @Persisted var awayGoalsAgainst: Int = 0
    @Persisted var awayShots: Int = 0
    @Persisted var awayPenalties: Int = 0
    @Persisted var awayPenaltyMinutes: Int = 0
    @Persisted var awayHits: Int = 0
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "gameLogs") var parentTeam : LinkingObjects<NHLTeam>
    
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
