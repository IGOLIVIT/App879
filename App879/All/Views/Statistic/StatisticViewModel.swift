//
//  StatisticViewModel.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI

final class StatisticViewModel: ObservableObject {

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
}

