import SwiftUI
import WebKit
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        webView.load(URLRequest(url: url))

        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 5.0
        webView.scrollView.zoomScale = 1.0

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct ContentView: View {
    let notificationDelegate = NotificationDelegate()
    
    var body: some View {
        WebView(url: URL(string: "https://shows.undershows.com.br")!)
            .ignoresSafeArea()
            .onAppear {
                UNUserNotificationCenter.current().delegate = notificationDelegate
                requestNotificationPermissionAndSchedule()
            }
    }
}

func requestNotificationPermissionAndSchedule() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("Permissão concedida")
            scheduleWelcomeNotification()
        } else {
            print("Permissão negada ou erro: \(String(describing: error))")
        }
    }
}

func scheduleWelcomeNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Undershows"
    content.body = "Você pode ver shows underground do Brasil inteiro. Boa diversão!"
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

    let request = UNNotificationRequest(identifier: "welcomeNotification", content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Erro ao agendar notificação: \(error)")
        } else {
            print("Notificação de boas-vindas agendada com sucesso.")
        }
    }
}
