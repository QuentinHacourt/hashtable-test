(in-package #:hashtable-test)

(defclass cl-hashmap ()
  ((table :initarg :table :accessor hashmap-table)))

(defmethod make-hash-table ((implementation (eql :cl-hashtable)))
  (make-instance 'cl-hashmap
                 :table (cl:make-hash-table :test 'equal)))

(defmethod addhash ((hashmap cl-hashmap) key value)
  (setf (cl:gethash key (hashmap-table hashmap)) value))

(defmethod gethash ((hashmap cl-hashmap) key)
  (cl:gethash key (hashmap-table hashmap)))

(defmethod remhash ((hashmap cl-hashmap) key)
  (cl:remhash key (hashmap-table hashmap)))

(defmethod clrhash ((hashmap cl-hashmap))
  (cl:clrhash (hashmap-table hashmap)))

(defmethod maphash ((hashmap cl-hashmap) function)
  (cl:maphash function (hashmap-table hashmap)))
