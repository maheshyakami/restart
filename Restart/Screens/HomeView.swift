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
    var body: some View {
        VStack(spacing: 20) {
            // MARK: Header
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
            }
            
            
            // MARK: Center
            Text("The time that leads to mastery is dependent on the intensity of our color")
                .font(.title3)
                .foregroundColor(.secondary)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            
            
            // MARK: Footer
            Spacer()
            
            Button {
                isOnboardingViewActive = true
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
