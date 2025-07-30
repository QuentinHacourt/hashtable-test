(defsystem hashtable-test
  :author "Quentin Hacourt <quentin.hacourt@gmail.com"
  :maintainer "Quentin Hacourt <quentin.hacourt@gmail.com"
  :licence "GNU GPL"
  :version "3.0"
  :homepage "https://github.com/QuentinHacourt/hashtable-test"
  :description "A small program to benchmark different approaches for sharing hashmaps among threads"
  :depends-on (:stmx)
  :components ((:module "src"
                :serial t
                :components
                ((:file "main"))))
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))
