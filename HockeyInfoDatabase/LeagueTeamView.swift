//
//  LeagueTeamView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//

import SwiftUI

struct LeagueTeamView: View
{
    let teamViewModel = TeamViewModel()
    
    var body: some View
    {
        NavigationView
        {
            VStack()
            {
                List
                {
                    ForEach(teamViewModel.teams)
                    {
                        team in
                    
                        NavigationLink(destination: Text(team.city + " " + team.name))
                        {
                            HStack
                            {
                                Image(team.abbreviation)
                                    .resizable()
                                    .frame(width: 40, height: 30)
                                    .scaledToFit()
                                Text(team.city + " " + team.name)
                                
                            }
                        }
                    }

                }.listStyle(.plain)
                
            }
            .navigationTitle("League")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LeagueTeamView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LeagueTeamView()
    }
}
