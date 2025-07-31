(in-package :hashtable-test/tests)

(def-suite hashmap-tests
  :description "Tests for different hashtable implementations.")

(in-suite hashmap-tests)

(test cl-hashmap-test
  "Tests the cl-hashmap implementation."
  (let ((map (hashmap-create :cl-hashtable)))
    ;; Can we create a hashmap correctly?
    (is (typep map 'hashtable-test:cl-hashmap)
        "hashmap-create should return an object of type HASHTABLE-TEST:CL-HASHTABLE.")

    (is (not (null map)) "hashmap-create should return a non-nil object.")

    ;; Can we add a value in the map and read it?
    (hashmap-add map "one" 1)

    (is (equal 1 (hashtable-test:hashmap-get map "one"))
        "hashmap-get should retrieve the correct value after add.")


    ;; Same with more data
    (hashmap-add map "two" 2)

    (is (equal 2 (hashtable-test:hashmap-get map "two"))
        "hashmap-get should retrieve the correct value after add.")

    (hashmap-add map "three" 3)

    (is (equal 3 (hashtable-test:hashmap-get map "three"))
        "hashmap-get should retrieve the correct value after add.")


    (hashmap-add map "four" 4)

    (is (equal 4 (hashtable-test:hashmap-get map "four"))
        "hashmap-get should retrieve the correct value after add.")

    ;; Can we delete an entry?
    (finishes (hashmap-delete map "four"))

    (is (equal nil (hashtable-test:hashmap-get map "four"))
        "hashmap-get should retrieve the correct value after add.")

    ;; What happens when we try to delete a non existant entry?
    (finishes (hashmap-delete map "five"))

    ;; What happens when we try to fetch a non existant entry
    (is (equal nil (hashmap-get map "six")))

    ;; Does hashmap-iterate work as expected?
    (let ((keys '())
          (values '()))
      (hashmap-iterate map (lambda (key value)
                             (push key keys)
                             (push value values)))
      (is (equal (sort (copy-list keys) #'string<)
                 (sort (list "one" "two" "three") #'string<))
          "hashmap-iterate should visit all keys.")
      (is (equal (sort (copy-list values) #'<)
                 (sort (list 1 2 3) #'<))
          "hashmap-iterate should visit all values."))

    ;; Can we succesfully clear the map?
    (finishes (hashmap-clear map))

    (let ((counter 0))
      (hashmap-iterate map (lambda (key value) (incf counter)))
      (is (equal 0 counter)))



    ))

(defun run-all ()
  (run! 'hashmap-tests))
