//
//  MainMenuCategory.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class MainMenuCategory: Object
{
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var category : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
}
