//
//  TeamDisplayData.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/25/22.
//
import SwiftUI

struct TeamDisplayData : Identifiable
{
    var id = UUID()
    var abbreviation : String = Constants.EMPTY_STRING
    var city : String = Constants.EMPTY_STRING
    var name : String = Constants.EMPTY_STRING
    var division : String = Constants.EMPTY_STRING
    var conference : String = Constants.EMPTY_STRING
}

extension TeamDisplayData
{
    static func allTeams() -> [TeamDisplayData]
    {
        return[
            TeamDisplayData(abbreviation: "ANA", city: "Anaheim", name: "Ducks", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "ARI", city: "Arizona", name: "Coyotes", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "BOS", city: "Boston", name: "Bruins", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "BUF", city: "Buffalo", name: "Sabres", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "CGY", city: "Calgary", name: "Flames", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "CAR", city: "Carolina", name: "Hurricanes", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "CHI", city: "Chicago", name: "Blackhawks", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "COL", city: "Colorado", name: "Avalanche", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "CBJ", city: "Columbus", name: "Blue Jackets", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "DAL", city: "Dallas", name: "Stars", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "DET", city: "Detroit", name: "Red Wings", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "EDM", city: "Edmonton", name: "Oilers", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "FLO", city: "Florida", name: "Panthers", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "LAK", city: "Los Angeles", name: "Kings", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "MIN", city: "Minnesota", name: "Wild", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "MTL", city: "Montreal", name: "Canadiens", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "NSH", city: "Nashville", name: "Predators", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "NJD", city: "New Jersey", name: "Devils", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "NYI", city: "New York", name: "Islanders", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "NYR", city: "New York", name: "Rangers", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "OTT", city: "Ottawa", name: "Senators", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "PHI", city: "Philadelphia", name: "Flyers", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "PIT", city: "Pittsburgh", name: "Penguins", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "SEA", city: "Seattle", name: "Kraken", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "SJS", city: "San Jose", name: "Sharks", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "STL", city: "St Louis", name: "Blues", division: "Central", conference: "Western"),
            TeamDisplayData(abbreviation: "TBL", city: "Tampa Bay", name: "Lightning", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "TOR", city: "Toronto", name: "Maple Leafs", division: "Atlantic", conference: "Eastern"),
            TeamDisplayData(abbreviation: "VAN", city: "Vancouver", name: "Canucks", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "VGK", city: "Vegas", name: "Golden Knights", division: "Pacific", conference: "Western"),
            TeamDisplayData(abbreviation: "WSH", city: "Washington", name: "Capitals", division: "Metropolitan", conference: "Eastern"),
            TeamDisplayData(abbreviation: "WPJ", city: "Winnipeg", name: "Jets", division: "Central", conference: "Western")
        ]
    }
    
    static func allEasternConferenceTeams() -> [TeamDisplayData]
    {
        return allTeams().filter({$0.conference == "Eastern"})
    }
    
    static func allWesternConferenceTeams() -> [TeamDisplayData]
    {
        return allTeams().filter({$0.conference == "Western"})
    }
    
    static func allAtlanticDivisionTeams() -> [TeamDisplayData]
    {
        return allTeams().filter({$0.division == "Atlantic"})
    }
    
    static func allMetropolitanDivisionTeams() -> [TeamDisplayData]
    {
        return allTeams().filter({$0.division == "Metropolitan"})
    }
    
    static func allCentralDivisionTeams() -> [TeamDisplayData]
    {
        return allTeams().filter({$0.division == "Central"})
    }
    
    static func allPacificDivisionTeams() -> [TeamDisplayData]
    {
        return allTeams().filter({$0.division == "Pacific"})
    }
}
