(defpackage #:hasthtable-test
  (:use #:cl)
  (:export #:add-entry
           #:get-entry))

(let ((my-hash (make-hash-table)))

  (defun add-entry (key val)
    * (setf (gethash key my-hash) val))

  (defun get-entry (key)
    (gethash key my-hash))


  (defun dummy-data ()
    (setf (gethash 'one-entry my-hash) "one")
    (setf (gethash 'another-entry my-hash) "two"))

  (dummy-data))
