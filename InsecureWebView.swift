import UIKit
import WebKit
import SafariServices

// MARK: - Insecure WebView Configuration Examples (Check 005022)

class WebViewController: UIViewController {
    
    // VULNERABLE: Using deprecated UIWebView
    var legacyWebView: UIWebView!
    
    func setupLegacyWebView() {
        legacyWebView = UIWebView(frame: view.bounds)
        view.addSubview(legacyWebView)
        
        // VULNERABLE: Loading content with UIWebView
        let htmlString = "<html><body><h1>Hello</h1></body></html>"
        legacyWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    func loadRemoteContent(url: URL) {
        let request = URLRequest(url: url)
        // VULNERABLE: Using UIWebView.loadRequest
        legacyWebView.loadRequest(request)
    }
    
    func loadLocalData() {
        let data = Data()
        // VULNERABLE: Using UIWebView.loadData
        legacyWebView.loadData(data, mimeType: "text/html", textEncodingName: "utf-8", baseURL: nil)
    }
}

class DocumentViewController: UIViewController {
    
    // VULNERABLE: Using SFSafariViewController for sensitive content
    var safariViewController: SFSafariViewController?
    
    func showDocument(url: URL) {
        // VULNERABLE: SFSafariViewController shares cookies with Safari
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func displaySensitiveContent() {
        let url = URL(string: "https://example.com/sensitive-data")!
        // VULNERABLE: Using SFSafariViewController for auth flow
        safariViewController = SFSafariViewController(url: url)
        present(safariViewController!, animated: true)
    }
}

// SECURE: Using WKWebView properly
class SecureWebViewController: UIViewController {
    
    var webView: WKWebView!
    
    func setupSecureWebView() {
        let config = WKWebViewConfiguration()
        
        // Configure security settings
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = false
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        view.addSubview(webView)
        
        // This is the recommended approach
        let url = URL(string: "https://example.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

