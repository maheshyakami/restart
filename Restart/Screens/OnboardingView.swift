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
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0.0
    @State private var isAnimating: Bool = false
    @State private var imageOffSet: CGSize = .zero
    
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
                .opacity(isAnimating ? 1:0)
                .offset(y: isAnimating ? 0: -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK:  Center
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffSet.width * -1)
                        .blur(radius: abs(imageOffSet.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffSet)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1:0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffSet.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffSet.width / 20)))
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if abs(imageOffSet.width) <= 150 {
                                    imageOffSet = gesture.translation
                                }
                            })
                            .onEnded({ _ in
                                imageOffSet = .zero
                            })
                        )
                        .animation(.easeInOut(duration: 1), value: imageOffSet)
                    
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
                            .frame(width: buttonOffset + 80)
                        
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                }).onEnded({ _ in
                                    withAnimation(Animation.easeOut(duration: 0.3)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                    
                                })
                        )
                        
                        Spacer()
                    }
                    
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1:0)
                .offset(y: isAnimating ? 0: 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            }
            
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
