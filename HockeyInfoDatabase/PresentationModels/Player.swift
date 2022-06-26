//
//  Player.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLPlayer database class
struct Player: Identifiable
{
    let nhlPlayer: NHLPlayer
    
    var id: ObjectId
    {
        return nhlPlayer._id
    }
    
    var teamId: Int
    {
        return nhlPlayer.teamId
    }
    
    var playerId: Int
    {
        return nhlPlayer.playerId
    }
    
    var teamAbbreviation: String
    {
        return nhlPlayer.teamAbbreviation
    }
    
    var firstName: String
    {
        return nhlPlayer.firstName
    }
    
    var lastName: String
    {
        return nhlPlayer.lastName
    }
    
    var position: String
    {
        return nhlPlayer.position
    }
    
    var jerseyNumber: String
    {
        return nhlPlayer.jerseyNumber
    }
    
    var height: String
    {
        return nhlPlayer.height
    }
    
    var weight: String
    {
        return nhlPlayer.weight
    }
    
    var birthDate: String
    {
        return nhlPlayer.birthDate
    }
    
    var age: String
    {
        return nhlPlayer.age
    }
    
    var birthCity: String
    {
        return nhlPlayer.birthCity
    }
    
    var birthCountry: String
    {
        return nhlPlayer.birthCountry
    }
    
    var imageURL: String
    {
        return nhlPlayer.imageURL
    }
    
    var shoots: String
    {
        return nhlPlayer.shoots
    }
    
    var lastUpdated: String
    {
        return nhlPlayer.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlPlayer.dateCreated
    }
    
    var team: LinkingObjects<NHLTeam>
    {
        return nhlPlayer.parentTeam
    }
    
    var playerStatistics: List<NHLPlayerStatistics>
    {
        return nhlPlayer.playerStatistics
    }
    
    var playerInjuries: List<NHLPlayerInjury>
    {
        return nhlPlayer.playerInjuries
    }
}
