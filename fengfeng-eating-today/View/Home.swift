//
//  ContentView.swift
//  fengfeng-eating-today
//
//  Created by swanine on 2023/1/22.
//

import SwiftUI

struct Home: View {
    let food = ["汉堡", "炸鸡", "蛋挞", "披萨", "奶茶", "火锅", "牛肉面", "爆炒鱿鱼", "椒盐虾", "红烧带鱼", "香辣花甲"]
    @State private var selectedFood: String?
    
    var body: some View {
        
        VStack(spacing: 30) {
            Image("fengfeng")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
            
            Text("峰峰今天吃什么")
                .font(.largeTitle)
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Button(role: .none) {
                selectedFood = food.shuffled().first
            } label: {
                Text(selectedFood == .none ? "告诉我!" : "换一个").frame(width: 200)
                    .frame(width: 240,height: 60)
            }
            .foregroundColor(Color.white)
            .background(Color.pink)
            .cornerRadius(12)
            
            Button(role: .none) {
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }
            .foregroundColor(Color.pink)
            .buttonStyle(.bordered)
        }
        .font(.title)
        .padding()
        .controlSize(.large)
        .animation(.default, value: selectedFood)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//
//  Home.swift
//  fengfeng-eating-today
//
//  Created by swanine on 2023/2/2.
//
