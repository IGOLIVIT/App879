//
//  AddMatch.swift
//  App879
//
//  Created by IGOR on 05/12/2024.
//

import SwiftUI

struct AddMatch: View {

    @StateObject var viewModel: MatchViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim4"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim4"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Spacer()
                        }
                    })
                    .padding(.bottom)
                    
                    Text("Match")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .background(Color("bg2"))
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Text("Category")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.typeForAdd = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(.white.opacity(viewModel.typeForAdd == index ? 0.2 : 0)))
                                })
                            }
                        }
                        .padding(3)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 6).fill(Color("bg2")))
                        
                        Text("Summary")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        HStack {
                            
                            ForEach(viewModel.finishes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curFinish = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(index == "VICTORY" ? Color("prim") : Color("prim3"))
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(.white.opacity(viewModel.curFinish == index ? 0.2 : 0)))
                                })
                            }
                        }
                        .padding(3)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 6).fill(Color("bg2")))
                        
                        Text("Date")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        DatePicker("", selection: $viewModel.mDate, displayedComponents: .date)
                            .labelsHidden()
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        VStack(spacing: 14) {
                            
                            Text("KDA")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                            
                            HStack {
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.mK1.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.mK1)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.mK2.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.mK2)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.mK3.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.mK3)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.black).shadow(color: .white.opacity(0.4), radius: 8))
                        .padding(5)

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
                        
                        VStack {
                            
                            ForEach(viewModel.positions, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curPos = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                            .padding(.leading, 80)
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.curPos == index ? .white.opacity(0.2) : Color("bg2")))
                                })
                            }
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
                            
                            ForEach(viewModel.roles, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curRole = index
                                    
                                }, label: {
                                    
                                    HStack(spacing: 0) {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .medium))
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.curRole == index ? .white.opacity(0.2) : Color("bg2")))
                                })
                            }
                        }
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.heroes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curHero = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim").opacity(viewModel.curHero == index ? 1 : 0)))
                                })
                            }
                        })
                        
                        Button(action: {
                            
                            viewModel.games += 1
                            
                            if viewModel.curFinish == "VICTORY" {
                                
                                viewModel.victories += 1
                                
                            } else {
                                
                                viewModel.defeats += 1

                            }
                            
                            if viewModel.curRole == "STRENGHT" {
                                
                                viewModel.strenght += 1
                                
                            } else if viewModel.curRole == "AGILITY" {
                                
                                viewModel.agility += 1
                                
                            } else {
                                
                                viewModel.intelligence += 1
                            }
                            
                            if viewModel.curPos == "SAVE LANE" {
                                
                                viewModel.sl += 1
                                
                            } else if viewModel.curPos == "OFF LANE" {
                                
                                viewModel.ol += 1
                                
                            } else if viewModel.curPos == "HARD SUPPORT" {

                                viewModel.hs += 1
                                
                            } else if viewModel.curPos == "SOFT SUPPORT" {

                                viewModel.ss += 1
                                
                            }
                            
                            viewModel.mCat = viewModel.typeForAdd
                            viewModel.mSum = viewModel.curFinish
                            viewModel.mRole = viewModel.curRole
                            viewModel.mPos = viewModel.curPos
                            viewModel.mHero = viewModel.curHero
                            
                            viewModel.addMatch()

                            viewModel.mK1 = ""
                            viewModel.mK2 = ""
                            viewModel.mK3 = ""
                            
                            viewModel.fetchMatches()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            
                        })
                        .opacity(viewModel.curPos.isEmpty || viewModel.curHero.isEmpty || viewModel.curRole.isEmpty || viewModel.curFinish.isEmpty || viewModel.typeForAdd.isEmpty || viewModel.mK1.isEmpty || viewModel.mK2.isEmpty || viewModel.mK3.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.curPos.isEmpty || viewModel.curHero.isEmpty || viewModel.curRole.isEmpty || viewModel.curFinish.isEmpty || viewModel.typeForAdd.isEmpty || viewModel.mK1.isEmpty || viewModel.mK2.isEmpty || viewModel.mK3.isEmpty ? true : false)
                        .padding(.vertical)
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    AddMatch(viewModel: MatchViewModel())
}
