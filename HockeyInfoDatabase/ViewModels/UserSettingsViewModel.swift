//
//  UserSettingsViewModel.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/21.
//
import SwiftUI
import Combine

final class UserSettingsViewModel: ObservableObject
{
    //  @AppStorage("username") var username: String = "Anonymous"
    
    let userDefaults = UserDefaults.standard
    
    @Published var seasonType = Constants.EMPTY_STRING {didSet {userDefaults.set(self.seasonType, forKey: Constants.SEASON_TYPE)}}
    @Published var season = Constants.EMPTY_STRING {didSet {userDefaults.set(self.season, forKey: Constants.SEASON)}}
    @Published var playoffYear = Constants.EMPTY_STRING {didSet {userDefaults.set(self.playoffYear, forKey: Constants.PLAYOFF_YEAR)}}
    @Published var isPlayoffs = false  {didSet {userDefaults.set(self.isPlayoffs, forKey: Constants.IS_PLAYOFFS)}}
    
    init()
    {
        self.seasonType = userDefaults.string(forKey: Constants.SEASON_TYPE) ?? Constants.REGULAR_SEASON
        self.playoffYear = userDefaults.string(forKey: Constants.PLAYOFF_YEAR) ?? TimeAndDateUtils.getCurrentPlayoffSeason()
        self.season = userDefaults.string(forKey: Constants.SEASON) ?? "2020-2021"
        self.isPlayoffs = userDefaults.bool(forKey: Constants.IS_PLAYOFFS)
    }
}
