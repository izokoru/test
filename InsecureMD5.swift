import Foundation
import CommonCrypto
import CryptoKit

// MARK: - Insecure MD5 Hashing Examples (Check 000879 - Updated)

class HashingService {
    
    // VULNERABLE: Using CryptoKit's Insecure.MD5
    @available(iOS 13.0, *)
    func hashPasswordWithMD5(password: String) -> String {
        let data = Data(password.utf8)
        // VULNERABLE: MD5 is cryptographically broken
        let digest = Insecure.MD5.hash(data: data)
        return digest.map { String(format: "%02x", $0) }.joined()
    }
    
    // VULNERABLE: Using MD5 for file integrity
    @available(iOS 13.0, *)
    func computeFileChecksum(fileData: Data) -> String {
        // VULNERABLE: MD5 should not be used for integrity verification
        let hash = Insecure.MD5.hash(data: fileData)
        return hash.description
    }
    
    // VULNERABLE: Using CommonCrypto CCHmac with MD5
    func generateHMACMD5(key: String, message: String) -> Data {
        let keyData = key.data(using: .utf8)!
        let messageData = message.data(using: .utf8)!
        
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        keyData.withUnsafeBytes { keyBytes in
            messageData.withUnsafeBytes { messageBytes in
                // VULNERABLE: Using kCCHmacAlgMD5
                CCHmac(
                    CCHmacAlgorithm(kCCHmacAlgMD5),
                    keyBytes.baseAddress,
                    keyData.count,
                    messageBytes.baseAddress,
                    messageData.count,
                    &digest
                )
            }
        }
        
        return Data(digest)
    }
    
    // VULNERABLE: Using CCHmacInit with MD5
    func generateHMACMD5Alternative(key: String, message: String) -> Data {
        let keyData = key.data(using: .utf8)!
        let messageData = message.data(using: .utf8)!
        
        let context = UnsafeMutablePointer<CCHmacContext>.allocate(capacity: 1)
        defer { context.deallocate() }
        
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        keyData.withUnsafeBytes { keyBytes in
            // VULNERABLE: Using kCCHmacAlgMD5 with CCHmacInit
            CCHmacInit(context, CCHmacAlgorithm(kCCHmacAlgMD5), keyBytes.baseAddress, keyData.count)
            
            messageData.withUnsafeBytes { messageBytes in
                CCHmacUpdate(context, messageBytes.baseAddress, messageData.count)
            }
            
            CCHmacFinal(context, &digest)
        }
        
        return Data(digest)
    }
    
    // SECURE: Using SHA-256 instead of MD5
    @available(iOS 13.0, *)
    func hashPasswordSecurely(password: String) -> String {
        let data = Data(password.utf8)
        // SECURE: SHA-256 is currently considered secure
        let digest = SHA256.hash(data: data)
        return digest.map { String(format: "%02x", $0) }.joined()
    }
    
    // SECURE: Using SHA-256 for HMAC
    func generateHMACSHA256(key: String, message: String) -> Data {
        let keyData = key.data(using: .utf8)!
        let messageData = message.data(using: .utf8)!
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        keyData.withUnsafeBytes { keyBytes in
            messageData.withUnsafeBytes { messageBytes in
                // SECURE: Using kCCHmacAlgSHA256
                CCHmac(
                    CCHmacAlgorithm(kCCHmacAlgSHA256),
                    keyBytes.baseAddress,
                    keyData.count,
                    messageBytes.baseAddress,
                    messageData.count,
                    &digest
                )
            }
        }
        
        return Data(digest)
    }
    
    // SECURE: Using CryptoKit's SHA-256
    @available(iOS 13.0, *)
    func computeFileChecksumSecurely(fileData: Data) -> String {
        // SECURE: SHA-256 for integrity verification
        let hash = SHA256.hash(data: fileData)
        return hash.compactMap { String(format: "%02x", $0) }.joined()
    }
}
