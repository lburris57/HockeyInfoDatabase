//
//  NHLPlayerInjury.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLPlayerInjury : Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var teamId : Int = 0
    @Persisted var playerId : Int = 0
    @Persisted var teamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var firstName : String = Constants.EMPTY_STRING
    @Persisted var lastName : String = Constants.EMPTY_STRING
    @Persisted var position : String = Constants.EMPTY_STRING
    @Persisted var jerseyNumber : String = Constants.EMPTY_STRING
    @Persisted var injuryDescription : String = Constants.EMPTY_STRING
    @Persisted var playingProbability : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "playerInjuries") var parentPlayer : LinkingObjects<NHLPlayer>
    @Persisted(originProperty: "playerInjuries") var parentTeam : LinkingObjects<NHLTeam>
    
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
