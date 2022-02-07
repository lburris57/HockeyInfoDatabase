//
//  NHLPeriodScoringData.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLPeriodScoringData: Object
{
    @Persisted(primaryKey: true) var id : String = UUID().uuidString
    @Persisted var gameId : Int = 0
    @Persisted var periodNumber : Int = 0
    @Persisted var teamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var periodSecondsElapsed: Int = 0
    @Persisted var playDescription: String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "periodScoringList") var parentScoringSummary : LinkingObjects<NHLScoringSummary>
}
