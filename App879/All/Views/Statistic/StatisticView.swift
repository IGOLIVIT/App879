//
//  StatisticView.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI

struct StatisticView: View {
    
    @StateObject var viewModel = StatisticViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                        }
                        
                    }, label: {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    .opacity(0)
                    .disabled(true)
                    
                    Text("Statistic")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(Color("bg2"))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            VStack(spacing: 6) {
                                
                                Text("VICTORIES")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text("\(viewModel.victories)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            VStack(spacing: 6) {
                                
                                Text("GAMES")
                                    .foregroundColor(Color("prim4"))
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text("\(viewModel.games)")
                                    .foregroundColor(Color("prim4"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            VStack(spacing: 6) {
                                
                                Text("DEFEATS")
                                    .foregroundColor(Color("prim3"))
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text("\(viewModel.defeats)")
                                    .foregroundColor(Color("prim3"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            Rectangle()
                                .fill(Color("prim"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 4)
                            
                            Text("Role")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .semibold))
                            
                            Rectangle()
                                .fill(Color("prim"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 4)
                        }
                        .padding(.vertical, 7)
                        
                        HStack {
                            
                            VStack(spacing: 6) {
                                
                                HStack(spacing: 0) {
                                    
                                    Image("STRENGHT")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    
                                    Text("STRENGHT")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10, weight: .semibold))
                                    
                                }
                                
                                Text("\(viewModel.strenght)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            VStack(spacing: 6) {
                                
                                HStack(spacing: 0) {
                                    
                                    Image("AGILITY")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    
                                    Text("AGILITY")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10, weight: .semibold))
                                    
                                }
                                
                                Text("\(viewModel.agility)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            VStack(spacing: 6) {
                                
                                HStack(spacing: 0) {
                                    
                                    Image("INTELLIGENCE")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    
                                    Text("INTELLIGENCE")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10, weight: .semibold))
                                    
                                }
                                
                                Text("\(viewModel.intelligence)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            Rectangle()
                                .fill(Color("prim"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 4)
                            
                            Text("Position")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .semibold))
                            
                            Rectangle()
                                .fill(Color("prim"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 4)
                        }
                        .padding(.vertical, 7)
                        
                        HStack {
                            
                            HStack {
                                
                                Image("SAVE LANE")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                
                                Text("SAVE LANE")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            Text("\(viewModel.sl)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(width: 120, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            HStack {
                                
                                Image("OFF LANE")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                
                                Text("OFF LANE")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            Text("\(viewModel.ol)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(width: 120, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            HStack {
                                
                                Image("HARD SUPPORT")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                
                                Text("HARD SUPPORT")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            Text("\(viewModel.hs)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(width: 120, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            HStack {
                                
                                Image("SOFT SUPPORT")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                
                                Text("SOFT SUPPORT")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            Text("\(viewModel.ss)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(width: 120, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    StatisticView()
}
