//
//  NHLScoringSummary.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NHLScoringSummary: Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var gameId : Int = 0
    @Persisted var playedStatus : String = Constants.EMPTY_STRING
    @Persisted var homeTeamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var awayTeamAbbreviation : String = Constants.EMPTY_STRING
    @Persisted var homeScoreTotal : Int = 0
    @Persisted var awayScoreTotal : Int = 0
    @Persisted var numberOfPeriods : Int = 0
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
    @Persisted var lastUpdated: String = Constants.EMPTY_STRING

    @Persisted var periodScoringList = List<NHLPeriodScoringData>()
    
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
