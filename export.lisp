
(in-package #:tables)

;;; Exporting to HTML

(defun table-to-html-string (table)
  (with-html-output-to-string (out)
    (:html
     (:body
      (:table
       (loop :for node :in table
         :do (htm (:tr (loop :for element :in node
                             :do (htm (:td (fmt "~A" (escape-string (de-string (write-to-string element)))))))))))))))

(defun export-table-to-html (table pathname)
  (write-string-into-file
   (table-to-html-string table)
   pathname)
  (values))

(defun convert-tbl-to-html (tbl-pathname html-pathname &rest processes)
  (write-string-into-file
   (table-to-html-string
    (apply #'process (read-table-from-file tbl-pathname) processes))
   html-pathname)
  (values))
