func UPLOD()
    {
        //Parameter HERE
        let parameters = [
            "id": "429",
            "docsFor" : "visitplan"
        ]
        //Header HERE
        let headers = [
            "token" : "W2Y3TUYS0RR13T3WX2X4QPRZ4ZQVWPYQ",
            "Content-type": "multipart/form-data",
            "Content-Disposition" : "form-data"
        ]
        
        let image = UIImage.init(named: "furkan")
        let imgData = UIImageJPEGRepresentation(image!, 0.7)!
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            //Parameter for Upload files
            multipartFormData.append(imgData, withName: "file",fileName: "furkan.png" , mimeType: "image/png")
            
            for (key, value) in parameters
            {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
            
        }, usingThreshold:UInt64.init(),
           to: "http:API-for-url-her", //URL Here
            method: .post,
            headers: headers, //pass header dictionary here
            encodingCompletion: { (result) in
                
                switch result {
                case .success(let upload, _, _):
                    print("the status code is :")
                    
                    upload.uploadProgress(closure: { (progress) in
                        print("something")
                    })
                    
                    upload.responseJSON { response in
                        print("the resopnse code is : \(response.response?.statusCode)")
                        print("the response is : \(response)")
                    }
                    break
                case .failure(let encodingError):
                    print("the error is  : \(encodingError.localizedDescription)")
                    break
                }
        })
    }