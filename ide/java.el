(setq defer-loading-jde t)
(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))

;; ident space
(defun my-jde-mode-hook ()
  (progn
    (setq c-basic-offset 2)
    (cscope:hook)))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;;'(jde-make-args "" nil nil "all"))
;; '(jde-bug-jpda-directory "e:/j2skd141/jre/bin")
;; '(jde-debugger (quote ("JDEbug")))
(setq jde-sourcepath '("/home/zw/code/java"))
;; default is javac server, which output messy code when javac's output is Chinese, so change it to javac
'(jde-compiler '("javac" ""))
;; ×Ô¶¯²¹Æë
(setq jde-enable-abbrev-mode t)

(setq jde-mode-abbreviations (quote (("ab" . "abstract") ("bo" . "boolean") ("br" . "break") ("by" . "byte") ("byv" . "byvalue") ("cas" . "cast") ("ca" . "catch") ("ch" . "char") ("cl" . "class") ("co" . "const") ("con" . "continue") ("de" . "default") ("dou" . "double") ("el" . "else") ("ex" . "extends") ("fa" . "false") ("fi" . "final") ("fin" . "finally") ("fl" . "float") ("fo" . "for") ("fu" . "future") ("ge" . "generic") ("go" . "goto") ("impl" . "implements") ("impo" . "import") ("ins" . "instanceof") ("in" . "int") ("inte" . "interface") ("lo" . "long") ("na" . "native") ("ne" . "new") ("nu" . "null") ("pa" . "package") ("pri" . "private") ("pro" . "protected") ("pu" . "public") ("re" . "return") ("sh" . "short") ("st" . "static") ("su" . "super") ("sw" . "switch") ("sy" . "synchronized") ("th" . "this") ("thr" . "throw") ("thro" . "throws") ("tra" . "transient") ("tr" . "true") ("vo" . "void") ("vol" . "volatile") ("wh" . "while") ("sysout" . "System.out.println("))))
