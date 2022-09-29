//
//  HomeView.swift
//  EAT-IT-DOG
//
//  Created by Mercen on 2022/09/29.
//

import SwiftUI

struct HomeView: View {
    
    // State Variable
    @State var searchText: String = ""
    
    // Static Variable
    let category: [[String]] = [["유제품", "간식", "육류"],
                                ["채소", "인스턴트", "해산물"],
                                ["음료", "조미료", "과일"]]
    
    var body: some View {
        VStack(spacing: 40) {
            
            // Search Bar
            HStack(spacing: 0) {
                TextField("", text: $searchText)
                    .placeholder("음식 이름을 검색하세요", when: searchText.isEmpty)
                    .foregroundColor(.basics)
                Spacer()
                Button(action: {
                    
                }) {
                    Image("MiniSearch")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.basics)
                        .frame(width: 28, height: 28)
                }
            }
            .padding([.leading, .trailing], 24)
            .frame(width: 303, height: 60)
            .background(Color.white)
            .roundedCorner(15)
            .padding(.top, 40)
            
            ScrollView {
                
                VStack(spacing: 40) {
                    
                    // Banner
                    VStack(spacing: 0) {
                        Text("강아지가 먹어도 되는\n음식인지 검색해 보세요!")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                        Image("Girl")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding(.bottom, 4)
                    }
                    .frame(width: 303)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color.accentColor, Color.yellow]),
                        startPoint: .top, endPoint: .bottom))
                    .roundedCorner(15)
                    
                    // Category Plate
                    VStack(spacing: 0) {
                        ForEach(category, id: \.self) { i in
                            HStack(spacing: 0) {
                                ForEach(i, id: \.self) { j in
                                    Button(action: {
                                        
                                    }) {
                                        VStack(spacing: 13) {
                                            Image(j)
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .if(j == "유제품") {
                                                    $0.padding(.leading, 8)
                                                }
                                            Text(j)
                                                .foregroundColor(.basics)
                                        }
                                        .frame(width: 101, height: 120)
                                    }
                                }
                            }
                        }
                    }
                    .background(Color.white)
                    .roundedCorner(15)
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 40)
                
            }
        }
        .customBackground()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
