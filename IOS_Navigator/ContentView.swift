import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("backgroundImage2") // Replace with your actual image name in assets
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Top: Welcome Text
                    Text("Welcome")
                        .font(.custom("Futura", size: 65))
                        .foregroundColor(.white)
                        .padding(.top, 125)

                    Spacer()

                    // Middle: Logo
                    Image("logo") // Replace with your actual image name
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.blue)

                    Spacer()

                    // Bottom: Description and Button
                    VStack(spacing: 20) {
                        Text("Campus Navigator helps you find your way around the campus and find essential information")
                            .font(.custom("Futura", size: 17))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)

                        // NavigationLink to LoginView
                        NavigationLink(destination: LoginView()) {
                            Text("Get Started")
                                .foregroundColor(.white)
                                .font(.custom("Futura", size: 25))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                                .padding(.horizontal, 40)
                        }
                    }
                    .padding(.bottom, 75)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
