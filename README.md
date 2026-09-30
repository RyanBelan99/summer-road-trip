# Summer Road Trip

A small iOS utility that estimates how many fuel stops a road trip will need,
adjusting for terrain. Built in Swift for CSC 214 (iOS Development) at the
University of Rochester, Summer 2020.

## What it does

You enter your vehicle's fuel economy (mpg), the trip distance, and your tank
size. A row of emoji buttons lets you tag terrain along the route (city 🏬,
mountains 🏔, desert 🏜), each of which lowers your effective mileage. The app
then computes the fuel consumed and the number of stops required.

## Highlights

- **Clean MVC separation.** All the arithmetic lives in `AppLogic.swift`, fully
  decoupled from the view controller — which made it straightforward to
  unit-reason about and fix (see below).
- **Localized into four languages** — English, German, French, and Russian
  (`en.lproj`, `de.lproj`, `fr.lproj`, `ru.lproj`).
- A small custom `UIButton` subclass (`EmojiFilter.swift`) for the terrain toggles.

## Build & run

Open `SummerRoadTrip.xcodeproj` in Xcode and run on the simulator (iOS 13+).

## Notes

This repo keeps its original commit history so the progression is visible
(`Initial Commit → added logic → linked everything with AppLogic → localization
→ debugging`).

Fixed since the original submission: `AppLogic.caclulate()` computed
`Double(distance / temp)`, doing integer division *before* the cast (which
truncated the fuel estimate), and a low mpg combined with terrain modifiers could
truncate the divisor to `0` and crash. The calculation now runs in floating point
throughout and guards against a zero divisor.
