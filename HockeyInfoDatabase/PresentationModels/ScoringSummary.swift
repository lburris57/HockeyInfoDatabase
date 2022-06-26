//
//  ScoringSummary.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLScoringSummary database class
struct ScoringSummary: Identifiable
{
    let nhlScoringSummary: NHLScoringSummary
    
    var id: ObjectId
    {
        return nhlScoringSummary._id
    }
    
    var gameId: Int
    {
        return nhlScoringSummary.gameId
    }
    
    var playedStatus: String
    {
        return nhlScoringSummary.playedStatus
    }
    
    var homeTeamAbbreviation: String
    {
        return nhlScoringSummary.homeTeamAbbreviation
    }
    
    var awayTeamAbbreviation: String
    {
        return nhlScoringSummary.awayTeamAbbreviation
    }
    
    var homeScoreTotal: Int
    {
        return nhlScoringSummary.homeScoreTotal
    }
    
    var awayScoreTotal: Int
    {
        return nhlScoringSummary.awayScoreTotal
    }
    
    var numberOfPeriods: Int
    {
        return nhlScoringSummary.numberOfPeriods
    }
    
    var lastUpdated: String
    {
        return nhlScoringSummary.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlScoringSummary.dateCreated
    }
    
    var periodScoringList: List<NHLPeriodScoringData>
    {
        return nhlScoringSummary.periodScoringList
    }
}
