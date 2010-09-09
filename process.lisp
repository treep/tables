
(in-package #:tables)

;;; DSL for process tables
;;;
(defmacro with-process-table ((node table &key states) to-collect)
  `(loop :for ,node :in ,table
         ,@(apply #'append (each e states `(:for ,(first e) = ,(second e)
                                                 ,@(when (third e) `(:then ,(third e))))))
         :collect ,to-collect))

(defmacro defprocess (name &key before after new-node states)
  `(defun ,name (table)
     (dolist (process ',before)
       (setf table (funcall process table)))
     (let ((result
            (with-process-table ($node table :states ,states)
              ,new-node)))
       (dolist (process ',after)
         (setf result (funcall process result)))
       result)))

;;; Apply several processes to table.
;;;
(defun process (table &rest processes)
  (let ((result table))
    (dolist (process processes)
      (setf result (funcall process result)))
    result))
