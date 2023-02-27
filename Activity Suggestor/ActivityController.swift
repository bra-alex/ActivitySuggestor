//
//  ActivityController.swift
//  Activity Suggestor
//
//  Created by Don Bouncy on 27/02/2023.
//

import Foundation

struct Activity: Codable{
    let activity: String
    let type: String
    let participants: Int
    let price: Double
}

class ActivityController: ObservableObject{
    @Published var activity: Activity?
    
    func loadActivity() async {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            print("Error")
            return
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            let res = response as! HTTPURLResponse
            
            if res.statusCode == 200{
                if let decodedData = try? JSONDecoder().decode(Activity.self, from: data){
                    activity = decodedData
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
