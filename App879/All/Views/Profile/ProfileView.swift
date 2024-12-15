//
//  ProfileView.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    
                    Text("Profile")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(Color("bg2"))
                
                VStack(spacing: 14) {
                    
                    if viewModel.Name.isEmpty {
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                    } else {
                        
                        Text("\(viewModel.Name)")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                    }
                    
                    Text("\(viewModel.MMR) MMR")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 22, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    HStack {
                        
                        Image("romb")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        
                        Text("\(viewModel.crist)")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 22, weight: .bold))
                    }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.black).shadow(color: .white.opacity(0.4), radius: 8))
                .padding()
            
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 9) {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("bg"))
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(2)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(.white))
                                
                                Text("Rate app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 65)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg3")))
                        })
                        
                        Button(action: {}, label: {
                            
                            VStack(spacing: 9) {
                                
                                Image(systemName: "folder.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 65)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg3")))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isStat = true
                            }
                            
                        }, label: {
                            
                            VStack(spacing: 9) {

                                Text("Watch statistic")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 65)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                        })
                        .padding(.top, 30)
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddProfile(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isStat, content: {
            
            StatisticView()
        })
    }
}

#Preview {
    ProfileView()
}
