//
//  ContentView.swift
//  IOS_Navigator
//
//  Created by ITEDP on 2025-06-02.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("backgroundImage") // Replace with your actual image name in assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
//                    Button("Skip") {
//                        // Action for skip
//                    }
//                    .foregroundColor(.white)
//                    .padding()
                }
                
                Spacer()
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, -40)
                
                Spacer().frame(height: 30)
                
                Image("logo") // Replace with custom image if needed
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Spacer().frame(height: 30)
                
                Text("NIBM Navigator helps you find your way around the campus and find essential information")
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer().frame(height: 30)
                
                Button(action: {
                    // Navigate to next screen
                }) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
