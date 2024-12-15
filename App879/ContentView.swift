//
//  ContentView.swift
//  App879
//
//  Created by IGOR on 02/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Statistic

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        StatisticView()
                            .tag(Tab.Statistic)
                        
                        MatchView()
                            .tag(Tab.Match)
                        
                        ProfileView()
                            .tag(Tab.Profile)
                        
                    })
                    
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
                VStack {
                    
                    Spacer()
                    
                    TabBar(selectedTab: $current_tab)

                }
                .ignoresSafeArea()
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
