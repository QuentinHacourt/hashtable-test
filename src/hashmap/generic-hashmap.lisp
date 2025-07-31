(in-package #:hashtable-test)

(defgeneric hashmap-create (implementation)
  (:documentation "Create a hashmap of a given implementation."))

(defgeneric hashmap-add (hashmap key value)
  (:documentation "Adds a new entry into a given hashmap."))

(defgeneric hashmap-get (hashmap key)
  (:documentation "Get value for a given key."))

(defgeneric hashmap-delete (hashmap key)
  (:documentation "Deletes an entry given a key."))

(defgeneric hashmap-clear (hashmap)
  (:documentation "Clears a given hashmap of all it's content."))

(defgeneric hashmap-iterate (hashmap function)
  (:documentation "Call function with (key value) for each entry."))
