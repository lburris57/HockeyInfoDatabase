//
//  TeamViewModel.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/31/22.
//
import Foundation

class TeamViewModel
{
    let teams = Team.allTeams()
    let conferences = ["Eastern Conference", "Western Conference"]
    let divisions = ["Atlantic Division", "Metropolitan Division", "Central Division", "Pacific Division"]
    let atlanticDivisionTeams = Team.allAtlanticDivisionTeams()
    let metropolitanDivisionTeams = Team.allMetropolitanDivisionTeams()
    let centralDivisionTeams = Team.allCentralDivisionTeams()
    let pacificDivisionTeams = Team.allPacificDivisionTeams()
}
