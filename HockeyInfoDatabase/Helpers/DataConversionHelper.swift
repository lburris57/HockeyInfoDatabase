//
//  DataConversionHelper.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation

struct DataConversionHelper
{
    static func convertSeasonToNHLScheduledGames(_ seasonalGames: SeasonalGames) -> [NHLScheduledGame]
    {
        var scheduledGames = [NHLScheduledGame]()
        
        let dateCreated = TimeAndDateUtils.getCurrentDateAsString()
        let lastUpdated = TimeAndDateUtils.getDateAsString(seasonalGames.lastUpdatedOn)
        
        let games = seasonalGames.games
        
        for game in games
        {
            let scheduledGame = NHLScheduledGame()
            
            scheduledGame.dateCreated = dateCreated
            scheduledGame.lastUpdatedOn = lastUpdated
            scheduledGame.id = String(game.schedule.id)
            scheduledGame.date = TimeAndDateUtils.getDateAsString(game.schedule.startTime)
            scheduledGame.time = TimeAndDateUtils.getTimeFromDate(game.schedule.startTime)
            scheduledGame.homeTeam = game.schedule.homeTeam.abbreviation
            scheduledGame.awayTeam = game.schedule.awayTeam.abbreviation
            scheduledGame.homeShotsTotal = game.score.homeShotsTotal ?? 0
            scheduledGame.awayShotsTotal = game.score.awayShotsTotal ?? 0
            scheduledGame.homeScoreTotal = game.score.homeScoreTotal ?? 0
            scheduledGame.awayScoreTotal = game.score.awayScoreTotal ?? 0
            scheduledGame.venue = game.schedule.venue.name
            scheduledGame.currentPeriod = game.score.currentPeriod ?? 0
            scheduledGame.currentTimeRemaining = game.score.currentPeriodSecondsRemaining ?? 0
            scheduledGame.numberOfPeriods = game.score.periods.count
            scheduledGame.playedStatus = game.schedule.playedStatus
            scheduledGame.scheduleStatus = game.schedule.scheduleStatus
            
            scheduledGames.append(scheduledGame)
        }
        
        return scheduledGames
    }
}
