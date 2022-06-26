//
//  RealmManager.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 6/18/22.
//
import Foundation
import RealmSwift

class RealmManager: ObservableObject
{
    let app: App
    
    static let shared = RealmManager()

    @Published var realm: Realm?
    @Published var user: User?
    @Published var configuration: Realm.Configuration?

    private init()
    {
        //  The id of the MongoDB database
        app = App(id: "application-0-miskg")
    }

    @MainActor
    func initialize() async throws
    {
        // Authentication
        user = try await app.login(credentials: Credentials.anonymous)

//        configuration = user?.flexibleSyncConfiguration(initialSubscriptions:
//        {
//            subs in
//
//            // Check to see if the tables exist and add them if needed
//            if let _ = subs.first(named: "all-tasks"), let _ = subs.first(named: "all-notes")
//            {
//                return
//            }
//            else
//            {
//                // subs.append(QuerySubscription<Task>(name: "all-tasks"))
//                // subs.append(QuerySubscription<Note>(name: "all-notes"))
//            }
//
//        }, rerunOnOpen: true)
//
//        realm = try! await Realm(configuration: configuration!, downloadBeforeOpen: .always)
    }
}
