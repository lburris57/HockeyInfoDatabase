//
//  PeriodScoringData.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation
import RealmSwift

//  Presentation layer struct that has computed fields that
//  return the values from the NHLPeriodScoringData database class
struct PeriodScoringData: Identifiable
{
    let nhlPeriodScoringData: NHLPeriodScoringData
    
    var id: ObjectId
    {
        return nhlPeriodScoringData._id
    }
    
    var gameId: Int
    {
        return nhlPeriodScoringData.gameId
    }
    
    var periodNumber: Int
    {
        return nhlPeriodScoringData.periodNumber
    }
    
    var teamAbbreviation: String
    {
        return nhlPeriodScoringData.teamAbbreviation
    }
    
    var periodSecondsElapsed: Int
    {
        return nhlPeriodScoringData.periodSecondsElapsed
    }
    
    var playDescription: String
    {
        return nhlPeriodScoringData.playDescription
    }
    
    var lastUpdated: String
    {
        return nhlPeriodScoringData.lastUpdated
    }
    
    var dateCreated: String
    {
        return nhlPeriodScoringData.dateCreated
    }
    
    var scoringSummary: LinkingObjects<NHLScoringSummary>
    {
        return nhlPeriodScoringData.parentScoringSummary
    }
}
