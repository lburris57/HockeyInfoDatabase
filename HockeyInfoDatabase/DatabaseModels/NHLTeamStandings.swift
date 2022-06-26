//
//  NHLTeamStandings.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLTeamStandings: Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamId : Int = 0
    @Persisted var abbreviation : String = Constants.EMPTY_STRING
    @Persisted var conference : String = Constants.EMPTY_STRING
    @Persisted var conferenceRank : Int = 0
    @Persisted var division : String = Constants.EMPTY_STRING
    @Persisted var divisionRank : Int = 0
    @Persisted var gamesPlayed : Int = 0
    @Persisted var wins : Int = 0
    @Persisted var losses : Int = 0
    @Persisted var overtimeLosses : Int = 0
    @Persisted var points : Int = 0
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "standings") var parentTeam : LinkingObjects<NHLTeam>
    
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
