(in-package #:hashtable-test)

;; TODO: ondersteun standaard namen zoals gethash
(defclass cl-hashmap ()
  ((table :initarg :table :accessor hashmap-table)))

(defmethod hashmap-create ((implementation (eql :cl-hashtable)))
  (make-instance 'cl-hashmap
                 :table (make-hash-table :test 'equal)))

(defmethod hashmap-add ((hashmap cl-hashmap) key value)
  (setf (gethash key (hashmap-table hashmap)) value))

(defmethod hashmap-get ((hashmap cl-hashmap) key)
  (gethash key (hashmap-table hashmap)))

(defmethod hashmap-delete ((hashmap cl-hashmap) key)
  (remhash key (hashmap-table hashmap)))

(defmethod hashmap-clear ((hashmap cl-hashmap))
  (clrhash (hashmap-table hashmap)))

(defmethod hashmap-iterate ((hashmap cl-hashmap) function)
  (maphash function (hashmap-table hashmap)))
