//
//  NHLPlayer.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLPlayer : Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamId : Int = 0
    @Persisted var playerId : Int = 0
    @Persisted var teamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var firstName : String = Constants.EMPTY_STRING
    @Persisted var lastName : String = Constants.EMPTY_STRING
    @Persisted var position : String = Constants.EMPTY_STRING
    @Persisted var jerseyNumber : String = Constants.EMPTY_STRING
    @Persisted var height : String = Constants.EMPTY_STRING
    @Persisted var weight : String = Constants.EMPTY_STRING
    @Persisted var birthDate : String = Constants.EMPTY_STRING
    @Persisted var age : String = Constants.EMPTY_STRING
    @Persisted var birthCity : String = Constants.EMPTY_STRING
    @Persisted var birthCountry : String = Constants.EMPTY_STRING
    @Persisted var imageURL : String = Constants.EMPTY_STRING
    @Persisted var shoots : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    
    @Persisted var playerStatistics = List<NHLPlayerStatistics>()
    @Persisted var playerInjuries = List<NHLPlayerInjury>()
    
    @Persisted(originProperty: "players") var parentTeam : LinkingObjects<NHLTeam>
    
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
