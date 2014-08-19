(define (script-fu-toggle-visibility img layer)
  (let* (
         (num-layers (car (gimp-image-get-layers img)))
         (all-layers (cadr (gimp-image-get-layers img)))
         (toggle-layer (vector-ref all-layers (- num-layers 2)))
         (is-visible (car (gimp-item-get-visible toggle-layer)))
         (becomes-visible (- 1 is-visible))
         (width (car (gimp-drawable-width toggle-layer)))
         (height (car (gimp-drawable-height toggle-layer)))
         )

    (begin
    (gimp-item-set-visible toggle-layer becomes-visible)
    (gimp-displays-flush)
    ))
  )

(script-fu-register
  "script-fu-toggle-visibility"
  "Toggle Visible"                        ; Label
  "Toggles visibility of 2nd-from-bottom layer."
  "Grayson Bartlet"
  "Fat Man License"
  "May 2014"
  ""                                    ; Works on all image types
  SF-IMAGE "Image" 0
  SF-DRAWABLE "Drawable" 0
)

(script-fu-menu-register "script-fu-toggle-visibility" "<Image>/Layer/Toggle")

(macro (define-layer-moving-function form) 
       (let* (
              (func-name (cadr form))
              (func-string (caddr form))
              (direction (cadddr form))
              (x-off (cadddr (cdr form)))
              (y-off (cadddr (cddr form)))
              )
       `(begin
        (gimp-message (symbol->string ,func-name))
        (define (func-name img layer) 
                (begin
                  (gimp-layer-translate layer ,x-off ,y-off)
                  (gimp-displays-flush))) 
        (gimp-message "defined")
        (script-fu-register
          (symbol->string ,func-name)
          (string-append "Translate layer " ,direction)                        ; Label
          (string-append "Moves current layer slightly " ,direction)                        
          "Grayson Bartlet"
          "Fat Man License"
          "May 2014"
          ""                                    ; Works on all image types
          SF-IMAGE "Image" 0
          SF-DRAWABLE "Drawable" 0
        )

        (script-fu-menu-register (symbol->string ,func-name) "<Image>/Layer/Toggle")
)))

(define-layer-moving-function 'script-fu-move-layer-up "script-fu-move-layer-up" "up" 0 -10)
;(define-layer-moving-function 'script-fu-move-layer-down "down" 0 10)
