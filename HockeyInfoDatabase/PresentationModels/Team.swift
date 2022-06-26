//
//  Team.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/24/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLTeam database class
struct Team: Identifiable
{
    let nhlTeam: NHLTeam
    
    var id: ObjectId
    {
        return nhlTeam._id
    }
    
    var teamId: Int
    {
        return nhlTeam.teamId
    }
    
    var abbreviation: String
    {
        return nhlTeam.abbreviation
    }
    
    var city: String
    {
        return nhlTeam.city
    }
    
    var name: String
    {
        return nhlTeam.name
    }
    
    var division: String
    {
        return nhlTeam.division
    }
    
    var conference: String
    {
        return nhlTeam.conference
    }
    
    var lastUpdated: String
    {
        return nhlTeam.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlTeam.dateCreated
    }
    
    var standings: NHLTeamStandings
    {
        return nhlTeam.standings
    }
    
    var statistics: NHLTeamStatistics
    {
        return nhlTeam.statistics
    }
    
    var players: List<NHLPlayer>
    {
        return nhlTeam.players
    }
    
    var games: List<NHLScheduledGame>
    {
        return nhlTeam.schedules
    }
    
    var playerInjuries: List<NHLPlayerInjury>
    {
        return nhlTeam.playerInjuries
    }
    
    var gameLogs: List<NHLGameLog>
    {
        return nhlTeam.gameLogs
    }
}
