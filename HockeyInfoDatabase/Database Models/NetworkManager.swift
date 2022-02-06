//
//  NetworkManager.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class NetworkManager
{
    let databaseManager = DatabaseManager()
    
    let today = Date()
    
    let shortDateFormatter = DateFormatter()
    let fullDateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    let dateStringFormatter = DateFormatter()
    
    
    let userId = Constants.USER_ID
    
    //  Create a new Realm database
    let realm = try! Realm()
    
    // MARK: Save methods
    func saveRosters()
    {
        
    }
    
    func saveScoringSummaryByGameId(_ gameId: Int)
    {
        
    }
    
    func saveSchedule()
    {
        
    }
    
    func updateSchedule(for date :Date)
    {
        shortDateFormatter.dateFormat = Constants.SHORT_DATE_FORMAT
    }
    
    func saveStandings()
    {
        
    }
    
    func savePlayerStats()
    {
        
    }
    
    func savePlayerInjuries()
    {
        
    }
    
    func saveGameLogs()
    {
        
    }
    
    // MARK: Update methods
    func updateSchedule()
    {
        
    }
    
    func updateGameLogs()
    {
        
    }
    
    func updatePlayerStatistics()
    {
        
    }
    
    func updateTeamStatistics()
    {
        
    }
}
