//
//  ScheduledGame.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/20/22.
//
import Foundation

struct ScheduledGame: Identifiable
{
    let id = UUID()
    let gameId: Int = 0
    let dateString = Constants.EMPTY_STRING
    let timeString = Constants.EMPTY_STRING
    let homeTeam = Constants.EMPTY_STRING
    let awayTeam = Constants.EMPTY_STRING
    let venue = Constants.EMPTY_STRING
}
