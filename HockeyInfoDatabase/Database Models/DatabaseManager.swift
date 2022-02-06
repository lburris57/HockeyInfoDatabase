//
//  DatabaseManager.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class DatabaseManager
{
    let fullDateFormatter = DateFormatter()
    
    let today = Date()
    
    //  Create a new Realm database
    let realm = try! Realm()
    
    // MARK: Retrieve Methods
    func retrievePlayerById(_ id: Int) -> NHLPlayer?
    {
        var playerResult: NHLPlayer?
        
        do
        {
            try realm.write
            {
                playerResult = realm.objects(NHLPlayer.self).filter("id ==\(id)").first
            }
        }
        catch
        {
            Log.error("Error retrieving player: \(error.localizedDescription)")
        }
        
        return playerResult
    }
    
    func retrievePlayerStatisticsByPlayerID(_ playerId: Int) -> PlayerStatistics?
    {
        var playerStatisticsResult: PlayerStatistics?
        
        do
        {
            try realm.write
            {
                playerStatisticsResult = realm.objects(PlayerStatistics.self).filter("id ==\(playerId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving player statistics: \(error.localizedDescription)")
        }
        
        return playerStatisticsResult
    }
    
    func retrieveScoringSummaryByGameId(_ gameId: Int) -> NHLScoringSummary?
    {
        var scoringSummaryResult: NHLScoringSummary?
        
        do
        {
            try realm.write
            {
                scoringSummaryResult = realm.objects(NHLScoringSummary.self).filter("id ==\(gameId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving scoring summary: \(error.localizedDescription)")
        }
        
        return NHLScoringSummaryResult
    }
    
    func retrieveGameLogByGameId(gameId: Int) -> NHLGameLog?
    {
        var gameLogResult: NHLGameLog?
        
        do
        {
            try realm.write
            {
                gameLogResult = realm.objects(NHLGameLog.self).filter("id ==\(gameId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving game log: \(error.localizedDescription)")
        }
        
        return gameLogResult
    }
    
    func retrieveStandings() -> Results<TeamStandings>?
    {
        var standingsResult: Results<TeamStandings>?
        
        do
        {
            try realm.write
            {
                standingsResult = realm.objects(TeamStandings.self)
            }
        }
        catch
        {
            Log.error("Error retrieving team standings: \(error.localizedDescription)")
        }
        
        return standingsResult
    }
    
    func retrieveSchedule() -> Results<NHLSchedule>?
    {
        var scheduleResult: Results<NHLSchedule>?
        
        do
        {
            try realm.write
            {
                scheduleResult = realm.objects(NHLSchedule.self)
            }
        }
        catch
        {
            Log.error("Error retrieving schedule: \(error.localizedDescription)")
        }
        
        return scheduleResult
    }
    
    func retrieveAllTeams() -> Results<NHLTeam>?
    {
        var teamResults: Results<NHLTeam>?
        
        do
        {
            try realm.write
            {
                teamResults = realm.objects(NHLTeam.self)
            }
        }
        catch
        {
            Log.error("Error retrieving teams: \(error.localizedDescription)")
        }
        
        return teamResults
    }
    
    func retrieveRosterByTeamId(_ teamId: Int) -> Results<NHLPlayer>?
    {
        var rosterResult: Results<NHLPlayer>?
        
        do
        {
            try realm.write
            {
                rosterResult = realm.objects(NHLPlayer.self).filter("teamId ==\(teamId)")
            }
        }
        catch
        {
            Log.error("Error retrieving roster for team \(TeamManager.getTeamById(teamId)): \(error.localizedDescription)")
        }
        
        return rosterResult
    }
    
    func retrieveTeamById(_ teamId: Int) -> Results<NHLTeam>?
    {
        var teamResult: Results<NHLTeam>?
        
        do
        {
            try realm.write
            {
                teamResult = realm.objects(NHLTeam.self).filter("id ==\(teamId)")
            }
        }
        catch
        {
            Log.error("Error retrieving team information: \(error.localizedDescription)")
        }
        
        return teamResult
    }
    
    func retrieveInjuriesByTeamId(_ teamId: Int) -> Results<NHLPlayerInjury>?
    {
        var injuryResult: Results<NHLPlayerInjury>?
        
        do
        {
            try realm.write
            {
                injuryResult = realm.objects(NHLPlayerInjury.self).filter("teamId ==\(teamId)")
            }
        }
        catch
        {
            Log.error("Error retrieving team injuries: \(error.localizedDescription)")
        }
        
        return injuryResult
    }
    
    func retrieveTeamStatisticsById(_ teamId: Int) -> NHLTeam?
    {
        var team : NHLTeam?
        
        do
        {
            try realm.write
            {
                team = realm.objects(NHLTeam.self).filter("id = \(teamId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving team statistics for \(teamId): \(error.localizedDescription)")
        }
        
        return team
    }
    
    func TeamSchedulesById(_ teamId: Int) -> Results<NHLSchedule>?
    {
        var teamSchedules : Results<NHLSchedule>?
        
        let team = TeamManager.getTeamByID(teamId)
        
        do
        {
            try realm.write
            {
                teamSchedules = realm.objects(NHLSchedule.self).filter("homeTeam = '\(team)' OR awayTeam = '\(team)'")
            }
        }
        catch
        {
            Log.error("Error retrieving team schedule results for \(teamId): \(error.localizedDescription)")
        }
        
        return teamSchedules
    }
    
    // MARK: Requires saving methods
    func mainMenuCategoriesRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(MainMenuCategory.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving category count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func scheduleRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(NHLSchedule.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving schedule count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func teamStandingsRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(TeamStandings.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving team standings count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func playerStatsRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(PlayerStatistics.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving player stats count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func teamRosterRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(NHLPlayer.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving players count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func gameLogRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(NHLGameLog.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving game log count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func saveMainMenuCategories()
    {
        let categories = ["Season Schedule", "Team Information", "Standings", "Scores"]
        
        let categoryList = List<MainMenuCategory>()
        
        let dateString = TimeAndDateUtils.getCurrentDateAsString()
        
        var id = 0
        
        for category in categories
        {
            let mainMenuCategory = MainMenuCategory()
            
            mainMenuCategory.id = id
            mainMenuCategory.category = category
            mainMenuCategory.dateCreated = dateString
            
            id = id + 1
            
            categoryList.append(mainMenuCategory)
        }
        
        do
        {
            Log.info("Saving main menu category data...")
            
            try self.realm.write
            {
                self.realm.add(categoryList)
                
                Log.info("Main menu categories have successfully been added to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving main menu categories to the database: \(error.localizedDescription)")
        }
        
        Log.info(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    // MARK: Retrieve methods
    func retrieveTodaysGames()
    {
        do
        {
            try realm.write
            {
                let scheduledGames = realm.objects(NHLSchedule.self).filter("date = '\(TimeAndDateUtils.getCurrentDateAsString())'")
                
                mainViewController.performSegue(withIdentifier: "displayCalendar", sender: scheduledGames)
            }
        }
        catch
        {
            Log.error("Error retrieving today's games: \(error.localizedDescription)")
        }
    }
    
    func retrieveGames(_ date: Date) -> [Schedule]
    {
        var schedules = [Schedule]()
        
        let dateString = TimeAndDateUtils.getDateAsString(date)
        
        do
        {
            try realm.write
            {
                let scheduledGames = realm.objects(NHLSchedule.self).filter("date = '\(dateString)'")
                
                for scheduledGame in scheduledGames
                {
                    let awayTeam = TeamManager.getFullTeamName(scheduledGame.awayTeam)
                    let homeTeam = TeamManager.getFullTeamName(scheduledGame.homeTeam)
                    let venue = TeamManager.getVenueByTeam(scheduledGame.homeTeam)
                    let startTime = scheduledGame.time
                    
                    let schedule = Schedule(title: "\(awayTeam) @ \(homeTeam)",
                        note: "\(venue)",
                        startTime: "\(startTime)",
                        endTime: "\(startTime)",
                        categoryColor: .black)
                    
                    schedules.append(schedule)
                }
                
                if(schedules.count == 0)
                {
                    let schedule = Schedule(title: "",
                        note: "No games scheduled",
                        startTime: "",
                        endTime: "",
                        categoryColor: .black)
                    
                    schedules.append(schedule)
                }
            }
        }
        catch
        {
            Log.error("Error retrieving scheduled games for \(dateString): \(error.localizedDescription)")
        }
        
        return schedules
    }
    
    func retrieveScoringSummary(for gameId: Int) throws -> NHLScoringSummary?
    {
        var scoringSummaryResult: NHLScoringSummary?
        
        do
        {
            try realm.write
            {
                scoringSummaryResult = realm.objects(NHLScoringSummary.self).filter("id ==\(gameId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving scoring summary: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return scoringSummaryResult
    }
    
    func retrieveScoresAsNHLSchedules(_ date: Date) -> Results<NHLSchedule>
    {
        var scheduledGames : Results<NHLSchedule>?
        
        let dateString = TimeAndDateUtils.getDateAsString(date)
        
        do
        {
            try realm.write
            {
                scheduledGames = realm.objects(NHLSchedule.self).filter("date = '\(dateString)'")
            }
        }
        catch
        {
            Log.error("Error retrieving scheduled games for \(dateString): \(error.localizedDescription)")
        }
        
        return scheduledGames!
    }
    
    func retrieveAllPlayers() -> Results<NHLPlayer>
    {
        var rosterResult: Results<NHLPlayer>?
        
        do
        {
            try realm.write
            {
                rosterResult = realm.objects(NHLPlayer.self)
            }
        }
        catch
        {
            Log.error("Error retrieving all players: \(error.localizedDescription)")
        }
        
        return rosterResult!
    }
    
    func retrieveAllTeams() -> Results<NHLTeam>
    {
        var teamResult: Results<NHLTeam>?
        
        do
        {
            try realm.write
            {
                teamResult = realm.objects(NHLTeam.self)
            }
        }
        catch
        {
            Log.error("Error retrieving all teams: \(error.localizedDescription)")
        }
        
        return teamResult!
    }
    
    func retrieveGameLogForDate(_ date: Date) -> Results<NHLGameLog>
    {
        var gameLogResult: Results<NHLGameLog>?
        
        let dateString = TimeAndDateUtils.getDateAsString(date)
        
        do
        {
            try realm.write
            {
                gameLogResult = realm.objects(NHLGameLog.self).filter("date='\(dateString)'")
            }
        }
        catch
        {
            Log.error("Error retrieving game logs for \(dateString): \(error.localizedDescription)")
        }
        
        return gameLogResult!
    }
    
    func retrieveMainMenuCategories() -> [MenuCategory]
    {
        var categories = [MenuCategory]()
        
        do
        {
            try realm.write
            {
                let menuCategories = realm.objects(MainMenuCategory.self)
                
                for menuCategory in menuCategories
                {
                    categories.append(MenuCategory(id: menuCategory.id, category: menuCategory.category, dateCreated: menuCategory.dateCreated))
                }
            }
        }
        catch
        {
            Log.error("Error retrieving main menu categories: \(error.localizedDescription)")
        }
        
        return categories
    }
    
    // MARK: Link methods
    func teamTableRequiresLinking() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if let team = realm.objects(NHLTeam.self).filter("id = \(5)").first
                {
                    if(team.players.count == 0 || team.schedules.count == 0 ||
                       team.gameLogs.count == 0 || team.standings.count == 0 ||
                       team.statistics.count == 0)
                    {
                        result = true
                    }
                }
            }
        }
        catch
        {
            Log.error("Error linking teams: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func linkPlayersToTeams()
    {
        //  Get all the teams
        let teamResults = realm.objects(NHLTeam.self)
        
        //  Spin through the teams and retrieve the players based on the team id
        for team in teamResults
        {
            do
            {
                try realm.write
                {
                    //  Get all players for that particular team
                    let playerResults = realm.objects(NHLPlayer.self).filter("teamId ==\(team.id)")
                    
                    for player in playerResults
                    {
                        //  Set the players in the parent team
                        team.players.append(player)
                    }
                    
                    //  Save the team to the database
                    realm.add(team)
                    
                    Log.info("Players have successfully been linked to \(team.name)!")
                }
            }
            catch
            {
                Log.error("Error linking players to teams: \(error.localizedDecription)")
            }
        }
    }
    
    func linkStandingsToTeams()
    {
        //  Get all the teams
        let teamResults = realm.objects(NHLTeam.self)
        
        //  Spin through the teams and retrieve the standings based on the team abbreviation
        for team in teamResults
        {
            do
            {
                try realm.write
                {
                    //  Get all standings for that particular team
                    let standingsResults = realm.objects(TeamStandings.self).filter("abbreviation =='\(team.abbreviation)'")
                    
                    for standings in standingsResults
                    {
                        //  Set the standings in the parent team
                        team.standings.append(standings)
                    }
                    
                    //  Save the team to the database
                    realm.add(team)
                    
                    Log.info("Standings have successfully been linked to \(team.name)!")
                }
            }
            catch
            {
                Log.error("Error linking standings to teams: \(error.localizedDecription)")
            }
        }
    }
    
    func linkStatisticsToTeams()
    {
        //  Get all the teams
        let teamResults = realm.objects(NHLTeam.self)
        
        //  Spin through the teams and retrieve the statistics based on the team abbreviation
        for team in teamResults
        {
            do
            {
                try realm.write
                {
                    //  Get all statistics for that particular team
                    let statisticsResults = realm.objects(TeamStatistics.self).filter("abbreviation =='\(team.abbreviation)'")
                    
                    for statistics in statisticsResults
                    {
                        //  Set the statistics in the parent team
                        team.statistics.append(statistics)
                    }
                    
                    //  Save the team to the database
                    realm.add(team)
                    
                    Log.info("Statistics have successfully been linked to \(team.name)!")
                }
            }
            catch
            {
                Log.error("Error linking statistics to teams: \(error.localizedDecription)")
            }
        }
    }
    
    func linkPlayerInjuriesToTeams()
    {
        //  Get all the teams
        let teamResults = realm.objects(NHLTeam.self)
        
        //  Spin through the teams and retrieve the player injuries based on the team abbreviation
        for team in teamResults
        {
            do
            {
                try realm.write
                {
                    //  Get all player injuries for that particular team
                    let injuryResults = realm.objects(NHLPlayerInjury.self).filter("teamAbbreviation =='\(team.abbreviation)'").sorted(byKeyPath: "playingProbablity", ascending: false)
                    
                    for injuries in injuryResults
                    {
                        //  Set the player injuries in the parent team
                        team.playerInjuries.append(injuries)
                    }
                    
                    //  Save the team to the database
                    realm.add(team)
                    
                    Log.info("Player injuries have successfully been linked to \(team.name)!")
                }
            }
            catch
            {
                Log.error("Error linking player injuries to teams: \(error.localizedDecription)")
            }
        }
    }
    
    func linkSchedulesToTeams()
    {
        //  Get all the teams
        let teamResults = realm.objects(NHLTeam.self)
        
        //  Spin through the teams and retrieve the schedules based on the team abbreviation
        for team in teamResults
        {
            do
            {
                try realm.write
                {
                    //  Get all schedules for that particular team
                    let scheduleResults = realm.objects(NHLSchedule.self).filter("homeTeam =='\(team.abbreviation)' OR " + "awayTeam =='\(team.abbreviation)'")
                    
                    for schedule in scheduleResults
                    {
                        //  Set the schedule in the parent team
                        team.schedules.append(schedule)
                    }
                    
                    //  Save the team to the database
                    realm.add(team)
                    
                    Log.info("Schedules have successfully been linked to \(team.name)!")
                }
            }
            catch
            {
                Log.error("Error linking schedules to teams: \(error.localizedDecription)")
            }
        }
    }
    
    func linkGameLogsToTeams()
    {
        //  Get all the teams
        let teamResults = realm.objects(NHLTeam.self)
        
        //  Spin through the teams and retrieve the schedules based on the team abbreviation
        for team in teamResults
        {
            do
            {
                try realm.write
                {
                    //  Get all game logs for that particular team
                    let gameLogResults = realm.objects(NHLGameLog.self).filter("homeTeamAbbreviation =='\(team.abbreviation)' OR " + "awayTeamAbbreviation =='\(team.abbreviation)'")
                    
                    for gameLog in gameLogResults
                    {
                        //  Set the gameLog in the parent team
                        team.gameLogs.append(gameLog)
                    }
                    
                    //  Save the team to the database
                    realm.add(team)
                    
                    Log.info("Game logs have successfully been linked to \(team.name)!")
                }
            }
            catch
            {
                Log.error("Error linking game logs to teams: \(error.localizedDecription)")
            }
        }
    }
    
    // MARK: Load/Reload methods
    func loadTeamRecords() -> [String:String]
    {
        var records = [String:String]()
        
        do
        {
            try realm.write
            {
                let teamStandings = realm.objects(TeamStandings.self)
                
                for teamStanding in teamStandings
                {
                    let record = String(teamStanding.wins) + "-" + String(teamStanding.losses) + "-" + String(teamStanding.overtimeLosses)
                    
                    records[teamStanding.abbreviation] = record
                }
            }
        }
        catch
        {
            Log.error("Error loading team records: \(error.localizedDecription)")
        }
        
        return records
    }
    
    func tablesRequireReload() -> Bool
    {
        let dateString = TimeAndDateUtils.getCurrentDateAsString()
        
        let playerInjuryResult = realm.objects(NHLPlayerInjury.self).first
        
        let dateCreated = playerInjuryResult?.dateCreated
        
        if dateString != dateCreated
        {
            return true
        }
        
        return false
    }
    
    func deleteTeamLinks()
    {
        do
        {
            try realm.write
            {
                let teamResults = realm.objects(NHLTeam.self)
                
                for team in teamResults
                {
                    team.players.removeAll()
                    team.playerInjuries.removeAll()
                    team.standings.removeAll()
                    team.statistics.removeAll()
                    team.schedules.removeAll()
                    team.gameLogs.removeAll()
                    
                    realm.add(team, update: .modified)
                }
            }
        }
        catch
        {
            Log.error("Error deleting team links: \(error.localizedDecription)")
        }
    }
    
    func deleteScoringSummaryData()
    {
        do
        {
            try realm.write
            {
                let scoringSummaryResults = realm.objects(NHLScoringSummary.self)
                let periodScoringDataResults = realm.objects(NHLPeriodScoringData.self)
                
                realm.delete(scoringSummaryResults)
                realm.delete(periodScoringDataResults)
            }
        }
        catch
        {
            Log.error("Error deleting scoring summary data: \(error.localizedDecription)")
        }
    }
    
    func getLatestDatePlayed() -> String
    {
        let scheduleResult = realm.objects(NHLSchedule.self).filter("playedStatus == '\(PlayedStatusEnum.completed.rawValue)'")
        let sortedScheduleResult = scheduleResult.sorted(byKeyPath: "id", ascending: false)
        
        return sortedScheduleResult[0].date
    }
    
    func getLatestGameLogDate() -> String
    {
        let maxValue =  realm.objects(NHLGameLog.self).max(ofProperty: "id") as Int?
        let gameLogResult = realm.objects(NHLGameLog.self).filter("id == \(maxValue ?? 0)")
        
        return gameLogResult[0].date
    }
}
