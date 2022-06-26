//
//  ScheduledGame.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLScheduleGame database class
struct ScheduledGame: Identifiable
{
    let nhlScheduledGame: NHLScheduledGame
    
    var id: ObjectId
    {
        return nhlScheduledGame._id
    }
    
    var gameId: Int
    {
        return nhlScheduledGame.gameId
    }
    
    var date: String
    {
        return nhlScheduledGame.date
    }
    
    var time: String
    {
        return nhlScheduledGame.time
    }
    
    var homeTeam: String
    {
        return nhlScheduledGame.homeTeam
    }
    
    var awayTeam: String
    {
        return nhlScheduledGame.awayTeam
    }
    
    var venue: String
    {
        return nhlScheduledGame.venue
    }
    
    var playedStatus: String
    {
        return nhlScheduledGame.playedStatus
    }
    
    var homeScoreTotal: Int
    {
        return nhlScheduledGame.homeScoreTotal
    }
    
    var awayScoreTotal: Int
    {
        return nhlScheduledGame.awayScoreTotal
    }
    
    var numberOfPeriods: Int
    {
        return nhlScheduledGame.numberOfPeriods
    }
    
    var homeShotsTotal: Int
    {
        return nhlScheduledGame.homeShotsTotal
    }
    
    var awayShotsTotal: Int
    {
        return nhlScheduledGame.awayShotsTotal
    }
    
    var scheduleStatus: String
    {
        return nhlScheduledGame.scheduleStatus
    }
    
    var currentTimeRemaining: Int
    {
        return nhlScheduledGame.currentTimeRemaining
    }
    
    var currentPeriod: Int
    {
        return nhlScheduledGame.currentPeriod
    }
    
    var lastUpdated: String
    {
        return nhlScheduledGame.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlScheduledGame.dateCreated
    }
    
    var team: LinkingObjects<NHLTeam>
    {
        return nhlScheduledGame.parentTeam
    }
    
    var teamVenue: Venue?
    {
        let venues = Venue.allVenues()
        
        for venue in venues
        {
            if venue.imageName == team.first?.abbreviation
            {
                return venue
            }
        }
        
        return nil
    }
}

