//
//  OnboardingView.swift
//  Restart
//
//  Created by ebpearls on 07/04/2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button("Start") {
                isOnboardingViewActive = false
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
