//
//  AddProfile.swift
//  App879
//
//  Created by IGOR on 04/12/2024.
//

import SwiftUI

struct AddProfile: View {
    
    @StateObject var viewModel: ProfileViewModel
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
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Spacer()
                        }
                    })
                    .padding(.bottom)

                    Text("Profile")
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
                    
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    ZStack(content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addName.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.black).shadow(color: .white.opacity(0.4), radius: 8))
                .padding()
                .padding(.top)
                
                VStack(spacing: 14) {
                    
                    Text("MMR")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    ZStack(content: {
                        
                        Text("0")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addMMR.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addMMR)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.black).shadow(color: .white.opacity(0.4), radius: 8))
                .padding()
                
                VStack(spacing: 14) {
                    
                    Text("Crystal")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    HStack {
                        
                        Image("romb")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45)
                        
                        ZStack(content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addCrist.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addCrist)
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
                .padding()
                                
                }
                
                Button(action: {
                    
                    viewModel.Name = viewModel.addName
                    viewModel.MMR = viewModel.addMMR
                    viewModel.crist = viewModel.addCrist
                    
                    viewModel.addName = ""
                    viewModel.addMMR = ""
                    viewModel.addCrist = ""
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    VStack(spacing: 9) {

                        Text("Save")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                })
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    AddProfile(viewModel: ProfileViewModel())
}
