#|
 This file is a part of Alloy
 (c) 2019 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(defpackage #:org.shirakumo.alloy.renderers.simple
  (:use #:cl)
  (:local-nicknames
   (#:alloy #:org.shirakumo.alloy))
  ;; presentation.lisp
  (:export
   #:default-presentation
   #:render-presentation
   #:merge-presentation
   #:merge-presentation-into
   #:presentation
   #:padding
   #:background-color
   #:border-color
   #:border-thickness
   #:text-color
   #:text-alignment
   #:text-direction
   #:text-size
   #:font-family
   #:font-variant
   #:font-weight
   #:font-stretch
   #:image-size
   #:image-fill
   #:image-alignment
   #:presentable-layout-element
   #:presentation
   #:presentable-layout-entry
   #:look-and-feel
   #:look-and-feel-renderer)
  ;; protocol.lisp
  (:export
   #:call-with-pushed-transforms
   #:clip
   #:translate
   #:scale
   #:rotate
   #:call-with-pushed-styles
   #:fill-color
   #:line-width
   #:fill-mode
   #:composite-mode
   #:font
   #:font-size
   #:line
   #:rectangle
   #:ellipse
   #:polygon
   #:text
   #:image
   #:size
   #:data
   #:clear
   #:request-font
   #:request-image
   #:color
   #:color-p
   #:copy-color
   #:r
   #:g
   #:b
   #:a
   #:font
   #:family
   #:style
   #:variant
   #:weight
   #:stretch
   #:image
   #:simple-renderer
   #:with-pushed-transforms
   #:with-pushed-styles)
  ;; transforms.lisp
  (:export
   #:matrix
   #:matrix-identity
   #:mat*
   #:transform
   #:clip-mask
   #:transform-matrix
   #:add-matrix
   #:simple-transformed-renderer
   #:make-default-transform)
  ;; style.lisp
  (:export
   #:style
   #:simple-styled-renderer
   #:make-default-style))
