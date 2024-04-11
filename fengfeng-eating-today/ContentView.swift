//
//  ContentView.swift
//  fengfeng-eating-today
//
//  Created by swanine on 2023/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imageSize:CGSize(width: 128, height: 128)) {
            
            TabView {
                Home()
                    .tabItem {
                        Label("小", systemImage: "1.square.fill")
                    }
                Text("Second Tab")
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("峰")
                    }
            }
            
        } titleView: {
            Text("峰峰今天吃什么")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
            
        } logoView: {
            //make sure to give exact size of logo frame here...
            Image("feng")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
