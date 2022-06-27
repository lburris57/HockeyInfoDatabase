//
//  NetworkManager.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/26/22.
//
import Foundation
import SwiftUI

class NetworkManager
{
    struct TeamTableInfo
    {
        let teamStats: [SeasonalTeamStats]
        let teamStandings: [SeasonStandings]
        let players: [SeasonalPlayers]
        let games: [SeasonalGames]
        let playerInjuries: [PlayerInjuries]
    }
    
    //  Returns the populated model object based on the decoded JSON data retrieved from the URL.
    //  The DateDecodingStrategy and KeyDecodingStrategy have default values.
    static func getJSON<T: Decodable>(urlString: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T
    {
        //  Verify the URL
        guard let url = URL(string: urlString) else
        {
            throw NetworkError.invalidURL
        }
        
        do
        {
            //  Create a request based on the URL
            var request = URLRequest(url: url)
            
            //  Add authentication data to the request
            request.addValue("Basic " + Constants.USER_ID.toBase64()!, forHTTPHeaderField: "Authorization")
            
            //  Make the call to the URL with the request
            let (data, response) = try await URLSession.shared.data(for: request)
            
            //  Verify that the response is valid and the status code 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else
            {
                throw NetworkError.invalidResponseStatus
            }
            
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            
            //  Decode the JSON and return the populated model object
            do
            {
                let decodedData = try decoder.decode(T.self, from: data)
                
                return decodedData
            }
            catch
            {
                throw NetworkError.decodingError(error.localizedDescription)
            }
        }
        catch
        {
            throw NetworkError.dataTaskError(error.localizedDescription)
        }
    }
    
    //  Retrieves information required to populate the NHLTeam and associated child tables
    func retrieveTeamInformationWithTaskGroup() async -> TeamTableInfo
    {
        var teamStats = [SeasonalTeamStats]()
        var teamStandings = [SeasonStandings]()
        var players = [SeasonalPlayers]()
        var games = [SeasonalGames]()
        var playerInjuries = [PlayerInjuries]()
        
        let teamTableInfo: TeamTableInfo = await withThrowingTaskGroup(of: TeamFetchResult.self)
        {
            group -> TeamTableInfo in
            
            //  Fetch teams
            group.addTask
            {
                let url = URL(string: Constants.REGULAR_SEASON_TEAM_STATS_URL)!
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode([SeasonalTeamStats].self, from: data)
                
                // Send back TeamFetchResult.teamsStats with the SeasonalTeamStats array inside
                return .teamStats(result)
            }
            
            //  Fetch team standings
            group.addTask
            {
                let url = URL(string: Constants.REGULAR_SEASON_STANDINGS_URL)!
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode([SeasonStandings].self, from: data)
                
                // Send back TeamFetchResult.teamStandings with the SeasonStandings array inside
                return .teamStandings(result)
            }
            
            //  Fetch team players
            group.addTask
            {
                let url = URL(string: Constants.REGULAR_SEASON_PLAYERS_URL)!
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode([SeasonalPlayers].self, from: data)
                
                // Send back TeamFetchResult.players with the SeasonalPlayers array inside
                return .players(result)
            }
            
            //  Fetch games
            group.addTask
            {
                let url = URL(string: Constants.REGULAR_SEASON_URL)!
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode([SeasonalGames].self, from: data)
                
                // Send back TeamFetchResult.games with the SeasonalGames array inside
                return .games(result)
            }
            
            //  Fetch injuries
            group.addTask
            {
                let url = URL(string: Constants.REGULAR_SEASON_INJURIES_URL)!
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode([PlayerInjuries].self, from: data)
                
                // Send back TeamFetchResult.playerInjuries with the PlayerInjury array inside
                return .playerInjuries(result)
            }
            
            // Read out each value, figure out which case it represents and copy its associated value
            // into the correct variable which will be used to populate the TeamTableInfo object.
            do
            {
                for try await value in group
                {
                    switch value
                    {
                        case .teamStats(let value):
                            teamStats = value
                        case .teamStandings(let value):
                            teamStandings = value
                        case .players(let value):
                            players = value
                        case .games(let value):
                            games = value
                        case .playerInjuries(let value):
                            playerInjuries = value
                    }
                }
            }
            catch
            {
                Log.error("\(error.localizedDescription)")
            }
            
            return TeamTableInfo(teamStats: teamStats, teamStandings: teamStandings, players: players, games: games, playerInjuries: playerInjuries)
        }
        
        // Log the results.
        Log.info("TeamTableInfo has \(teamTableInfo.teamStats.count) team stats, \(teamTableInfo.teamStandings.count) team standings, \(teamTableInfo.players.count) players, \(teamTableInfo.games.count) games and \(teamTableInfo.playerInjuries.count)  player injuries.")
        
        return teamTableInfo
    }
}

    /*

     Task group sports web service async queries:

     1. TeamFetchResult - Retrieves information used to populate the NHLTeam table,
        NHLTeamStandings, NHLTeamStatistics, NHLPlayer, NHLPlayerInjury and NHLScheduledGame
        tables.

     2. PlayerFetchResult - Retrieves information to populate the NHLPlayer table,
        NHLPlayerStatistics and NHLPlayerInjury tables.

     3. ScheduledGameFetchResult - Retrieves information to populate the NHLScheduledGame,
        NHLScoringSummary and NHLPeriodScoringData tables.

     */

    enum TeamFetchResult
    {
        case teamStats([SeasonalTeamStats])
        case teamStandings([SeasonStandings])
        case players([SeasonalPlayers])
        case games([SeasonalGames])
        case playerInjuries([PlayerInjuries])
    }

    enum PlayerFetchResult
    {
        case players([SeasonalPlayers])
        case playerStats(SeasonalPlayerStats)
        case playerInjuries([PlayerInjuries])
    }

    enum ScheduledGameFetchResult
    {
        case games([SeasonalGames])
        case boxScores([GameBoxScore])
    }
    
    enum NetworkError: Error, LocalizedError
    {
        case invalidURL
        case invalidResponseStatus
        case dataTaskError(String)
        case corruptData
        case decodingError(String)

        var errorDescription: String?
        {
            switch self
            {
                case .invalidURL:
                    return NSLocalizedString("The endpoint URL is invalid", comment: "")
                case .invalidResponseStatus:
                    return NSLocalizedString("The network call failed to issue a valid response.", comment: "")
                case let .dataTaskError(string):
                    return string
                case .corruptData:
                    return NSLocalizedString("The retrieved data appears to be corrupt", comment: "")
                case let .decodingError(string):
                    return string
            }
        }
    }



