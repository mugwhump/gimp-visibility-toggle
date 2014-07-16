(define (script-fu-toggle-visibility img layer)
  (gimp-message (car (gimp-image-get-filename img)))
  (gimp-message "AAAAAAAAAAAAAAA")
  )

(script-fu-register
  "script-fu-toggle-visibility"
  "Outline Text"                        ; Label
  "Creates a simple outline around\
  the selected text layer."             ; Description
  "Grayson Bartlet"
  "Fat Man License"
  "May 2014"
  ""                                    ; Works on all image types
  SF-IMAGE "Image" 0
  SF-DRAWABLE "Drawable" 0
;  SF-COLOR "Outline Color" '(255 255 255)     ; Default white
;  SF-VALUE "Outline Width (px)" "3"
;  SF-TOGGLE "Merge Text With Outline?" TRUE
)

(script-fu-menu-register "script-fu-toggle-visibility" "<Image>/Layer/Toggle")
