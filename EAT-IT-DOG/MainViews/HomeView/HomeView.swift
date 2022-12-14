/// Home View Interface
/// Created by Mercen on 2022/09/29.


import SwiftUI

// MARK: - Home View
struct HomeView: View {

    /// Static Variables
    private let category: [[String]] = [["유제품", "간식", "육류"],
                                        ["채소", "인스턴트", "해산물"],
                                        ["음료", "조미료", "과일"]]
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 40) {
                
                // MARK: - Banner
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
                
                // MARK: - Category Plate
                VStack(spacing: 0) {
                    ForEach(category, id: \.self) { line in
                        HStack(spacing: 0) {
                            ForEach(line, id: \.self) { row in
                                Button(action: {
                                    touch()
                                }) {
                                    VStack(spacing: 13) {
                                        Image(row)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .if(row == "유제품") {
                                                $0.padding(.leading, 8)
                                            }
                                        Text(row)
                                            .foregroundColor(.basics)
                                    }
                                }
                                .frame(width: 101, height: 120)
                                .buttonStyle(ScaleButtonStyle())
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
        .customBackground()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
