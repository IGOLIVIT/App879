//
//  TabBar.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim4") : Color.gray)
                            .frame(width: 13, height: 13)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim4") : Color.gray.opacity(0.4))
                            .font(.system(size: 12, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2")))
        .padding()
    }
}

enum Tab: String, CaseIterable {
    
    case Statistic = "Statistic"
    
    case Match = "Match"
    
    case Profile = "Profile"
                
}
