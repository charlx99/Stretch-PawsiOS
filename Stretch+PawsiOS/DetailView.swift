//
//  DetailView.swift
//  Stretch+PawsiOS
//
//  Created by Charlotte Lee on 30/1/22.
//

import SwiftUI

struct DetailView: View {
    let pose: Pose
    @State private var timerOpen = false
    var body: some View {
        ZStack {
            Color("Secondary").ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    Image(pose.icon)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(pose.name)
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Highlight"))
                        .multilineTextAlignment(.center)
                    Text(pose.asana)
                        .font(.system(size: 24))
                        .italic()
                        .fontWeight(.medium)
                    VStack(alignment: .leading, spacing: 20) {
                        Text(pose.description)
                        
                        Text("How to:")
                            .foregroundColor(Color("Highlight"))
                            .fontWeight(.medium)
                        ForEach(pose.steps, id: \.self) { step in
                            Text(step)
                        }
                        Text("Top tip:")
                            .foregroundColor(Color("Highlight"))
                            .fontWeight(.medium)
                        Text(pose.topTip)
                        }
                    }.padding(.horizontal, 24)
                }
            TimerPanelView(timerOpen: $timerOpen)
        } .onTapGesture {
            timerOpen = false
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pose: Pose(
            name: "Downward-Facing Dog",
            asana: "Adho Mukha Shvanasana",
            icon: "Cat_01",
            description:
            "Did someone say dog? Can't we call this a downward-facing cat instead? It's OK – this is a friendly dog, it's not interested in chasing cats. In fact, Downward-Facing Dog is the lynchpin of a yoga asana practice: if you're going to befriend with any of these poses, make sure it's this canine classic.",
            steps: ["From a kneeling position, place your hands shoulder-distance apart and spread your fingers.", "Tuck your toes and lift your hips up towards the ceiling so you create an inverted V shape.", "Balance the weight between hands and feet and think about tilting your tailbone up towards the ceiling.","Send your gaze towards your feet and breath!"],
            topTip: "Bend your knees in order to create more length through the spine." ))
    }
}

struct TimerPanelView: View {
    @Binding var timerOpen: Bool
    var body: some View {
        // If the timer panel is closed, show the timer closed view.
        // If the timer panel is open, show the timer open view.
        
        VStack {
            Spacer()
            VStack {
                timerOpen ? AnyView(TimerOpenView()) :  AnyView(TimerClosedView())
            }
            .foregroundColor(Color("Secondary"))
            .frame(maxWidth: .infinity, maxHeight: timerOpen ? 400 : 80)
            .background(Color("Highlight"))
            .cornerRadius(24)
        }
        .ignoresSafeArea()
        .onTapGesture {
            timerOpen.toggle()
        }
    }
}

struct TimerOpenView: View {
    var body: some View {
        
        VStack {
            Text("Hold The Pose")
                .fontWeight(.bold)
                .font(.system(size:18))

            Spacer()
            Text("Try staying in this pose for 30 seconds, if you need to come out sooner, that’s ok.")
                .multilineTextAlignment(.center)
                .font(.system(size:18))
            Spacer()
            Text("00:30")
                .font(.system(size:96))
            Spacer()
            Button {
                //do something
            } label: {
                Text("START THE TIMER")
                    .fontWeight(.bold)
                    .font(.system(size:18))
            }
            .frame(width: 320, height: 54)
            .background(Color("Secondary"))
            .foregroundColor(Color("Primary"))
            .cornerRadius(32)
        }.padding(24)
    }
}

struct TimerClosedView: View {
    var body: some View {
        Text("TRY IT OUT")
            .fontWeight(.bold)
            .font(.system(size:18))
            .padding(24)
        Spacer()
    }
}
