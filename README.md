# ChatGPTUI-Bot

ChatGPTUI-Bot is a **SwiftUI project** developed using the **MVVM (Model-View-ViewModel) architecture**. This project enables users to send messages and receive responses from OpenAI's ChatGPT API. The API key is securely stored using either **Config.plist** or **environment variables**.

## 🚀 Features
- **MVVM architecture** for clean code organization
- **Integration with ChatGPT API**
- **Secure API key storage**
- **Modern UI with SwiftUI**

---

## 📌 MVVM Architecture
This project follows the **MVVM (Model-View-ViewModel)** architecture.

### **1. Model**
- Includes data models like `ChatMessage` and `ChatResponse`.

### **2. ViewModel**
- Handles API requests to ChatGPT in `OpenAIService.swift`.

### **3. View**
- **SwiftUI-powered UI** that collects user input and displays API responses.

---

## 🔑 Using the API Key
This project utilizes the **ChatGPT API** to retrieve responses from OpenAI. To obtain your API key:

1. Visit [OpenAI's website](https://platform.openai.com/signup/) and generate your API key.
2. Store the API key securely using **Config.plist** or **environment variables**.

**Important:** Never store your API key directly in the source code!

---

## 🔒 Securing the API Key
This project ensures API key security using two methods:

### **1. Using Config.plist (Recommended Method)**
1. Create a new file named `Config.plist` in Xcode.
2. Add the following content to store your API key:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>OPENAI_API_KEY</key>
    <string>your-secret-api-key</string>
</dict>
</plist>
```

3. Prevent the file from being uploaded to GitHub by adding the following line to your `.gitignore` file:

```
Config.plist
```

4. Access the API key in your Swift code as follows:

```swift
private var apiKey: String? {
    if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
       let dict = NSDictionary(contentsOfFile: path),
       let key = dict["OPENAI_API_KEY"] as? String {
        return key
    }
    return nil
}
```

### **2. Using Environment Variables**
Alternatively, you can retrieve the API key from environment variables:

1. Open Terminal and set your API key:

```sh
export OPENAI_API_KEY="your-secret-api-key"
```

2. Access the API key in Swift code as follows:

```swift
let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"]
```

This approach ensures that the API key is never exposed in the codebase.

---

## 🛠 How to Use
1. **Clone the repository:**
```sh
git clone https://github.com/engincangunduz/ChatGPTUI-Bot.git
cd ChatGPTUI-Bot
```

2. **Add your API key to Config.plist or set it as an environment variable.**

3. **Open the project in Xcode and run it.**

```sh
open ChatGPTUI-Bot.xcodeproj
```

4. **Interact with ChatGPT through the SwiftUI interface.**

---

## ⚠️ Warnings
- **Never upload your API key to GitHub!** Use `.gitignore` to exclude sensitive files.
- OpenAI's API may have usage limits. Check OpenAI's official documentation for details.
- This project follows the **MVVM design pattern** to ensure maintainability and clean code structure.

---

## 📬 Contact
If you have any questions or want to contribute, feel free to open a **Pull Request** on GitHub or reach out! 😊
