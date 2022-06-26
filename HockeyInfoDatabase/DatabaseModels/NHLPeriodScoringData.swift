//
//  NHLPeriodScoringData.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLPeriodScoringData: Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var gameId : Int = 0
    @Persisted var periodNumber : Int = 0
    @Persisted var teamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var periodSecondsElapsed: Int = 0
    @Persisted var playDescription: String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING
    
    @Persisted(originProperty: "periodScoringList") var parentScoringSummary : LinkingObjects<NHLScoringSummary>
    
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
