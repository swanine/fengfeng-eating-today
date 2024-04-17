//
//  ContentView.swift
//  fengfeng-eating-today
//
//  Created by swanine on 2023/1/22.
//

import SwiftUI

struct Home: View {
    let food = ["包公鱼", "刀板香", "凤炖牡丹", "符离集烧鸡", "荷叶粉蒸肉", "虎皮毛豆腐","荠菜圆子","青螺炖鸭","清汤白玉饺","清蒸石鸡","问政笋","腌鲜臭鳜鱼","杨梅团子","一品锅","中和汤"
    ]
    @State private var selectedFood: String = "fengfeng"
    
    var body: some View {
        
        VStack(spacing: 30) {
            Image(selectedFood)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
            
            if selectedFood != "fengfeng" {
                Text(selectedFood)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Button(role: .none) {
                selectedFood = food.shuffled().first ?? "fengfeng"
            } label: {
                Text(selectedFood == "fengfeng" ? "告诉我!" : "换一个").frame(width: 200)
                    .frame(width: 240,height: 60)
            }
            .foregroundColor(Color.white)
            .background(Color.pink)
            .cornerRadius(12)
            
            Button(role: .none) {
                selectedFood = "fengfeng"
            } label: {
                Text("我要重选").frame(width: 200)
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
