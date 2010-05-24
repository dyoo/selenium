#lang scheme

(require "main.ss")

(current-selenium-config (create-selenium-config "*firefox" "http://www.google.com"))

(print-selenium-commands? #t)
(pause-on-selenium-command-failure? #t)
(ignore-selenium-command-timeouts? #t)

(sel-start)
(sel-open "/")
(sel-type "q" "untyped")
(sel-click "btnG")
(sel-wait-for-page-to-load "30000")
(sel-click "link=Home - Untyped")
(sel-wait-for-page-to-load "30000")
(printf "Untyped home page title ~s~n" (sel-get-title))

(printf "check ignore-selenium-command-timeouts?~n")
(sel-click "link=Portfolio")
(sel-wait-for-page-to-load "1")

(printf "check pause-on-selenium-command-failure?~n")
(sel-click "does-not-exist")

(printf "done~n")