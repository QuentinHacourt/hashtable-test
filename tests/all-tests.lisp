(in-package :hashtable-test/tests)

(def-suite hashmap-tests
  :description "Tests for different hashtable implementations.")

(in-suite hashmap-tests)

(test cl-hashmap-test
  "Tests the cl-hashmap implementation."
  (let ((map (make-hash-table :cl-hashtable)))
    ;; Can we create a hashmap correctly?
    (is (typep map 'hashtable-test:cl-hashmap)
        "make-hash-table should return an object of type HASHTABLE-TEST:CL-HASHTABLE.")

    (is (not (null map)) "make-hash-table should return a non-nil object.")

    ;; Can we add a value in the map and read it?
    (addhash map "one" 1)

    (is (equal 1 (gethash map "one"))
        "gethash should retrieve the correct value after add.")


    ;; Same with more data
    (addhash map "two" 2)

    (is (equal 2 (gethash map "two"))
        "gethash should retrieve the correct value after add.")

    (addhash map "three" 3)

    (is (equal 3 (gethash map "three"))
        "gethash should retrieve the correct value after add.")


    (addhash map "four" 4)

    (is (equal 4 (gethash map "four"))
        "gethash should retrieve the correct value after add.")

    ;; Can we delete an entry?
    (finishes (remhash map "four"))

    (is (equal nil (gethash map "four"))
        "gethash should retrieve the correct value after add.")

    ;; What happens when we try to delete a non existant entry?
    (finishes (remhash map "five"))

    ;; What happens when we try to fetch a non existant entry
    (is (equal nil (gethash map "six")))

    ;; Does maphash work as expected?
    (let ((keys '())
          (values '()))
      (maphash map (lambda (key value)
                     (push key keys)
                     (push value values)))
      (is (equal (sort (copy-list keys) #'string<)
                 (sort (list "one" "two" "three") #'string<))
          "maphash should visit all keys.")
      (is (equal (sort (copy-list values) #'<)
                 (sort (list 1 2 3) #'<))
          "maphash should visit all values."))

    ;; Can we succesfully clear the map?
    (finishes (clrhash map))

    (let ((counter 0))
      (maphash map (lambda (key value) (incf counter)))
      (is (equal 0 counter)))



    ))

(defun run-all ()
  (run! 'hashmap-tests))
