//
//  MainMenuCategory.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import RealmSwift

class MainMenuCategory: Object, Identifiable
{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var category : String = Constants.EMPTY_STRING
    @Persisted var dateCreated: String = Constants.EMPTY_STRING
}
