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
            
            Home()
            
        } titleView: {
        
            Text("Feng")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
            
            
        } logoView: {
            
            //make sure to give exact size of logo frame here...
            Image("feng")
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .frame(width: 128, height: 128)
                .clipShape(Circle())
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
