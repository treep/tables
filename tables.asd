
#+nil
(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:oos 'asdf:load-op :split-sequence)
  (asdf:oos 'asdf:load-op :alexandria)
  (asdf:oos 'asdf:load-op :cl-who))

(defsystem :tables
  :depends-on (:split-sequence :alexandria :cl-who)
  :serial     t
  :components ((:file "package")
               (:file "utils")
               (:file "table")
               (:file "process")
               (:file "tasks")
               (:file "export")))
