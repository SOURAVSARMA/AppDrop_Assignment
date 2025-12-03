# Project Report: Dynamic Widget Rendering Engine (AnimeDrop)
**Submitted by: Sourav Sarma   
Project Name: AnimeDrop  
Technology Stack: Flutter (Dart)**
## Introduction
For this assignment, I built **AnimeDrop**, a mobile application that features a **"Dynamic Rendering Engine."** Unlike traditional apps where the layout is hard-coded by the programmer, my app is designed to be **Server-Driven**.

This means the app acts like a smart canvas. It reads a set of instructions (in JSON format) and instantly builds the screen layout based on those instructions. If the JSON data changes, the app’s look changes immediately without needing a new update from the App Store.
## Problem Statement & Objective
The goal was to create a Flutter application that:

1. Accepts raw JSON input describing a page layout.
2. Parses that data into Dart models.
3. Dynamically renders the entire screen based on the JSON schema.
4. Renders each component differently according to its specific properties.
## How It Works (The Engine)
I designed the app using a "Factory Pattern". You can think of it as a manufacturing assembly line. Here is the step-by-step process of how my code works:

**Step 1**: Input (The Blueprint): The app loads a JSON file. This file contains a list of components, each with a type (like "banner" or "carousel") and style settings.

**Step 2**: Parsing (The Translation): I created a robust PageModel that translates this raw JSON into structured Dart objects. I added safety checks here so that if the JSON is missing a value (like height), the app uses a safe default instead of crashing.

**Step 3**: The Factory (The Decision Maker): I built a WidgetFactory. This is the brain of the app. It looks at the type of each component and calls the correct widget code.

**Step 4**: Rendering: Finally, the app stacks these widgets in a scrolling list to display the complete page.

## How I Map JSON to UI
I created a simple system to turn the raw text (JSON) into the visual app you see. Here is exactly how I map the data:

### The Decision Maker
The most important part is the "type" field in the JSON. My code looks at this field to decide what to show.
1. If type is "banner" → I build a **Banner Widget**.
2. If type is "carousel" → I build a **Carousel Widget**.
3. If type is "video" → I build a **Video Player**.
4. If type is unknown → I show nothing (instead of crashing the app).

### How I Style It
I connected the numbers in the JSON directly to the app's design properties:

#### JSON Property - What I Do With It

**padding** - I add empty space around the widget.

**radius** - I round the corners of the images.

**height** - I force the widget to be a specific height.

**columns** - I change the grid layout (e.g., 2 items per row vs. 3 items).

**autoPlay** - I tell the image slider to move automatically.

## Key Features (The UI Components)
Per the assignment requirements, I implemented five distinct components. Each one is fully customizable via the JSON data:

**Image Banner:**  Displays a large, high-quality feature image with adjustable rounded corners.

**Image Carousel:**  A horizontal slider. It supports an autoPlay setting to slide automatically or manually.

**Image Grid:**  A flexible gallery. I can instantly change it from a 2-column grid to a 3-column grid just by changing one number in the data.

**Video Player:**  Plays video content directly in the feed. I integrated a professional video interface with play/pause controls.

**Text Block:**  Displays titles and descriptions with adjustable Font Size, Weight (Bold), and Alignment.
## How I Made It Extensible (Adding New Widgets)
I designed the architecture specifically so that adding new components is simple and doesn't break existing code. If I want to add a new widget, like a **Button**, I just follow these 3 steps:

**I Create the Widget File:** I create a new file (e.g., lib/widgets/button_component.dart) that accepts the data model.

**I Register it in the Factory:** I go to lib/core/widget_factory.dart and add just **one line** to the switch statement: case 'button': return ButtonComponent(...).

**I Use it in JSON:** I can immediately use { "type": "button" } in my JSON file without restarting the app logic.
## Technical Enhancements (Brownie Points)
To go above and beyond the basic requirements, I implemented several advanced technical features:

**State Management (Riverpod):** Instead of using basic state handling, I used **Riverpod**. This makes the app's architecture scalable.

**Lazy Loading & Caching:** I used the cached_network_image package. This ensures images are downloaded only once and saved on the phone, making the app load instantly when opened a second time.

**Unit Testing & Verification:** I wrote automated tests for the WidgetFactory and executed them using flutter test. I confirmed that **all tests passed successfully**. Additionally, I generated a release APK and installed it on my physical Android phone to verify that the app performs smoothly in a real-world environment.
## Conclusion
I have successfully built a fully functional **Dynamic Rendering Engine** that meets all the criteria outlined in the assignment PDF. The app is fast, looks professional with its Anime theme, and uses a scalable architecture that is easy to maintain and extend.
