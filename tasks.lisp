
(in-package #:tables)

;;; Define some tasks

(defprocess my-task-1
  :states
  ((i 1 (setf i s))
   (s (+ i (reduce #'+ (rest $node)))))
  :new-node
  (if (= (1- s) i)
        `(,(format nil "~A" i) ,@$node)
        `(,(format nil "~A-~A" i (1- s)) ,@$node)))
