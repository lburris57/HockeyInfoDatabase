//
//  NHLTeam.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLTeam : Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var teamId : Int = 0
    @Persisted var abbreviation : String = Constants.EMPTY_STRING
    @Persisted var city : String = Constants.EMPTY_STRING
    @Persisted var name : String = Constants.EMPTY_STRING
    @Persisted var division : String = Constants.EMPTY_STRING
    @Persisted var conference : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted var players = List<NHLPlayer>()
    @Persisted var standings = List<TeamStandings>()
    @Persisted var statistics = List<TeamStatistics>()
    @Persisted var schedules = List<NHLScheduledGame>()
    @Persisted var playerInjuries = List<NHLPlayerInjury>()
    @Persisted var gameLogs = List<NHLGameLog>()
}
