(defpackage #:hashtable-test
  (:use #:cl)
  (:export #:hashmap-create
           #:hashmap-add
           #:hashmap-get
           #:hashmap-delete
           #:hashmap-clear
           #:hashmap-iterate
           #:cl-hashmap))

;;TODO: shadow all functions I need to shadow
;; (:shadow #:gethash)
