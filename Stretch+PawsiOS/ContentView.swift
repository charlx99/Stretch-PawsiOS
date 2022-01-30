//
//  ContentView.swift
//  Stretch+PawsiOS
//
//  Created by Charlotte Lee on 30/1/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor =
            UIColor(named: "Secondary")
    }
    
    let poses = Poses()
        var body: some View {
        NavigationView {
            List(poses.poseData) { pose in
                NavigationLink(destination: DetailView(pose: pose)) {
                    Image(pose.icon)
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text(pose.name)
                        .fontWeight(.medium)
                        .font(.title3)
                        .padding(.leading, 16)
                }
                .padding(4)
                .listRowBackground(Color("Secondary"))
            }.listStyle(.grouped)
        .navigationBarTitle("Stretch + Paws")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
