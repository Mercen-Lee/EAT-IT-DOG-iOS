//
//  LaunchView.swift
//  EAT-IT-DOG
//
//  Created by Mercen on 2022/09/29.
//

import SwiftUI

struct LaunchView: View {
    
    // State Variable
    @State private var animated: Bool = false
    @State private var launched: Bool = false
    
    var body: some View {
        if launched {
            MainView()
        } else {
            
            // Launch Screen
            ZStack {
                Color.accentColor.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("먹어보시개")
                        .font(.system(size: 43))
                        .padding(.bottom)
                    Text("세상의 모든 좋은 음식이\n반려견에게 닿을 때까지")
                        .font(.title)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Image("Dog")
                        .resizable()
                        .frame(width: 235, height: 269)
                        .padding(.leading, 100)
                }
                .foregroundColor(.white)
                .padding(40)
            }
            .transition(.backslide)
            .onAppear {
                animated.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    withAnimation(.easeInOut) {
                        launched.toggle()
                    }
                })
            }
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
