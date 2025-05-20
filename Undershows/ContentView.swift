import SwiftUI
import WebKit
import Network

struct WebView: UIViewRepresentable {
    let url: URL
    let monitor = NWPathMonitor()

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    webView.load(URLRequest(url: url))
                } else {
                    let html = """
                    <html>
                      <body style='font-family: -apple-system; padding: 40px; text-align: center;'>
                        <h2>Você está offline</h2>
                        <p>Conecte-se à internet para continuar navegando nos shows.</p>
                      </body>
                    </html>
                    """
                    webView.loadHTMLString(html, baseURL: nil)
                }
            }
        }

        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)

        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 5.0
        webView.scrollView.zoomScale = 1.0

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://shows.undershows.com.br")!)
            .ignoresSafeArea()
    }
}

