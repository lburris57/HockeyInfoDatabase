//
//  DatabaseManager.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class DatabaseManager
{
    let shortDateFormatter = DateFormatter()
    let fullDateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    let dateStringFormatter = DateFormatter()
    
    let today = Date()
    
    //  Create a new Realm database
    let realm = try! Realm()
    
    // MARK: Retrieve Methods
    func retrievePlayerById(_ playerId: Int) throws -> NHLPlayer?
    {
        var player: NHLPlayer?
        
        do
        {
            try realm.write
            {
                player = realm.objects(NHLPlayer.self).filter("id ==\(playerId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving player id \(playerId): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return player
    }
    
    func retrievePlayerStatisticsById(_ playerId: Int) throws -> PlayerStatistics?
    {
        var playerStatistics: PlayerStatistics?
        
        do
        {
            try realm.write
            {
                playerStatistics = realm.objects(PlayerStatistics.self).filter("id ==\(playerId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving statistics for player id \(playerId): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return playerStatistics
    }
    
    func retrieveScoringSummaryByGameId(_ gameId: Int) throws -> NHLScoringSummary?
    {
        var scoringSummary: NHLScoringSummary?
        
        do
        {
            try realm.write
            {
                scoringSummary = realm.objects(NHLScoringSummary.self).filter("id ==\(gameId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving scoring summary for game id \(gameId): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return scoringSummary
    }
    
    func retrieveGameLogByGameId(_ gameId: Int) throws -> NHLGameLog?
    {
        var gameLog: NHLGameLog?
        
        do
        {
            try realm.write
            {
                gameLog = realm.objects(NHLGameLog.self).filter("id ==\(gameId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving game log for game id \(gameId): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return gameLog
    }
    
    func retrieveTeamStandings() throws -> [TeamStandings]
    {
        var teamStandings = [TeamStandings]()
        
        do
        {
            try realm.write
            {
                teamStandings = convertToArray(results: realm.objects(TeamStandings.self))
            }
        }
        catch
        {
            Log.error("Error retrieving team standings: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return teamStandings
    }
    
    func retrieveAllScheduledGames() throws -> [NHLScheduledGame]
    {
        var scheduledGames = [NHLScheduledGame]()
        
        do
        {
            try realm.write
            {
                scheduledGames = convertToArray(results: realm.objects(NHLScheduledGame.self))
            }
        }
        catch
        {
            Log.error("Error retrieving all scheduled games: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return scheduledGames
    }
    
    func retrieveAllTeams() throws -> [NHLTeam]
    {
        var teams = [NHLTeam]()
        
        do
        {
            try realm.write
            {
                teams = convertToArray(results: realm.objects(NHLTeam.self))
            }
        }
        catch
        {
            Log.error("Error retrieving all teams: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return teams
    }
    
    func retrievePlayerRosterByTeamId(_ teamId: Int) throws -> [NHLPlayer]
    {
        var players = [NHLPlayer]()
        
        do
        {
            try realm.write
            {
                players = convertToArray(results: realm.objects(NHLPlayer.self).filter("teamId ==\(teamId)"))
            }
        }
        catch
        {
            Log.error("Error retrieving roster for \(TeamManager.getTeamByID(teamId)): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return players
    }
    
    func retrieveTeamById(_ teamId: Int) throws -> NHLTeam?
    {
        var team: NHLTeam?
        
        do
        {
            try realm.write
            {
                team = realm.objects(NHLTeam.self).filter("id ==\(teamId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving team information for \(TeamManager.getTeamByID(teamId)): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return team
    }
    
    func retrieveTodaysGames() -> [NHLScheduledGame]
    {
        var scheduledGames = [NHLScheduledGame]()
        
        do
        {
            try realm.write
            {
                scheduledGames = convertToArray(results: realm.objects(NHLScheduledGame.self).filter("date = '\(TimeAndDateUtils.getCurrentDateAsString())'"))
            }
        }
        catch
        {
            Log.error("Error retrieving today's games: \(error.localizedDescription)")
        }
        
        return scheduledGames
    }
    
    func retrieveScheduledGamesByDate(_ date: Date) -> [NHLScheduledGame]
    {
        var scheduledGameList = [NHLScheduledGame]()
        
        let dateString = TimeAndDateUtils.getDateAsString(date)
        
        do
        {
            try realm.write
            {
                let scheduledGames = realm.objects(NHLScheduledGame.self).filter("date = '\(dateString)'")
                
                for scheduledGame in scheduledGames
                {
                    let awayTeam = TeamManager.getFullTeamName(scheduledGame.awayTeam)
                    let homeTeam = TeamManager.getFullTeamName(scheduledGame.homeTeam)
                    let venue = TeamManager.getVenueByTeam(scheduledGame.homeTeam)
                    let startTime = scheduledGame.time
                    
                    let schedule = NHLScheduledGame()
                    
                    schedule.awayTeam = awayTeam
                    schedule.homeTeam = homeTeam
                    schedule.venue = venue
                    schedule.time = startTime
                    
                    scheduledGameList.append(schedule)
                }
            }
        }
        catch
        {
            Log.error("Error retrieving scheduled games for \(dateString): \(error.localizedDescription)")
        }
        
        return scheduledGameList
    }
    
    func retrieveScheduledGamesByDateString(_ date: String) -> [NHLScheduledGame]
    {
        var scheduledGameList = [NHLScheduledGame]()
        
        do
        {
            try realm.write
            {
                let scheduledGames = realm.objects(NHLScheduledGame.self).filter("date = '\(date)'")
                
                for scheduledGame in scheduledGames
                {
                    let awayTeam = TeamManager.getFullTeamName(scheduledGame.awayTeam)
                    let homeTeam = TeamManager.getFullTeamName(scheduledGame.homeTeam)
                    let venue = TeamManager.getVenueByTeam(scheduledGame.homeTeam)
                    let startTime = scheduledGame.time
                    
                    let schedule = NHLScheduledGame()
                    
                    schedule.awayTeam = awayTeam
                    schedule.homeTeam = homeTeam
                    schedule.venue = venue
                    schedule.time = startTime
                    
                    scheduledGameList.append(schedule)
                }
            }
        }
        catch
        {
            Log.error("Error retrieving scheduled games for \(date): \(error.localizedDescription)")
        }
        
        return scheduledGameList
    }
    
    func retrieveScoresAsNHLScheduledGames(_ date: Date) -> [NHLScheduledGame]
    {
        var scheduledGames = [NHLScheduledGame]()
        
        let dateString = TimeAndDateUtils.getDateAsString(date)
        
        do
        {
            try realm.write
            {
                scheduledGames = convertToArray(results: realm.objects(NHLScheduledGame.self).filter("date = '\(dateString)'"))
            }
        }
        catch
        {
            Log.error("Error retrieving scheduled games for \(dateString): \(error.localizedDescription)")
        }
        
        return scheduledGames
    }
    
    func retrieveAllPlayers() -> [NHLPlayer]
    {
        var players = [NHLPlayer]()
        
        do
        {
            try realm.write
            {
                players = convertToArray(results: realm.objects(NHLPlayer.self))
            }
        }
        catch
        {
            Log.error("Error retrieving all players: \(error.localizedDescription)")
        }
        
        return players
    }
    
    func retrieveGameLogsForDate(_ date: Date) -> [NHLGameLog]
    {
        var gameLogs = [NHLGameLog]()
        
        let dateString = TimeAndDateUtils.getDateAsString(date)
        
        do
        {
            try realm.write
            {
                gameLogs = convertToArray(results: realm.objects(NHLGameLog.self).filter("date='\(dateString)'"))
            }
        }
        catch
        {
            Log.error("Error retrieving game logs for \(dateString): \(error.localizedDescription)")
        }
        
        return gameLogs
    }
    
    func retrieveMainMenuCategories() -> [MainMenuCategory]
    {
        var categories = [MainMenuCategory]()
        
        do
        {
            try realm.write
            {
                categories = convertToArray(results: realm.objects(MainMenuCategory.self))
            }
        }
        catch
        {
            Log.error("Error retrieving main menu categories: \(error.localizedDescription)")
        }
        
        return categories
    }
    
    func retrieveInjuriesByTeamId(_ teamId: Int) throws -> [NHLPlayerInjury]
    {
        var injuries = [NHLPlayerInjury]()
        
        do
        {
            try realm.write
            {
                injuries = convertToArray(results: realm.objects(NHLPlayerInjury.self).filter("teamId ==\(teamId)"))
            }
        }
        catch
        {
            Log.error("Error retrieving injuries for \(TeamManager.getTeamByID(teamId)): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return injuries
    }
    
    func retrieveTeamStatisticsById(_ teamId: Int) throws -> TeamStatistics?
    {
        var teamStatistics : TeamStatistics?
        
        do
        {
            try realm.write
            {
                teamStatistics = realm.objects(TeamStatistics.self).filter("id = \(teamId)").first
            }
        }
        catch
        {
            Log.error("Error retrieving statistics for \(TeamManager.getTeamByID(teamId)): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return teamStatistics
    }
    
    func retrieveScheduledGamesByTeamId(_ teamId: Int) throws -> [NHLScheduledGame]
    {
        var scheduledGames = [NHLScheduledGame]()
        
        let team = TeamManager.getTeamByID(teamId)
        
        do
        {
            try realm.write
            {
                scheduledGames = convertToArray(results: realm.objects(NHLScheduledGame.self).filter("homeTeam = '\(team)' OR awayTeam = '\(team)'"))
            }
        }
        catch
        {
            Log.error("Error retrieving schedule results for \(TeamManager.getTeamByID(teamId)): \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.readFromDatabase
        }
        
        return scheduledGames
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
            Log.error("Error retrieving menu category count: \(error.localizedDescription)")
        }
        
        return result
    }
    
    func scheduledGamesRequiresSaving() -> Bool
    {
        var result = false
        
        do
        {
            try realm.write
            {
                if realm.objects(NHLScheduledGame.self).count == 0
                {
                    result = true
                }
            }
        }
        catch
        {
            Log.error("Error retrieving scheduled games count: \(error.localizedDescription)")
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
    
    // MARK: Save methods
    func saveMainMenuCategories() throws
    {
        let categories = ["Season Schedule", "Team Information", "Standings", "Scores"]
        
        let categoryList = List<MainMenuCategory>()
        
        let dateString = TimeAndDateUtils.getCurrentDateAsString()
        
        var id = 0
        
        for category in categories
        {
            let mainMenuCategory = MainMenuCategory()
            
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
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func saveScheduledGames(_ scheduledGames: [NHLScheduledGame]) throws
    {
        do
        {
            Log.info("Saving scheduled games...")
            
            try self.realm.write
            {
                self.realm.add(scheduledGames, update: .modified)
                
                Log.info("Scheduled games have successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving scheduled games to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func saveRosters(_ players: [NHLPlayer]) throws
    {
        do
        {
            Log.info("Saving roster players...")
            
            try self.realm.write
            {
                self.realm.add(players, update: .modified)
                
                Log.info("Players have successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving players to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func saveScoringSummary(_ scoringSummary: NHLScoringSummary) throws
    {
        do
        {
            Log.info("Saving scoring summary...")
            
            try self.realm.write
            {
                self.realm.add(scoringSummary, update: .modified)
                
                Log.info("Scoring summary for game id \(scoringSummary.gameId) has successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving scoring summary for game id \(scoringSummary.gameId) to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func saveStandings(_ standings: TeamStandings) throws
    {
        do
        {
            Log.info("Saving team standings...")
            
            try self.realm.write
            {
                self.realm.add(standings, update: .modified)
                
                Log.info("Team standings have successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving team standings to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func savePlayerStats(_ playerStatistics : [PlayerStatistics]) throws
    {
        do
        {
            Log.info("Saving player statistics...")
            
            try self.realm.write
            {
                self.realm.add(playerStatistics, update: .modified)
                
                Log.info("Player statistics have successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving player statistics to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func savePlayerInjuries(_ playerInjuries: [NHLPlayerInjury]) throws
    {
        do
        {
            Log.info("Saving player injuries...")
            
            try self.realm.write
            {
                self.realm.add(playerInjuries, update: .modified)
                
                Log.info("Player injuries have successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving player injuries to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func saveGameLogs(_ gameLogs: [NHLGameLog]) throws
    {
        do
        {
            Log.info("Saving game logs...")
            
            try self.realm.write
            {
                self.realm.add(gameLogs, update: .modified)
                
                Log.info("Game logs have successfully been saved to the database!!")
            }
        }
        catch
        {
            Log.error("Error saving game logs to the database: \(error.localizedDescription)")
            
            throw DatabaseErrorEnum.saveToDatabase
        }
        
        Log.info("\(Realm.Configuration.defaultConfiguration.fileURL!)")
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
                    if(team.players.count == 0 || team.schedules.count == 0)
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
                Log.error("Error linking players to teams: \(error.localizedDescription)")
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
                Log.error("Error linking standings to teams: \(error.localizedDescription)")
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
                Log.error("Error linking statistics to teams: \(error.localizedDescription)")
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
                Log.error("Error linking player injuries to teams: \(error.localizedDescription)")
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
                    let scheduleResults = realm.objects(NHLScheduledGame.self).filter("homeTeam =='\(team.abbreviation)' OR " + "awayTeam =='\(team.abbreviation)'")
                    
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
                Log.error("Error linking schedules to teams: \(error.localizedDescription)")
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
                Log.error("Error linking game logs to teams: \(error.localizedDescription)")
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
            Log.error("Error loading team records: \(error.localizedDescription)")
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
                let teams = realm.objects(NHLTeam.self)
                
                for team in teams
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
            Log.error("Error deleting team links: \(error.localizedDescription)")
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
            Log.error("Error deleting scoring summary data: \(error.localizedDescription)")
        }
    }
    
    func getLatestDatePlayed() -> String
    {
        let scheduleResult = realm.objects(NHLScheduledGame.self).filter("playedStatus == '\(PlayedStatusEnum.completed.rawValue)'")
        let sortedScheduleResult = scheduleResult.sorted(byKeyPath: "id", ascending: false)
        
        return sortedScheduleResult[0].date
    }
    
    func getLatestGameLogDate() -> String
    {
        let maxValue =  realm.objects(NHLGameLog.self).max(ofProperty: "id") as Int?
        let gameLogResult = realm.objects(NHLGameLog.self).filter("id == \(maxValue ?? 0)")
        
        return gameLogResult[0].date
    }
    
    //  Converts a Realm Results<R> object into an array of Realm objects of that type
    private func convertToArray<R>(results: Results<R>) -> [R] where R: Object
    {
        var arrayOfResults: [R] = []
        
        for result in results
        {
            arrayOfResults.append(result)
        }
        
        return arrayOfResults
    }
}
