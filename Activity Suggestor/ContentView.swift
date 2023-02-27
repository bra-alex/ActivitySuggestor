//
//  ContentView.swift
//  Activity Suggestor
//
//  Created by Don Bouncy on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var ac = ActivityController()
    var body: some View {
        NavigationView{
            ZStack {
                VStack(alignment: .center, spacing: 20) {
                    Spacer()
                    
                    Text(ac.activity?.type.uppercased() ?? "")
                        .font(.title3.bold())
                        .padding(.bottom)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(ac.activity?.activity ?? "")
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 20){
                        HStack {
                            Image(systemName: "person.3")
                            Text(ac.activity?.participants.formatted() ?? "")
                        }
                        .padding(.horizontal)
                        HStack {
                            Image(systemName: "dollarsign")
                            Text(ac.activity?.price.formatted() ?? "")
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
            .toolbar {
                Button {
                    Task{
                        await ac.loadActivity()
                    }
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                .padding()
                .foregroundColor(.black)

            }
        }
        .task {
            await ac.loadActivity()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
