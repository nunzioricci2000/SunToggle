
import SwiftUI

public struct SunToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
        }.buttonStyle(ToggleButtonStyle(isOn: configuration.$isOn))
    }
    
    public init() { }
}

private struct ToggleButtonStyle: ButtonStyle {
    @Binding var isOn: Bool
    @GestureState var offset: CGPoint = .zero
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.label
            Spacer(minLength: 20)
            toggle(configuration)
                .padding(-2)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .updating($offset) { value, state, transaction in
                            state = value.location
                            if state.x < 12.5 {
                                isOn = false
                            }
                            if state.x > 34.5 {
                                isOn = true
                            }
                        }
                )
        }
    }
    
    func toggle(_ configuration: Configuration) -> some View {
        HStack() {
            if isOn {
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 13.5)
                    .frame(width: configuration.isPressed || offset != .zero ? 34 : 27)
                if isOn {
                    moonseas.blendMode(.sourceAtop)
                }
            }.compositingGroup()
                .foregroundStyle(
                    (isOn ? Color.moon : .sun)
                        .gradient
                        .shadow(
                            .inner(
                                color: .black.opacity(0.15),
                                radius: 2,
                                x: -2,
                                y: -2
                            )
                        ).shadow(
                            .inner(
                                color: .white.opacity(0.50),
                                radius: 2,
                                x: 1,
                                y: 1
                            )
                        ).shadow(
                            .drop(
                                color: .black.opacity(0.06),
                                radius: 1,
                                x: 0,
                                y: 3
                            )
                        ).shadow(
                            .drop(
                                color: .black.opacity(0.15),
                                radius: 5,
                                x: 0,
                                y: 3
                            )
                        )
                )
                .background {
                    Circle()
                        .foregroundColor(.white.opacity(0.1))
                        .padding(-8)
                }
                .background {
                    Circle()
                        .foregroundColor(.white.opacity(0.1))
                        .padding(-16)
                }
            if !isOn {
                Spacer()
            }
        }
        .padding(2)
        .frame(width: 51, height: 31)
        .background(background(configuration))
        .onTapGesture {
            isOn.toggle()
        }
        .cornerRadius(30)
        .animation(
            .interpolatingSpring(stiffness: 300, damping: 20),
            value: isOn
        )
        .animation(
            .interpolatingSpring(stiffness: 300, damping: 20),
            value: configuration.isPressed
        )
        .animation(
            .interpolatingSpring(stiffness: 300, damping: 20),
            value: offset
        )
    }
    
    var moonseas: some View {
        ZStack(alignment: .center) {
            Circle()
                .offset(x: -4.5, y: 2.5)
                .frame(width: 8, height: 8)
            Circle()
                .frame(width: 4, height: 4)
                .offset(x: -0.5, y: -5.5)
            Circle()
                .frame(width: 5, height: 5)
                .offset(x: 6, y: 4)
        }.foregroundStyle(
            Color.moonsea
                .gradient
                .shadow(
                    .inner(
                        color: .black.opacity(0.25),
                        radius: 0.3,
                        x: 0,
                        y: 0.5
                    )
                )
        ).frame(width: 17, height: 15)
    }
    
    func background(_ configuration: Configuration) -> some View {
        (isOn ? Color.night : .day)
            .animation(.linear(duration: 0.2), value: isOn)
            .overlay {
                Image("Background", bundle: .module)
                    .offset(x: 8.5, y: isOn ? 22.5 : -4.5)
            }
    }
    
}

struct SunToggleStyle_Previews: PreviewProvider {
    struct Preview: View {
        @State var isOn = false
        
        var body: some View {
            Toggle("Salve", isOn: $isOn)
                .toggleStyle(.sun)
                .fixedSize()
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
