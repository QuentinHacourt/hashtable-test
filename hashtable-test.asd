(defsystem #:hashtable-test
  :author "Quentin Hacourt <quentin.hacourt@gmail.com>"
  :maintainer "Quentin Hacourt <quentin.hacourt@gmail.com>"
  :licence "GNU GPL"
  :version "3.0"
  :homepage "https://github.com/QuentinHacourt/hashtable-test"
  :description "A small program to benchmark different approaches for sharing hashmaps among threads"
  :depends-on (:stmx)
  :components ((:module "src"
                :serial t
                :components
                ((:file "package")
                 (:file "main" :depends-on ("package"))
                 (:module "hashmap"
                  :depends-on ("package")
                  :components
                  ((:file "generic-hashmap")
                   (:file "cl-hashmap" :depends-on ("generic-hashmap")))))))
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))

(defsystem #:hashtable-test/tests
  :author "Quentin Hacourt <quentin.hacourt@gmail.com>"
  :maintainer "Quentin Hacourt <quentin.hacourt@gmail.com>"
  :licence "GNU GPL"
  :version "3.0"
  :description "A small program to benchmark different approaches for sharing hashmaps among threads"
  :depends-on (#:hashtable-test
               #:fiveam)
  :serial t
  :components ((:module "tests"
                :serial t
                :components
                ((:file "package")
                 (:file "all-tests" :depends-on ("package"))))))
