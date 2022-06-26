//
//  NHLTeam.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLTeam : Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamId : Int = 0
    @Persisted var abbreviation : String = Constants.EMPTY_STRING
    @Persisted var city : String = Constants.EMPTY_STRING
    @Persisted var name : String = Constants.EMPTY_STRING
    @Persisted var division : String = Constants.EMPTY_STRING
    @Persisted var conference : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    @Persisted var standings = NHLTeamStandings()
    @Persisted var statistics = NHLTeamStatistics()
    
    @Persisted var players = List<NHLPlayer>()
    @Persisted var schedules = List<NHLScheduledGame>()
    @Persisted var playerInjuries = List<NHLPlayerInjury>()
    @Persisted var gameLogs = List<NHLGameLog>()
    
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
