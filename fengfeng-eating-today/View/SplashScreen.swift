//
//  SplashScreen.swift
//  fengfeng-eating-today
//
//  Created by swanine on 2023/1/22.
//

import SwiftUI

struct SplashScreen<Content: View, Title: View, Logo: View>: View {
    
    var content: Content
    var titleView: Title
    var logoView: Logo
    
    var imageSize: CGSize
    
    
    init(imageSize: CGSize, @ViewBuilder content: @escaping () -> Content, @ViewBuilder titleView: @escaping() ->Title, logoView: @escaping() ->Logo) {
        
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        
        self.imageSize = imageSize
    }
    
    //Animation Properties
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    
    @Namespace var animation
    
    
    var body: some View {
    
        VStack(spacing: 0) {
            
            ZStack {
                
                Color.purple
                    .ignoresSafeArea()
                
                
                titleView
                    .scaleEffect(endAnimation ? 0.75 : 1)
                    .offset(y: textAnimation ? -5 : 110)
                
                if !endAnimation {
                    
                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                
                
                //moveing right
                HStack {
                    Spacer()
                    
                    if endAnimation {
                        
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: 35, height: 35)
//                            .padding(.trailing)
                            .offset(y: -5)
                    }

                }
                .padding(.horizontal)
               
            }
            // decreasing size when animatuon ended...
            // your own value
            .frame(height: endAnimation ? 69 : nil)
            .zIndex(1)
            
            //HomeView
            content
                .frame(height: endAnimation ? nil : 0)
                .zIndex(0)
            
        }
        .frame(maxHeight:.infinity, alignment: .top)
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                withAnimation(.spring()) {
                    
                    textAnimation.toggle()
                }
                
                //directly ending animatin
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                    
                    endAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    

                }
                
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
