//
//  HomeView.swift
//  Restart
//
//  Created by Mahesh Yakami on 07/04/2023.
//

import SwiftUI

struct HomeView: View {
    // MARK: Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    // MARK: Body
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: 20) {
                Spacer()
                // MARK: Header

                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35: -35)
                        .animation(.easeInOut(duration: 3).repeatForever(), value: isAnimating)
                }
                
                
                // MARK: Center
                Text("The time that leads to mastery is dependent on the intensity of our color")
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                // MARK: Footer
                Spacer()
                
                Button {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                    
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .padding()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
