//
//  OnboardingView.swift
//  Restart
//
//  Created by Mahesh Yakami on 07/04/2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK:  Header
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font (.system(size: 60))
                        .fontWeight (.heavy)
                        .foregroundColor (.white)
                    
                    Text ("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font (.title3)
                    .fontWeight (.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment (.center)
                    .padding(.horizontal,10)
                    
                }
                
                // MARK:  Center
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                
                Spacer()
                // MARK:  Footer
                ZStack {
                    // MARK: Custom button
                    
                    // PARTS OF THE CUSTOM BUTTON
                    // 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL-TO-ACTION (STATIC)
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding()
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        
                        Spacer()
                    }
                    
                }
                .frame(height: 80, alignment: .center)
                .padding()
                
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
