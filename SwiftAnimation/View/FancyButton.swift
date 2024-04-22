//
//  FancyButton.swift
//  SwiftAnimation
//
//  Created by User on 22/04/24.
//

import SwiftUI

struct FancyButton: View {
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 250: 200, height: 60)
                .foregroundStyle(completed ? .red : .green)
                .animation(.spring, value: processing)
            
            if !processing{
                Text("Sumbit")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
            }
            if processing && !completed {
                HStack{
                    Circle()
                        .trim(from: 0, to:0.9)
                        .stroke(Color.white, lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(loading ? 360 : 0))
                        .animation(.easeOut.repeatForever(autoreverses: false), value: loading)
                    
                    Text("Processing")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                .transition(.opacity)
                .onAppear{
                    startProcessing()
                }
            }
            if completed{
                Text("Done")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .onAppear{
                        withAnimation(.default){
                            endProcessing()
                        }
                    }
            }
        }
        .animation(.spring, value: loading)
        .onTapGesture {
            if !loading{
                processing.toggle()
            }

        }
    }
}

#Preview {
    FancyButton()
}

// MARK: - extension

extension FancyButton{
    func startProcessing(){
        loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            completed = true
        }
    }
    func endProcessing(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
            processing = false
            completed = false
            loading = false
        }
    }
}
