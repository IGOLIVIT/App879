//
//  U1.swift
//  App879
//
//  Created by IGOR on 02/12/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Start your progress")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 50)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
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
    U1()
}
