(let ((mystr "class MyClass:"))
  (string-match  mystr)
  (match-string 2 mystr))

(defun tl-get-object-name (type)
  (save-excursion
    (search-backward-regexp
     (concat
      "\\("
      (make-string python-indent-offset ?\s)
      "\\)*"
      type))
    (let ((line (buffer-substring-no-properties
		 (line-beginning-position) (line-end-position)))
	  (rgxp "\\(def\\|class\\) \\([_a-zA-Z0-9]*\\)\\((.*)\\)?:"))
      (string-match rgxp line)
      (match-string 2 line))))

(defun tl-goto-def ()
  (interactive)
  (let ((funcname (tl-get-object-name "def"))
	(classname (tl-get-object-name "class")))
    (message (concat
	      classname "." funcname))))
