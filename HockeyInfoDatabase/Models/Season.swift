//
//  Season.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
/*
struct Season: Codable
{
    let lastUpdatedOn: Date
    let games: [Game]
}

struct Game: Codable
{
    let schedule: Schedule
    let score: Score
}

struct Schedule: Codable
{
    let id: Int
    let startTime: Date
    let awayTeam: AwayTeam
    let homeTeam: HomeTeam
    let venue: Venue
    let venueAllegiance: String
    let scheduleStatus: String
    let originalStartTime: Date?
    let delayedOrPostponedReason: String?
    let playedStatus: String
}

struct AwayTeam: Codable
{
    let id: Int
    let abbreviation: String
}

struct HomeTeam: Codable
{
    let id: Int
    let abbreviation: String
}

struct Venue: Codable
{
    let id: Int
    let name: String
}

struct Official: Codable
{
    let id: Int
    let title: String
    let firstName: String
    let lastName: String
}

struct Score: Codable
{
    let currentPeriod: Int?
    let currentPeriodSecondsRemaining: Int?
    let currentIntermission: Int?
    let awayScoreTotal: Int?
    let awayShotsTotal: Int?
    let homeScoreTotal: Int?
    let homeShotsTotal: Int?
    let periods: [Period]
}

struct Period: Codable
{
    let periodNumber: Int
    let awayScore: Int
    let awayShots: Int?
    let homeScore: Int
    let homeShots: Int?
}

struct HomeVenue: Codable
{
    let id: Int
    let name: String
}

struct VenueReference: Codable
{
    let id: Int
    let name: String
    let city: String
    let country: String
    let geoCoordinates: GeoCoordinate
}

struct GeoCoordinate: Codable
{
    let latitude: Double
    let longitude: Double
}

struct CapacitiesByEventType: Codable
{
    let eventType: String
    let capacity: Int
}

////----------------------------------------------------------------------------------------------------

struct NHLPlayer: Codable
{
    let lastUpdatedOn: Date
    let games: [Game]
}

struct SocialMediaAccount: Codable
{
    let mediaType: String
    let value: String
}

////----------------------------------------------------------------------------------------------------

struct SeasonStanding: Codable
{
    let lastUpdatedOn: Date
    let teams: [Team]
}

struct Team: Codable
{
    // let team: Team
    let stats: Stat
    let overallRank: OverallRank
    let conferenceRank: ConferenceRank
    let divisionRank: DivisionRank
}

struct Stat: Codable
{
    let gamesPlayed: Int
    let standings: Standing
    let faceoffs: Faceoff
    let powerplay: Powerplay
    let miscellaneous: Miscellaneou
}

struct Standing: Codable
{
    let wins: Int
    let losses: Int
    let overtimeWins: Int
    let overtimeLosses: Int
    let shootoutWins: Int
    let shootoutLosses: Int
    let points: Int
    let pointsPercent: Double
}

struct Faceoff: Codable
{
    let faceoffs: Int
    let faceoffWins: Int
    let faceoffLosses: Int
    let faceoffPercent: Double
}

struct Powerplay: Codable
{
    let powerplays: Int
    let powerplayGoals: Int
    let powerplayPercent: Double
    let penaltyKills: Int
    let penaltyKillGoalsAllowed: Int
    let penaltyKillPercent: Double
    let shorthandedGoalsFor: Int
    let shorthandedGoalsAgainst: Int
}

struct Miscellaneou: Codable
{
    let goalsFor: Int
    let goalsAgainst: Int
    let shAttFor: Int
    let shAttAgainst: Int
    let shots: Int
    let shAgainst: Int
    let shMissFor: Int
    let shMissAgainst: Int
    let blockedShots: Int
    let blockedShotsAgainst: Int
    let penalties: Int
    let penaltyMinutes: Int
    let penaltiesDrawn: Int
    let penaltyMinutesDrawn: Int
    let fights: Int
    let hits: Int
    let hitsReceived: Int
    let giveaways: Int
    let takeaways: Int
    let soAttFor: Int
    let soGoalsFor: Int
    let soAttAgainst: Int
    let soGoalsAgainst: Int
}

struct OverallRank: Codable
{
    let rank: Int
    let gamesBack: Double
}

struct ConferenceRank: Codable
{
    let conferenceName: String
    let rank: Int
    let gamesBack: Double
}

struct DivisionRank: Codable
{
    let divisionName: String
    let rank: Int
    let gamesBack: Double
}

struct TeamStatReference: Codable
{
    let category: String
    let fullName: String
    let description: String
    let abbreviation: String
    let type: String
}

////----------------------------------------------------------------------------------------------------

struct DailyGame: Codable
{
    let lastUpdatedOn: Date
    let games: [Game]
}

////----------------------------------------------------------------------------------------------------

struct GameBoxScore: Codable
{
    let lastUpdatedOn: Date
    let game: Game
    let scoring: Scoring
    let stats: Stat
}

struct ScoringPlay: Codable
{
    let periodSecondsElapsed: Int
    let team: Team
    let scoreChange: Int
    let awayScore: Int
    let homeScore: Int
    let playDescription: String
}

struct PlayerStat: Codable
{
    let scoring: Scoring
    let skating: Skating?
    let penalties: Penalty
    let shifts: Shift
    let goaltending: Goaltending?
}

struct Scoring: Codable
{
    let goals: Int
    let assists: Int
    let primaryAssists: Int
    let powerplayPrimaryAssists: Int
    let shorthandedPrimaryAssists: Int
    let secondaryAssists: Int
    let powerplaySecondaryAssists: Int
    let shorthandedSecondaryAssists: Int
    let points: Int
    let hatTricks: Int
    let powerplayGoals: Int
    let powerplayAssists: Int
    let powerplayPoints: Int
    let shorthandedGoals: Int
    let shorthandedAssists: Int
    let shorthandedPoints: Int
    let gameWinningGoals: Int
    let gameTyingGoals: Int
    let overtimeGoals: Int
    let shootoutAttempts: Int
    let shootoutMisses: Int
    let shootoutGoals: Int
    let shootoutGoalPercent: Int
}

struct Skating: Codable
{
    let plusMinus: Int
    let shotAttempts: Int
    let shots: Int
    let shotPercentage: Double
    let blockedShots: Int
    let blockedShotsAgainst: Int
    let missedShots: Int
    let hits: Int
    let hitsReceived: Int
    let giveaways: Int
    let takeaways: Int
    let faceoffs: Int
    let faceoffWins: Int
    let faceoffLosses: Int
    let faceoffPercent: Double
}

struct Penalty: Codable
{
    let penalties: Int
    let penaltyMinutes: Int
    let minorPenalties: Int
    let minorPenaltyMinutes: Int
    let majorPenalties: Int
    let majorPenaltyMinutes: Int
    let doubleMinorPenalties: Int
    let doubleMinorPenaltyMinutes: Int
    let matchPenalties: Int
    let misconductPenalties: Int
    let misconductPenaltyMinutes: Int
    let penaltiesDrawn: Int
    let penaltyMinutesDrawn: Int
    let fights: Int
}

struct Shift: Codable
{
    let shifts: Int
    let evenStrengthShifts: Int
    let powerplayShifts: Int
    let shorthandedShifts: Int
    let timeOnIceSeconds: Int
    let evenStrengthTimeOnIceSeconds: Int
    let powerplayTimeOnIceSeconds: Int
    let shorthandedTimeOnIceSeconds: Int
}

struct Goaltending: Codable
{
    let wins: Int
    let losses: Int
    let overtimeWins: Int
    let overtimeLosses: Int
    let shootoutWins: Int
    let shootoutLosses: Int
    let goalsAgainst: Int
    let evenStrengthGoalsAgainst: Int
    let powerplayGoalsAgainst: Int
    let shorthandedGoalsAgainst: Int
    let shotsAgainst: Int
    let evenStrengthShotsAgainst: Int
    let powerplayShotsAgainst: Int
    let shorthandedShotsAgainst: Int
    let overtimeGoalsAgainst: Int
    let saves: Int
    let evenStrengthSaves: Int
    let powerplaySaves: Int
    let shorthandedSaves: Int
    let goalsAgainstAverage: Double
    let savePercentage: Double
    let shutouts: Int
    let gamesStarted: Int
    let creditForGame: Int
    let shootoutDefences: Int
    let shootoutSaves: Int
    let shootoutSavePercent: Int
    let shootoutGoalsAgainst: Int
    let minutesPlayed: Int
}

struct Player: Codable
{
    let id: Int
    let firstName: String
    let lastName: String
    let primaryPosition: String
    let jerseyNumber: Int
    let currentTeam: CurrentTeam
    let currentRosterStatus: String
    let currentInjury: CurrentInjury?
    let height: String
    let weight: Int
    let birthDate: String
    let age: Int
    let birthCity: String
    let birthCountry: String
    let rookie: Bool
    let handedness: Handedness
    let officialImageSrc: URL?
    let socialMediaAccounts: [SocialMediaAccount]
}

struct CurrentTeam: Codable
{
    let id: Int
    let abbreviation: String
}

struct CurrentInjury: Codable
{
    let description: String
    let playingProbability: String
}

struct Handedness: Codable
{
    let catches: String?
    let shoots: String?
}

struct PlayerStatReference: Codable
{
    let category: String
    let fullName: String
    let description: String
    let abbreviation: String
    let type: String
}*/
