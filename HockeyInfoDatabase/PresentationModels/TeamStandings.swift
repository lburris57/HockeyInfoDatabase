//
//  TeamStandings.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLTeamStandings database class
struct TeamStandings: Identifiable
{
    let nhlTeamStandings: NHLTeamStandings
    
    var id: ObjectId
    {
        return nhlTeamStandings._id
    }
    
    var abbreviation: String
    {
        return nhlTeamStandings.abbreviation
    }
    
    var conference: String
    {
        return nhlTeamStandings.conference
    }
    
    var conferenceRank: Int
    {
        return nhlTeamStandings.conferenceRank
    }
    
    var division: String
    {
        return nhlTeamStandings.division
    }
    
    var divisionRank: Int
    {
        return nhlTeamStandings.divisionRank
    }
    
    var gamesPlayed: Int
    {
        return nhlTeamStandings.gamesPlayed
    }
    
    var wins: Int
    {
        return nhlTeamStandings.wins
    }
    
    var losses: Int
    {
        return nhlTeamStandings.losses
    }
    
    var overtimeLosses: Int
    {
        return nhlTeamStandings.overtimeLosses
    }
    
    var points: Int
    {
        return nhlTeamStandings.points
    }
    
    var lastUpdated: String
    {
        return nhlTeamStandings.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlTeamStandings.dateCreated
    }
    
    var team: LinkingObjects<NHLTeam>
    {
        return nhlTeamStandings.parentTeam
    }
}
