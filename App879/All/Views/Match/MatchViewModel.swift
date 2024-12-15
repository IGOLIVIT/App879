//
//  MatchViewModel.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI
import CoreData

final class MatchViewModel: ObservableObject {
    
    @AppStorage("games") var games: Int = 0
    @AppStorage("defeats") var defeats: Int = 0
    @AppStorage("victories") var victories: Int = 0
    
    @AppStorage("strenght") var strenght: Int = 0
    @AppStorage("agility") var agility: Int = 0
    @AppStorage("intelligence") var intelligence: Int = 0
    
    @AppStorage("sl") var sl: Int = 0
    @AppStorage("ol") var ol: Int = 0
    @AppStorage("hs") var hs: Int = 0
    @AppStorage("ss") var ss: Int = 0

    @Published var heroes: [String] = ["Abaddon", "Alchemist", "Axe", "Beastmaster", "Brewmaster", "Bristleback", "Clockwerk", "Doom", "Huskar", "Kunkka", "Lycan", "Magnus", "Marci", "Mars", "Phoenix", "Pudge", "Slardar", "Sven", "Tiny", "Tusk"]
    @Published var curHero: String = ""
    
    @Published var positions: [String] = ["SAVE LANE", "OFF LANE", "HARD SUPPORT", "SOFT SUPPORT"]
    @Published var curPos: String = ""
    
    @Published var roles: [String] = ["STRENGHT", "AGILITY", "INTELLIGENCE"]
    @Published var curRole: String = "STRENGHT"
    
    @Published var finishes: [String] = ["VICTORY", "DEFEAT"]
    @Published var curFinish: String = "VICTORY"

    @Published var types: [String] = ["ALL PICK", "RANKED"]
    @Published var currentType = "ALL PICK"
    @Published var typeForAdd = "ALL PICK"
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var mCat: String = ""
    @Published var mSum: String = ""
    @Published var mDate: Date = Date()
    @Published var mK1: String = ""
    @Published var mK2: String = ""
    @Published var mK3: String = ""
    @Published var mHero: String = ""
    @Published var mRole: String = ""
    @Published var mPos: String = ""

    @Published var matches: [MatchModel] = []
    @Published var selectedMatch: MatchModel?

    func addMatch() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MatchModel", into: context) as! MatchModel

        loan.mCat = mCat
        loan.mSum = mSum
        loan.mDate = mDate
        loan.mK1 = mK1
        loan.mK2 = mK2
        loan.mK3 = mK3
        loan.mHero = mHero
        loan.mRole = mRole
        loan.mPos = mPos

        CoreDataStack.shared.saveContext()
    }

    func fetchMatches() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchModel>(entityName: "MatchModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.matches = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.matches = []
        }
    }
}
