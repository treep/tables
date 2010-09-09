
(defpackage #:tables
  (:use     #:common-lisp
            #:split-sequence
            #:alexandria
            #:cl-who)
  (:export  #:*delimiter*
            ;; table
            #:node
            #:i-element
            #:i-node
            #:read-table-from-file
            ;; process
            #:with-process-table
            #:defprocess
            #:table
            #:node-elements
            #:table-nodes
            #:i-element
            #:i-node
            #:read-table-from-file
            ;; process
            #:with-process-table
            #:defprocess
            #:process
            ;; tasks
            #:my-task-1
            ;; export
            #:table-to-html-string
            #:export-table-to-html
            #:convert-tbl-to-html
            ))

(in-package #:tables)

(defparameter *delimiter* #\|)
