/// Copyright (c) 2023 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

@MainActor class APIDownloader: ObservableObject {
  @Published var downloadLocation: URL?
  @Published var apis = APIs(count: 0, entries: [])
  @Published var errorOccured = false
  
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration
  
  init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
  }
  
  func downloadAPI(at url: URL) async {
    guard let (downloadURL, res) = try? await session.download(from: url)
    else {
      errorOccured = true
      return
    }
    
    guard let httpRes = res as? HTTPURLResponse,
          httpRes.statusCode == 200
    else {
      errorOccured = true
      return
    }
  
    let decoder = JSONDecoder()
    do {
      let data = try Data(contentsOf: downloadURL)
      apis = try decoder.decode(APIs.self, from: data)
    } catch {
      errorOccured = true
    }
    
    let fileManager = FileManager.default
    
    guard let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    else {
      errorOccured = true
      return
    }
    print(documentsPath)
    
    let lastPathComponent = url.lastPathComponent
    let destinationURL = documentsPath.appendingPathComponent(lastPathComponent).appendingPathExtension("json")
    
    do {
      if fileManager.fileExists(atPath: destinationURL.path) {
        try fileManager.removeItem(at: destinationURL)
      }
      
      try fileManager.copyItem(at: downloadURL, to: destinationURL)
      
      await MainActor.run {
        downloadLocation = destinationURL
      }
    } catch let error {
      errorOccured = true
      print(error)
    }
  }
}
