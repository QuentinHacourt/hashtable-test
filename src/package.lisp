(defpackage #:hashtable-test
  (:use #:cl)
  (:shadow #:make-hash-table
           #:gethash
           #:remhash
           #:clrhash
           #:maphash)
  (:export #:cl-hashmap
           #:make-hash-table
           #:addhash
           #:gethash
           #:remhash
           #:clrhash
           #:maphash))
