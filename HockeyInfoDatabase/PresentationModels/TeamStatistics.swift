//
//  TeamStatistics.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLTeamStatistics database class
struct TeamStatistics: Identifiable
{
    let nhlTeamStatistics: NHLTeamStatistics
    
    var id: ObjectId
    {
        return nhlTeamStatistics._id
    }
    
    var abbreviation: String
    {
        return nhlTeamStatistics.abbreviation
    }
    
    var gamesPlayed: Int
    {
        return nhlTeamStatistics.gamesPlayed
    }
    
    var wins: Int
    {
        return nhlTeamStatistics.wins
    }
    
    var losses: Int
    {
        return nhlTeamStatistics.losses
    }
    
    var overtimeWins: Int
    {
        return nhlTeamStatistics.overtimeWins
    }
    
    var overtimeLosses: Int
    {
        return nhlTeamStatistics.overtimeLosses
    }
    
    var points: Int
    {
        return nhlTeamStatistics.points
    }
    
    var powerPlays: Int
    {
        return nhlTeamStatistics.powerPlays
    }
    
    var powerPlayGoals: Int
    {
        return nhlTeamStatistics.powerPlayGoals
    }
    
    var powerPlayPercent: Double
    {
        return nhlTeamStatistics.powerPlayPercent
    }
    
    var penaltyKills: Int
    {
        return nhlTeamStatistics.penaltyKills
    }
    
    var penaltyKillGoalsAllowed: Int
    {
        return nhlTeamStatistics.penaltyKillGoalsAllowed
    }
    
    var penaltyKillPercent: Double
    {
        return nhlTeamStatistics.penaltyKillPercent
    }
    
    var goalsFor: Int
    {
        return nhlTeamStatistics.goalsFor
    }
    
    var goalsAgainst: Int
    {
        return nhlTeamStatistics.goalsAgainst
    }
    
    var shots: Int
    {
        return nhlTeamStatistics.shots
    }
    
    var penaltyMinutes: Int
    {
        return nhlTeamStatistics.penaltyMinutes
    }
    
    var penalties: Int
    {
        return nhlTeamStatistics.penalties
    }
    
    var hits: Int
    {
        return nhlTeamStatistics.hits
    }
    
    var faceOffs: Int
    {
        return nhlTeamStatistics.faceOffs
    }
    
    var faceOffWins: Int
    {
        return nhlTeamStatistics.faceOffWins
    }
    
    var faceOffLosses: Int
    {
        return nhlTeamStatistics.faceOffLosses
    }
    
    var faceOffPercent: Double
    {
        return nhlTeamStatistics.faceOffPercent
    }
    
    var dateCreated: String
    {
        return nhlTeamStatistics.dateCreated
    }
    
    var lastUpdated: String
    {
        return nhlTeamStatistics.lastUpdated
    }
    
    var team: LinkingObjects<NHLTeam>
    {
        return nhlTeamStatistics.parentTeam
    }
}
