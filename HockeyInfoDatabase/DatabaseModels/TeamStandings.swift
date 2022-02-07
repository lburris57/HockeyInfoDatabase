//
//  TeamStandings.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class TeamStandings: Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
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
    
    @Persisted(originProperty: "standings") var parentTeam : LinkingObjects<NHLTeam>
}
