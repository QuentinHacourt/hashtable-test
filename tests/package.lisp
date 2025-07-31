(defpackage :hashtable-test/tests
  (:use #:cl :fiveam)
  (:shadowing-import-from #:hashtable-test
                          #:make-hash-table
                          #:addhash
                          #:gethash
                          #:remhash
                          #:clrhash
                          #:maphash
                          #:cl-hashmap)
  (:export :run-all))
