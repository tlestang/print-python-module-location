(let ((mystr "class MyClass:"))
  (string-match  mystr)
  (match-string 2 mystr))

(defun tl-goto-def ()
  (interactive)
  (save-excursion
    (search-backward-regexp
     (concat
      "\\("
      (make-string python-indent-offset ?\s)
      "\\)*def"))
    (let ((line (buffer-substring-no-properties
		 (line-beginning-position) (line-end-position)))
	  (rgxp "\\(def\\|class\\) \\([_a-zA-Z0-9]*\\)\\((.*)\\)?:"))
      (string-match rgxp line)
      (message (match-string 2 line)))))
