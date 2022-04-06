//
//  NHLScheduledGame.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 1/20/22.
//
import Foundation

struct NHLScheduledGame: Identifiable
{
    let id = UUID()
    var gameId: Int = 0
    var dateString = Constants.EMPTY_STRING
    var timeString = Constants.EMPTY_STRING
    var homeTeam = Constants.EMPTY_STRING
    var awayTeam = Constants.EMPTY_STRING
    var venue = Constants.EMPTY_STRING
}
