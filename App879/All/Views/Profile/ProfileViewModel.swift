//
//  ProfileViewModel.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var results: [String] = ["Pending", "Winning", "Refund", "Losing"]
    @Published var curResult: String = ""
    @Published var resForAdd: String = ""

    @AppStorage("Name") var Name: String = ""
    @Published var addName: String = ""
    @AppStorage("MMR") var MMR: String = ""
    @Published var addMMR: String = ""
    @AppStorage("crist") var crist: String = ""
    @Published var addCrist: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isStat: Bool = false

}
