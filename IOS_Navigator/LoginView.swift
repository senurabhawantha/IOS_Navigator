import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("backgroundImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    // Top Section
                    VStack(spacing: 25) {
                        Image("logo")
                            .resizable()
                            .frame(width: 150, height: 150)

                        Text("Login")
                            .font(.custom("Futura", size: 65))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 125)

                    Spacer()

                    // Middle Section (Fields)
                    VStack(spacing: 25) {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.black)
                            TextField("Email", text: $email)
                                .font(.custom("Futura", size: 17))
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 40)

                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.black)

                            Group {
                                if isPasswordVisible {
                                    TextField("Password", text: $password)
                                        .font(.custom("Futura", size: 17))
                                } else {
                                    SecureField("Password", text: $password)
                                        .font(.custom("Futura", size: 17))
                                }
                            }

                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 40)

                        HStack {
                            Spacer()
                            Button(action: {
                                // Forgot password logic
                            }) {
                                Text("Forgot Password?")
                                    .foregroundColor(.white)
                                    .font(.custom("Futura", size: 17))
                            }
                            .padding(.trailing, 40)
                        }
                    }

                    Spacer()

                    // Bottom Section (Login Button)
                    NavigationLink(destination: DashboardView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }

                    Button(action: {
                        // You could validate login here
                        isLoggedIn = true
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.custom("Futura", size: 25))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 150)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
