import SwiftUI

struct MapView: View {
    @State private var navigateToSteps = false
    @State private var navigateToSearchMap = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.systemGray6).ignoresSafeArea()
                
                // Main Content
                VStack(spacing: 0) {
                    // MARK: - Search Bar
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            Text("C2007 Hall")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "mic.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        // Cancel Button → SearchMapView
                        NavigationLink(destination: SearchMapView(), isActive: $navigateToSearchMap) {
                            Button("Cancel") {
                                navigateToSearchMap = true
                            }
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    
                    // MARK: - Map Image
                    Image("mainmap")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    // MARK: - Steps Button → StepView
                    NavigationLink(destination: StepView(), isActive: $navigateToSteps) {
                        Button(action: {
                            navigateToSteps = true
                        }) {
                            HStack {
                                Text("Steps")
                                    .font(.headline)
                                Spacer()
                                Text(">")
                                    .font(.headline)
                            }
                            .padding()
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .padding(.horizontal, 30)
                            .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 100) // Space for the tab bar
                }
                
                // MARK: - Bottom Tab Bar
                VStack(spacing: 0) {
                    Divider()
                    
                    HStack(spacing: 60) {
                        TabBarItem(iconName: "homeblack", isSelected: false)
                        TabBarItem(iconName: "locationblue", isSelected: true)
                        TabBarItem(iconName: "bellimage", isSelected: false)
                        TabBarItem(iconName: "profileimage", isSelected: false)
                    }
                    .frame(height: 20)
                    .padding(.horizontal, 50)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .background(Color.white)
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(Color.white)
            }
        }
    }
}

struct TabBarItem1: View {
    let iconName: String
    let isSelected: Bool

    var body: some View {
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(isSelected ? .blue : .gray)
            .frame(width: 28, height: 28)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
