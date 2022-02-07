//
//  NHLScheduledGame.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLScheduledGame: Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var gameId : Int = 0
    @Persisted var date : String = Constants.EMPTY_STRING
    @Persisted var time : String = Constants.EMPTY_STRING
    @Persisted var homeTeam : String = Constants.EMPTY_STRING
    @Persisted var awayTeam : String = "No games scheduled"
    @Persisted var playedStatus : String = Constants.EMPTY_STRING
    @Persisted var homeScoreTotal : Int = 0
    @Persisted var awayScoreTotal : Int = 0
    @Persisted var numberOfPeriods : Int = 0
    @Persisted var homeShotsTotal : Int = 0
    @Persisted var awayShotsTotal : Int = 0
    @Persisted var scheduleStatus : String = Constants.EMPTY_STRING
    @Persisted var currentTimeRemaining : Int = 0
    @Persisted var currentPeriod : Int = 0
    @Persisted var venue: String = Constants.EMPTY_STRING
    @Persisted var lastUpdatedOn: String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "schedules") var parentTeam : LinkingObjects<NHLTeam>
    
    override init()
    {
        super.init()
        
        if dateCreated == Constants.EMPTY_STRING
        {
            dateCreated = TimeAndDateUtils.getCurrentDateAsString()
        }
    } 
}
