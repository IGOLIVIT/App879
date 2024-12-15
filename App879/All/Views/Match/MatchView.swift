//
//  MatchView.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI

struct MatchView: View {
    
    @StateObject var viewModel = MatchViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 12, weight: .medium))
                            .padding(3)
                            .background(RoundedRectangle(cornerRadius: 4).fill(.white))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    .opacity(0)
                    .disabled(true)
                    
                    Text("Match")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(Color("bg2"))
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 6).fill(.white.opacity(viewModel.currentType == index ? 0.2 : 0)))
                        })
                    }
                }
                .padding(3)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 6).fill(Color("bg2")))
                .padding()
                
                if viewModel.matches.isEmpty {
                    
                    VStack {
                        
                        Text("You don't have any active match yet. Add the first one.")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 300)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim"), lineWidth: 3))
                            .padding()
                        
                    }
                    .frame(maxHeight: .infinity)

                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.matches.filter{($0.mCat ?? "") == viewModel.currentType}, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedMatch = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index.mHero ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                        
                                        VStack {
                                            
                                            Text(index.mHero ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 24, weight: .bold))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            HStack {
                                                
                                                Text("\((index.mDate ?? Date()).convertDate(format: "dd.MM.YY"))")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .regular))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 40)
                                                    .background(Rectangle().fill(Color("bg")))
                                                
                                                Text(index.mSum ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 20, weight: .bold))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 40)
                                                    .background(Rectangle().fill(Color("bg")))
                                            }
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                                })
                            }
                        }
                    }
                    .padding()
                }
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add match")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding()
                .padding(.bottom, 60)
            }
        }
        .onAppear {
            
            viewModel.fetchMatches()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddMatch(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            MatchDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    MatchView()
}
