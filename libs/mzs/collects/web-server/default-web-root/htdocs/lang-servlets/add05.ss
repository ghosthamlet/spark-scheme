(module add05 (lib "lang.ss" "web-server")
  (provide start)
  
  ;; get-number-from-user: string -> number
  ;; ask the user for a number
  (define (gn msg)
    (extract-proc/url
     (send/suspend/url
      (lambda (k-url)
        `(hmtl (head (title ,(format "Get ~a number" msg)))
               (body
                (form ([action ,(url->string 
                                 (embed-proc/url 
                                  k-url
                                  (lambda (req)
                                    (string->number
                                     (bytes->string/utf-8
                                      (binding:form-value
                                       (bindings-assq #"number" 
                                                      (request-bindings/raw req))))))))]
                       [method "post"]
                       [enctype "application/x-www-form-urlencoded"])
                      ,(format "Enter the ~a number to add: " msg)
                      (input ([type "text"] [name "number"] [value ""]))
                      (input ([type "submit"])))))))))  
  
  (define (start initial-request)
    `(html (head (title "Final Page"))
           (body
            (h1 "Final Page")
            (p ,(format "The answer is ~a" (+ (gn "first") (gn "second"))))))))