//
//  ContentView.swift
//  Activity Suggestor
//
//  Created by Don Bouncy on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Type")
                    .font(.title3.bold())
                    .padding(.bottom)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Activity")
                    .font(.title.bold())
                Spacer()
                Spacer()
                
                HStack(spacing: 20){
                    HStack {
                        Image(systemName: "person.3")
                        Text("1")
                    }
                    .padding(.horizontal)
                    HStack {
                        Image(systemName: "dollarsign")
                        Text("1")
                    }
                }
                Spacer()
            }
            .padding()
        }
        .padding()
        .frame(width: 400, height: 500)
        .background(
            Rectangle()
                .fill(Color.white)
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 8, x: -8, y: 8)
            
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
