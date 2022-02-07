//
//  NHLPlayerInjury.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLPlayerInjury : Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var teamId : Int = 0
    @Persisted var playerId : Int = 0
    @Persisted var teamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var firstName : String = Constants.EMPTY_STRING
    @Persisted var lastName : String = Constants.EMPTY_STRING
    @Persisted var position : String = Constants.EMPTY_STRING
    @Persisted var jerseyNumber : String = Constants.EMPTY_STRING
    @Persisted var injuryDescription : String = Constants.EMPTY_STRING
    @Persisted var playingProbablity : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "playerInjuries") var parentPlayer : LinkingObjects<NHLPlayer>
    @Persisted(originProperty: "playerInjuries") var parentTeam : LinkingObjects<NHLTeam>
}
