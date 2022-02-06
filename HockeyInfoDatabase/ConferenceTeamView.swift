//
//  ConferenceTeamView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//

import SwiftUI

struct ConferenceTeamView: View
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
                    Section(teamViewModel.conferences[0])
                    {
                        ForEach(teamViewModel.easternConferenceTeams)
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

                    }
                    
                    Section(teamViewModel.conferences[1])
                    {
                        ForEach(teamViewModel.westernConferenceTeams)
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

                    }
                }.listStyle(.plain)
                
            }
            .navigationTitle("Conferences")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConferenceTeamView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceTeamView()
    }
}
