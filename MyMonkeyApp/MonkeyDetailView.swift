import SwiftUI

struct MonkeyDetailView: View {
    let monkey: Monkey
    @Environment(\.dismiss) private var dismiss
    @State private var animateContent = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Hero Image Section
                ZStack(alignment: .top) {
                    AsyncImage(url: URL(string: monkey.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 300)
                    }
                    
                    // Dismiss Button
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                        }
                        .padding()
                        Spacer()
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    // Name and Location Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text(monkey.name)
                            .font(.system(size: 32, weight: .bold))
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                            Text(monkey.location)
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                    
                    // Population Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Population")
                            .font(.title2)
                            .bold()
                        
                        HStack(alignment: .bottom, spacing: 4) {
                            Text("\(monkey.population.formatted())")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(populationColor(count: monkey.population))
                            Text("monkeys")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        // Population bar
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: geometry.size.width, height: 8)
                                    .opacity(0.3)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .frame(width: geometry.size.width * CGFloat(min(Double(monkey.population) / 30000.0, 1.0)), height: 8)
                                    .foregroundColor(populationColor(count: monkey.population))
                            }
                            .cornerRadius(4)
                        }
                        .frame(height: 8)
                    }
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                    
                    // Details Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About")
                            .font(.title2)
                            .bold()
                        Text(monkey.details)
                            .font(.body)
                            .lineSpacing(6)
                    }
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                    
                    // Fun Facts
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Fun Facts")
                            .font(.title2)
                            .bold()
                        
                        ForEach(["Did you know that \(monkey.name)s are excellent climbers?",
                                "They communicate through various vocalizations and facial expressions",
                                "Their diet consists mainly of fruits, leaves, and insects"],
                               id: \.self) { fact in
                            HStack(spacing: 12) {
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(.green)
                                Text(fact)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                }
                .padding()
                .background(Color(UIColor.systemBackground))
            }
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                animateContent = true
            }
        }
    }
    
    private func populationColor(count: Int) -> Color {
        switch count {
        case ..<5000: return .red
        case 5000..<15000: return .orange
        case 15000..<25000: return .blue
        default: return .green
        }
    }
}