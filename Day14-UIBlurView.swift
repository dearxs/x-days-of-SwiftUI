// credit to Jordan Singer
// link: https://gist.github.com/jordansinger/87497bb3ed7e663ddacdbc9c9829be69

import SwiftUI
import PlaygroundSupport

struct AppleTV: View {
    var body: some View {
        ZStack {
            Color.gray
            ControlCenter()
        }
    }
}

struct ControlCenter: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("10:03")
                    .font(.system(size: 48, weight: .medium))
                    Text("Saturday, August 21")
                }
            }
            
            HStack {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64)
                    .foregroundColor(.secondary)
                    
                    Text("Gengis Khan")
                }
                Spacer()
            }.padding(.horizontal)
            
            Module(icon: "circle.bottomthird.split", title: "Sleep", subtitle: "All connected devices")
            Module(icon: "music.note.list", title: "Not Playing")
            
            HStack {
                Icon(icon: "house")
                Spacer()
                Icon(icon: "airplayaudio")
                Spacer()
                Icon(icon: "magnifyingglass")
            }
        }
    .padding()
    .frame(width: 375)
    .background(Blur(style: .systemMaterial))
    .cornerRadius(32)
    }
}

struct Icon: View {
    var icon: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
            .foregroundColor(Color(UIColor.secondarySystemBackground))
            
            Image(systemName: icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 36, height: 36)
        }.frame(width: 96, height: 96)
    }
}

struct Module: View {
    var icon: String
    var title: String
    var subtitle: String?
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 48)
            .padding(8)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                .font(.system(size: 24, weight: .medium))
                if subtitle != nil {
                    Text(subtitle ?? "")
                    .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
    .padding()
    .background(Color(UIColor.secondarySystemBackground))
    .cornerRadius(24)
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

PlaygroundPage.current.setLiveView(AppleTV())
