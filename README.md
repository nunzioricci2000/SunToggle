# SunToggle

## Why this library?

You know those sleepless nights when for no reason you scroll through reels on Instagram until 3 a.m.? This bookstore was born on one of those nights.

Just before I finally decide to go to sleep I find this silly reel: https://www.instagram.com/p/Criem1rLI9P/.

Needless to say, at the sight of such beauty I could not resist and immediately had to try my hand at this unexpected challenge.

Result? 1 hour of scheming on Figma, 1 1/2 hours of pure Xcode-style fun, and circadian cycle blown to hell.

## Installation guide



## How to use it?

Downloading the repo you will find a sample project but, in case you are too lazy, here is the step-by-step guide:

### 1. Import the library

        import SunToggle
    
### 2. Create a toggle
    
        var body: some View {
            Toggle("This is a Sun", isOn: $isOn)
        }
    
### 3. Set `.sun` as toggle style
    
        var body: some View {
            Toggle("This is a Sun", isOn: $isOn)
                                .toggleStyle(.sun)
        }

### 4. Enjoy the power of Apollo

    Yes, it is THAT easy.

## Future implementations

I'm working on incorporating similar behavior to SwiftUI's stock toggle. Stay tuned for more fun to come. 
