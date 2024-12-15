//
//  Not.swift
//  App879
//
//  Created by IGOR on 02/12/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Don't miss anything")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black).shadow(color: .gray.opacity(0.5), radius: 15))
                })
                .padding(.horizontal)
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Close")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black).shadow(color: .gray.opacity(0.5), radius: 15))
                })
                .padding()
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Not()
}
