//
//  Reviews.swift
//  App879
//
//  Created by IGOR on 02/12/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Rate our app in the appstore")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 32, weight: .bold))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
