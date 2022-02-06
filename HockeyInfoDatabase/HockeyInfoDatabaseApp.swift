//
//  HockeyInfoDatabaseApp.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/5/22.
//
import SwiftUI

@main
struct HockeyInfoDatabaseApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            DivisionTeamView()
            .onAppear
            {
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
        }
    }
}
