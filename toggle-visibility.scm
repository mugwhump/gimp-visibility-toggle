(define (script-fu-toggle-visibility img layer)
  (let* (
         (num-layers (car (gimp-image-get-layers img)))
         (all-layers (cadr (gimp-image-get-layers img)))
         (toggle-layer (vector-ref all-layers (- num-layers 2)))
         (is-visible (car (gimp-item-get-visible toggle-layer)))
         (becomes-visible (- 1 is-visible))
         )

    (gimp-item-set-visible toggle-layer becomes-visible)
    )
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
