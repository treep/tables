
(in-package #:tables)

;;; Tables representation -- is a lists marked with NODE and TABLE structures.
;;;
(defstruct (node
            (:constructor node (&rest elements))
            (:type list))
  (elements nil :type list))

(defstruct (table
            (:constructor table (&rest nodes))
            (:type list))
  (nodes nil :type list))

(declaim (inline i-element i-node))
(defun i-element (i node) (nth i (node-elements node)))
(defun i-node (i table) (nth i (table-nodes table)))

;;; Read tables from files.
;;;
(defun read-table-from-file (pathname &key (delimiter *delimiter*))
  (with-open-file (in pathname)
    (loop :for line = (read-line in nil nil) :while line
          :for splited-line = (split-sequence delimiter line :remove-empty-subseqs t)
          :when splited-line
          :collect (mapcar (compose #'eval #'read-from-string) splited-line))))
