import Foundation

// MARK: - Sensitive Data in UserDefaults Examples (Check 005021)

class UserPreferencesManager {
    
    // VULNERABLE: Storing password in UserDefaults
    func saveUserCredentials(username: String, password: String) {
        UserDefaults.standard.set(username, forKey: "username") // OK - username not sensitive
        UserDefaults.standard.set(password, forKey: "password") // VULNERABLE!
    }
    
    // VULNERABLE: Storing API key in UserDefaults
    func saveAPICredentials(apiKey: String) {
        UserDefaults.standard.set(apiKey, forKey: "apiKey") // VULNERABLE!
    }
    
    // VULNERABLE: Storing authentication token
    func saveAuthToken(token: String) {
        UserDefaults.standard.set(token, forKey: "authToken") // VULNERABLE!
    }
    
    // VULNERABLE: Storing encryption key
    func saveEncryptionKey(key: String) {
        UserDefaults.standard.set(key, forKey: "cryptoKey") // VULNERABLE!
    }
    
    // VULNERABLE: Storing private key
    func savePrivateKey(privateKey: String) {
        UserDefaults.standard.set(privateKey, forKey: "rsaPrivateKey") // VULNERABLE!
    }
    
    // VULNERABLE: Storing client secret
    func saveOAuthCredentials(clientId: String, clientSecret: String) {
        UserDefaults.standard.set(clientId, forKey: "clientId") // OK
        UserDefaults.standard.set(clientSecret, forKey: "clientSecret") // VULNERABLE!
    }
    
    // VULNERABLE: Storing passphrase
    func saveWalletPassphrase(passphrase: String) {
        UserDefaults.standard.set(passphrase, forKey: "walletPassphrase") // VULNERABLE!
    }
    
    // VULNERABLE: Various credential patterns
    func saveCredentials() {
        UserDefaults.standard.set("secret123", forKey: "userPassword") // VULNERABLE!
        UserDefaults.standard.set("key456", forKey: "GOOGLE_TOKEN") // VULNERABLE!
        UserDefaults.standard.set("pass789", forKey: "pass_phrase") // VULNERABLE!
    }
    
    // SECURE: Using Keychain for sensitive data
    func savePasswordSecurely(password: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userPassword",
            kSecValueData as String: password.data(using: .utf8)!
        ]
        SecItemAdd(query as CFDictionary, nil)
    }
    
    // OK: Storing non-sensitive preferences
    func saveUserPreferences(theme: String, language: String) {
        UserDefaults.standard.set(theme, forKey: "theme")
        UserDefaults.standard.set(language, forKey: "language")
    }
}
