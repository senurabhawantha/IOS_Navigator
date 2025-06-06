import SwiftUI

struct MapView: View {
    var body: some View {
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
                    }
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button("Cancel") {
                        // Cancel action
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.blue)
                
                // MARK: - Map Image
                Image("mainmap") // Replace with your map image name
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                
                Spacer()
                
                // MARK: - Steps Button
                Button(action: {
                    // Handle Steps Action
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
                .padding(.bottom, 100) // Space for the tab bar
            }
            
            // MARK: - Bottom Tab Bar
            VStack(spacing: 0) {
                Divider()
                
                HStack(spacing: 60) {
                    TabBarItem(iconName: "homeimage", isSelected: true)
                    TabBarItem(iconName: "locationimage", isSelected: false)
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
            .padding(.horizontal, 0)
            
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
