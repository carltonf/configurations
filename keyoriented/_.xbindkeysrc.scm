;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Start of xbindkeys configuration ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This configuration is guile based.
;;   http://www.gnu.org/software/guile/guile.html
;; (Based online example)
;; 
;; This configuration try to simulate combo keys in ratpoison
;; ie Control+t top mapping
;;
;; It also allow to add or remove a key on the fly!


(define (display-n str)
    "Display a string then newline"
  (display str)
  (newline))


(define (top-binding)
  "top-level binding"

  (xbindkey-function '(control t) rat-binding)

  (xbindkey-function '(mod4 m)
                     (lambda ()
                       (display-n "switch to vmware")
                       (run-command "wmctrl -x -a vmware.Vmware"))))
                       


(define (reset-top-binding)
    "reset top binding"
  (display-n "reset top binding")
  (ungrab-all-keys)
  (remove-all-keys)
  (top-binding)
  (grab-all-keys))

(define (rat-binding)
    "ratpoison-like binding"
  (display "ratpoison-like binding")
  (ungrab-all-keys)
  (remove-all-keys)

  ;; close the current window
  (xbindkey-function '(control k)
                     (lambda ()
                       (display-n "close current window")
                       (run-command "wmctrl -c :ACTIVE: ")
                       (reset-top-binding)))

  ;; TODO send a key event to a window through command line
  ;; type twice C-t, would work, but you must add C-g to get C-t back
  ;; pass through
  ;; (xbindkey-function 't
  ;;                    (lambda ()
  ;;                      (display-n "pass through ")
  ;;                      (run-command "")
  ;;                      (reset-top-binding)))

  (xbindkey-function '(shift exclam)
                     (lambda ()
                       (display-n "open dmenu navigator")
                       (run-command "dmenu_run -nb White -fn '-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-standard' -i")
                       (reset-top-binding)))

  ;; demu_nav
  (xbindkey-function 'apostrophe
                     (lambda ()
                       (display-n "open dmenu navigator")
                       (run-command "dmenu_nav")
                       (reset-top-binding)))
  ;; firefox
  (xbindkey-function 'f
                     (lambda ()
                       (display-n "switch to firefox")
                       (run-command "wmctrl -x -a Navigator.Firefox")
                       (reset-top-binding)))
  ;; pdf reader
  (xbindkey-function 'r
                     (lambda ()
                       (display-n "switch to pdf reader")
                       (run-command "wmctrl -x -a evince.Evince")
                       (reset-top-binding)))
  ;; dictionary
  (xbindkey-function 'a
                     (lambda ()
                       (display-n "switch to dictionary")
                       (run-command "wmctrl -x -a goldendict.Goldendict")
                       (reset-top-binding)))
  ;; mail
  (xbindkey-function 'm
                     (lambda ()
                       (display-n "switch to mailbox")
                       (run-command "wmctrl -x -a Mail.Thunderbird")))

  ;; emacs
  (xbindkey-function 'e
                     (lambda ()
                       (display-n "switch to emacs")
                       (run-command "wmctrl -x -a emacs.Emacs")
                       (reset-top-binding)))
  ;; terminal
  (xbindkey-function 'c
                     (lambda ()
                       (display-n "switch to terminal")
                       (run-command "wmctrl -x -a gnome-terminal.Gnome-terminal")
                       (reset-top-binding)))

  (xbindkey-function '(control g) reset-top-binding)
  ;; (debug)
  (grab-all-keys))
                       



(top-binding)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End of xbindkeys configuration ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
