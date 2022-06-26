//
//  PlayerInjury.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLPlayerInjury database class
struct PlayerInjury: Identifiable
{
    let nhlPlayerInjury: NHLPlayerInjury
    
    var id: ObjectId
    {
        return nhlPlayerInjury._id
    }
    
    var teamId: Int
    {
        return nhlPlayerInjury.teamId
    }
    
    var playerId: Int
    {
        return nhlPlayerInjury.playerId
    }
    
    var teamAbbreviation: String
    {
        return nhlPlayerInjury.teamAbbreviation
    }
    
    var firstName: String
    {
        return nhlPlayerInjury.firstName
    }
    
    var lastName: String
    {
        return nhlPlayerInjury.lastName
    }
    
    var position: String
    {
        return nhlPlayerInjury.position
    }
    
    var jerseyNumber: String
    {
        return nhlPlayerInjury.jerseyNumber
    }
    
    var injuryDescription: String
    {
        return nhlPlayerInjury.injuryDescription
    }
    
    var playingProbability: String
    {
        return nhlPlayerInjury.playingProbability
    }
    
    var lastUpdated: String
    {
        return nhlPlayerInjury.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlPlayerInjury.dateCreated
    }
    
    var team: LinkingObjects<NHLTeam>
    {
        return nhlPlayerInjury.parentTeam
    }
    
    var player: LinkingObjects<NHLPlayer>
    {
        return nhlPlayerInjury.parentPlayer
    }
}
