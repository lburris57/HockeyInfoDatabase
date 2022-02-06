//
//  Team.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/30/22.
//
import SwiftUI

struct Team : Identifiable
{
    var id = UUID()
    var abbreviation : String = Constants.EMPTY_STRING
    var city : String = Constants.EMPTY_STRING
    var name : String = Constants.EMPTY_STRING
    var division : String = Constants.EMPTY_STRING
    var conference : String = Constants.EMPTY_STRING
}

extension Team
{
    static func allTeams() -> [Team]
    {
        return[
            Team(abbreviation: "ANA", city: "Anaheim", name: "Ducks", division: "Pacific", conference: "Western"),
            Team(abbreviation: "ARI", city: "Arizona", name: "Coyotes", division: "Central", conference: "Western"),
            Team(abbreviation: "BOS", city: "Boston", name: "Bruins", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "BUF", city: "Buffalo", name: "Sabres", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "CGY", city: "Calgary", name: "Flames", division: "Pacific", conference: "Western"),
            Team(abbreviation: "CAR", city: "Carolina", name: "Hurricanes", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "CHI", city: "Chicago", name: "Blackhawks", division: "Central", conference: "Western"),
            Team(abbreviation: "COL", city: "Colorado", name: "Avalanche", division: "Central", conference: "Western"),
            Team(abbreviation: "CBJ", city: "Columbus", name: "Blue Jackets", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "DAL", city: "Dallas", name: "Stars", division: "Central", conference: "Western"),
            Team(abbreviation: "DET", city: "Detroit", name: "Red Wings", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "EDM", city: "Edmonton", name: "Oilers", division: "Pacific", conference: "Western"),
            Team(abbreviation: "FLO", city: "Florida", name: "Panthers", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "LAK", city: "Los Angeles", name: "Kings", division: "Pacific", conference: "Western"),
            Team(abbreviation: "MIN", city: "Minnesota", name: "Wild", division: "Central", conference: "Western"),
            Team(abbreviation: "MTL", city: "Montreal", name: "Canadiens", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "NSH", city: "Nashville", name: "Predators", division: "Central", conference: "Western"),
            Team(abbreviation: "NJD", city: "New Jersey", name: "Devils", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "NYI", city: "New York", name: "Islanders", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "NYR", city: "New York", name: "Rangers", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "OTT", city: "Ottawa", name: "Senators", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "PHI", city: "Philadelphia", name: "Flyers", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "PIT", city: "Pittsburgh", name: "Penguins", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "SEA", city: "Seattle", name: "Kraken", division: "Pacific", conference: "Western"),
            Team(abbreviation: "SJS", city: "San Jose", name: "Sharks", division: "Pacific", conference: "Western"),
            Team(abbreviation: "STL", city: "St Louis", name: "Blues", division: "Central", conference: "Western"),
            Team(abbreviation: "TBL", city: "Tampa Bay", name: "Lightning", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "TOR", city: "Toronto", name: "Maple Leafs", division: "Atlantic", conference: "Eastern"),
            Team(abbreviation: "VAN", city: "Vancouver", name: "Canucks", division: "Pacific", conference: "Western"),
            Team(abbreviation: "VGK", city: "Vegas", name: "Golden Knights", division: "Pacific", conference: "Western"),
            Team(abbreviation: "WSH", city: "Washington", name: "Capitals", division: "Metropolitan", conference: "Eastern"),
            Team(abbreviation: "WPJ", city: "Winnipeg", name: "Jets", division: "Central", conference: "Western")
        ]
    }
    
    static func allEasternConferenceTeams() -> [Team]
    {
        return allTeams().filter({$0.conference == "Eastern"})
    }
    
    static func allWesternConferenceTeams() -> [Team]
    {
        return allTeams().filter({$0.conference == "Western"})
    }
    
    static func allAtlanticDivisionTeams() -> [Team]
    {
        return allTeams().filter({$0.division == "Atlantic"})
    }
    
    static func allMetropolitanDivisionTeams() -> [Team]
    {
        return allTeams().filter({$0.division == "Metropolitan"})
    }
    
    static func allCentralDivisionTeams() -> [Team]
    {
        return allTeams().filter({$0.division == "Central"})
    }
    
    static func allPacificDivisionTeams() -> [Team]
    {
        return allTeams().filter({$0.division == "Pacific"})
    }
}
