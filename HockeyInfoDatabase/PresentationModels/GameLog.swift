//
//  GameLog.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLGameLog database class
struct GameLog: Identifiable
{
    let nhlGameLog: NHLGameLog
    
    var id: ObjectId
    {
        return nhlGameLog._id
    }
    
    var gameId: Int
    {
        return nhlGameLog.gameId
    }
    
    var date: String
    {
        return nhlGameLog.date
    }
    
    var time: String
    {
        return nhlGameLog.time
    }
    
    var playedStatus: String
    {
        return nhlGameLog.playedStatus
    }
    
    var homeTeamId: Int
    {
        return nhlGameLog.homeTeamId
    }
    
    var homeTeamAbbreviation: String
    {
        return nhlGameLog.homeTeamAbbreviation
    }
    
    var homeWins: Int
    {
        return nhlGameLog.homeWins
    }
    
    var homeLosses: Int
    {
        return nhlGameLog.homeLosses
    }
    
    var homeOvertimeWns: Int
    {
        return nhlGameLog.homeOvertimeWins
    }
    
    var homeOvertimeLosses: Int
    {
        return nhlGameLog.homeOvertimeLosses
    }
    
    var homePoints: Int
    {
        return nhlGameLog.homePoints
    }
    
    var homeFaceOffWins: Int
    {
        return nhlGameLog.homefaceoffWins
    }
    
    var homeFaceOffLosses: Int
    {
        return nhlGameLog.homefaceoffLosses
    }
    
    var homeFaceOffPercent: Double
    {
        return nhlGameLog.homefaceoffPercent
    }
    
    var homepowerplays: Int
    {
        return nhlGameLog.homepowerplays
    }
    
    var homepowerplayGoals: Int
    {
        return nhlGameLog.homepowerplayGoals
    }
    
    var homepowerplayPercent: Double
    {
        return nhlGameLog.homepowerplayPercent
    }
    
    var homePenaltyKills: Int
    {
        return nhlGameLog.homePenaltyKills
    }
    
    var homePenaltyKillGoalsAllowed: Int
    {
        return nhlGameLog.homePenaltyKillGoalsAllowed
    }
    
    var homePenaltyKillPercent: Double
    {
        return nhlGameLog.homePenaltyKillPercent
    }
    
    var homeGoalsFor: Int
    {
        return nhlGameLog.homeGoalsFor
    }
    
    var homeGoalsAgainst: Int
    {
        return nhlGameLog.homeGoalsAgainst
    }
    
    var homeShots: Int
    {
        return nhlGameLog.homePenalties
    }
    
    var homePenalties: Int
    {
        return nhlGameLog.homePenalties
    }
    
    var homePenaltyMinutes: Int
    {
        return nhlGameLog.homePenaltyMinutes
    }
    
    var homeHits: Int
    {
        return nhlGameLog.homeHits
    }
    
    var awayTeamId: Int
    {
        return nhlGameLog.awayTeamId
    }
    
    var awayTeamAbbreviation: String
    {
        return nhlGameLog.awayTeamAbbreviation
    }
    
    var awayWins: Int
    {
        return nhlGameLog.awayWins
    }
    
    var awayLosses: Int
    {
        return nhlGameLog.awayLosses
    }
    
    var awayOvertimeWins: Int
    {
        return nhlGameLog.awayOvertimeWins
    }
    
    var awayOvertimeLosses: Int
    {
        return nhlGameLog.awayOvertimeLosses
    }
    
    var awayPoints: Int
    {
        return nhlGameLog.awayPoints
    }
    
    var awayFaceOffWins: Int
    {
        return nhlGameLog.awayfaceoffWins
    }
    
    var awayFaceOffLosses: Int
    {
        return nhlGameLog.awayfaceoffLosses
    }
    
    var awayFaceOffPercent: Double
    {
        return nhlGameLog.awayfaceoffPercent
    }
    
    var awaypowerplays: Int
    {
        return nhlGameLog.awaypowerplays
    }
    
    var awaypowerplayGoals: Int
    {
        return nhlGameLog.awaypowerplayGoals
    }
    
    var awaypowerplayPercent: Double
    {
        return nhlGameLog.awaypowerplayPercent
    }
    
    var awayPenaltyKills: Int
    {
        return nhlGameLog.awayPenaltyKills
    }
    
    var awayPenaltyKillGoalsAllowed: Int
    {
        return nhlGameLog.awayPenaltyKillGoalsAllowed
    }
    
    var awayPenaltyKillPercent: Double
    {
        return nhlGameLog.awayPenaltyKillPercent
    }
    
    var awayGoalsFor: Int
    {
        return nhlGameLog.awayGoalsFor
    }
    
    var awayGoalsAgainst: Int
    {
        return nhlGameLog.awayGoalsAgainst
    }
    
    var awayShots: Int
    {
        return nhlGameLog.awayShots
    }
    
    var awayPenalties: Int
    {
        return nhlGameLog.awayPenalties
    }
    
    var awayPenaltyMinutes: Int
    {
        return nhlGameLog.awayPenaltyMinutes
    }
    
    var awayHits: Int
    {
        return nhlGameLog.awayHits
    }
    
    var lastUpdated: String
    {
        return nhlGameLog.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlGameLog.dateCreated
    }
    
    var team: LinkingObjects<NHLTeam>
    {
        return nhlGameLog.parentTeam
    }
}
