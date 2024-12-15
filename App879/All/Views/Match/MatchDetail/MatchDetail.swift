//
//  MatchDetail.swift
//  App879
//
//  Created by IGOR on 05/12/2024.
//

import SwiftUI

struct MatchDetail: View {

    @StateObject var viewModel: MatchViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 17, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 17, weight: .medium))
                                
                                Spacer()
                            }
                        })
                        
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
                    }
                    .padding(.bottom)
                    
                    Text(viewModel.selectedMatch?.mSum ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .background(Color("bg2"))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Text("\((viewModel.selectedMatch?.mDate ?? Date()).convertDate(format: "dd.MM.YY"))")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Image(viewModel.selectedMatch?.mHero ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                        
                        HStack {
                            
                            Text("KDA")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 8)
                            
                            Text(viewModel.selectedMatch?.mK1 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 8)
                            
                            Text(viewModel.selectedMatch?.mK2 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 8)
                            
                            Text(viewModel.selectedMatch?.mK3 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        HStack {
                            
                            HStack {
                                
                                Image(viewModel.selectedMatch?.mRole ?? "")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40)
                                
                                Text(viewModel.selectedMatch?.mRole ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            
                            HStack {
                                
                                Image(viewModel.selectedMatch?.mPos ?? "")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40)
                                
                                Text(viewModel.selectedMatch?.mPos ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deleteMatch(withMHero: viewModel.selectedMatch?.mHero ?? "", completion: {
                            
                            viewModel.fetchMatches()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    MatchDetail(viewModel: MatchViewModel())
}
