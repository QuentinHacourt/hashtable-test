(defgeneric make-hash-table (implementation)
  "Create a hashmap of a given implementation.")

(defgeneric addhash (hashmap key value)
  "Adds a new entry into a given hashmap.")

(defgeneric gethash (hashmap key)
  "Get value for a given key.")

(defgeneric remhash (hashmap key)
  "Deletes an entry given a key.")

(defgeneric clrhash (hashmap)
  "Clears a given hashmap of all it's content.")

(defgeneric maphash (hashmap function)
  "Call function with (key value) for each entry.")
