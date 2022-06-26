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
    /*
     
     HOW THE APP WORKS:
     
     When the user starts the app for the first time, there will be no data in the database.
     
     The HockeyInfoDatabaseApp file will set default values in UserDefaults if there are no existing entries.
     
     The user will be presented with the Main Menu screen and will have the ability to make a selection.
     
     If the user selects the Season Settings option, they will be presented with the Settings view and the values will be saved to User Defaults.
     
     If the user selects the Season Schedule view, a task will be triggered to call the SeasonScheduleViewModel.  This will call the DatabaseManager's
     requiresSaving(_ table: Object) method to determine if the sports web service needs to be called to insert/update the table information.
     If so, a loading indicator will display, the web service will be called, the data will be decoded into the JSON object model,
     the appropriate method in the DataConversionHelper class will populate the database objects, the objects will be saved to the database,
     the loading indicator will disappear and the view will be refreshed via the @ObservedResults property wrapper in the view.
     If the table does not need to be reloaded, the view model will simply retrieve the data from the database for display.
     
     In the case of displaying team information, there are several daughter tables that must be populated and their information must be added
     to the NHLTeam table.  As above, the same actions are performed with the NHLTeam view model to determine whether the data requires saving.
     If not, the view model will retrieve the data from the database and the view will be refreshed via the @ObservedResults property wrapper in the view.
     Since the tables are linked, there is no need to make separate queries to the database for each daughter table.
     However, if the data has never been retrieved or a daughter table needs to be updated, the DatabaseManager will provide methods to retrieve the
     data for each table in separate API calls and call the DataConversionHelper to populate each of the database model objects.
     These model objects will be added to the NHLTeam model object and saved which will also save them to their respective tables.
     
     The rest of the tables follow the same pattern.
     
     */
    
    @StateObject private var realmManager = RealmManager.shared
    
    var body: some Scene
    {
        WindowGroup
        {
            VStack
            {
                if let configuration = realmManager.configuration, let realm = realmManager.realm
                {
                    ScheduleView()
                    .environment(\.realmConfiguration, configuration)
                    .environment(\.realm, realm)
                    .onAppear
                    {
                        UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    }
                }
            }
            .task
            {
                try? await realmManager.initialize()
            }
        }
    }
}
