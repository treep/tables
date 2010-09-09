
(in-package #:tables)

;;; Control

(defun filter (p list)
  (mapcan #'(lambda (e) (and (funcall p e) (list e))) list))

(defmacro each (e list &rest forms)
  `(mapcar #'(lambda (,e) ,@forms) ,list))

(macrolet ((defun-each (name form)
             `(defun ,name (foo list) (each e list (,form foo e)))))
  (defun-each filter-each filter))

;;; Strings

(declaim (inline empty-string-p))
(defun empty-string-p (string) (string= string ""))

(defun subseq* (seq &optional n1 n2)
  (flet ((mod-index (n len)
           (cond ((> n len)      len)
                 ((< n (- len))  0)
                 ((< n 0)        (+ n len))
                 (t              n))))
    (let ((len (length seq)))
      (cond ((eql n1 NIL)                 seq)
            ((and (eql n1 'F) (eql n2 'F)) seq)
            ((eql n1 'F)   (subseq seq 0 (mod-index n2 len)))
            ((eql n2 'F)   (subseq seq (mod-index n1 len) len))
            ((eql n2 NIL)  (char seq (mod-index n1 len)))
            (t             (subseq seq (mod-index n1 len) (mod-index n2 len)))))))

(declaim (inline subseq*))
(defun de-string (string) 
  (if (char= (subseq* string 0) (subseq* string -1) #\")
      (subseq* string 1 -1)
      string))
