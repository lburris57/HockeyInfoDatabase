//
//  TeamNavLinkView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//

import SwiftUI

struct TeamNavLinkView: View
{
    let team: Team
    
    var body: some View
    {
        NavigationLink(destination: Text(team.city + " " + team.name + " roster goes here..."))
        {
            HStack
            {
                Image(team.abbreviation)
                    .resizable()
                    .frame(width: 30, height: 25)
                    .scaledToFit()
                Text(team.city + " " + team.name)
                
            }
        }
    }
}

struct TeamNavLinkView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TeamNavLinkView(team: TeamViewModel().teams[30])
    }
}
