//
//  MorphingAnimation.swift
//  SwiftAnimation
//
//  Created by User on 22/04/24.
//

import SwiftUI

struct MorphingAnimation: View {
    @State private var recordBegin = false
    @State private var recording = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 30)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundStyle(recordBegin ? .gray : .red)
                .overlay{
                    Image(systemName: "mic.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                }
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 35)
                .trim(from: 0, to: recordBegin ? 0.0 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundStyle(recordBegin ? .gray : .red)
            
        }
        .onTapGesture {
            withAnimation(.default){
                recordBegin.toggle()
                recording.toggle()
            }
        }
    }
}

#Preview {
    MorphingAnimation()
}
