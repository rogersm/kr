(load "~/dev/kr/kr.lisp")
(in-package "KR")


;;; Model data

(create-fresh-schema :top)
(create-fresh-schema :historical-event
               (:is-a :top))

(create-schema :historical-detail
               (:is-a :top))
(create-schema :who
               (:is-a :historical-detail))
(create-schema :when
               (:is-a :historical-detail))
(create-schema :why
               (:is-a :historical-detail))
(create-schema :how
               (:is-a :historical-detail))



(defun create-kb ()
  (let ((main-question '( :what "What did happen? "))
        (rest-of-questions (list '( :who "Who was involved? ")
                                 '( :when "When did happen? ")
                                 '( :why "Why did happen? "  )
                                 '( :how "How did happen? "  ))))
    (initialize-kr)
    (ask-and-add-fact-to-kb main-question rest-of-questions)))


(defun echo-and-read-line (string)
  (format t "~a" string)
  (read-line))

(defun gensym- (&optional x)
  (if (null x)
    (gensym)
    (gensym (concatenate 'string x "-"))))

(defun ask-and-add-fact-to-kb (main-question rest-of-questions)
  (let* ((string-fact (echo-and-read-line "Adding new fact...~%> "))
         (fact (gensym- string-fact)))
    (create-schema fact (:instance :historical-event))
    (set-value fact (first main-question) string-fact)
    (loop for (slot question) in rest-of-questions
          do (ask-and-add-to-kb fact slot question))
    (format t "Added fact: ~s~%" fact)
  fact))

(defun ask-and-add-to-kb (fact slot question)
  (let ((value (echo-and-read-line question)))
    (set-value fact slot value)
    value))



