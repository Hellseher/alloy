#|
 This file is a part of Alloy
 (c) 2019 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.alloy)

(defclass fixed-layout (layout vector-container)
  ())

(defmethod (setf bounds) ((bounds extent) (layout fixed-layout))
  (do-elements (element layout)
    (setf (bounds element) (bounds element))))

(defmethod notice-bounds ((element layout-element) (layout fixed-layout))
  ;; Calculate max bound
  (cond ((= 1 (element-count layout))
         (setf (slot-value layout 'bounds) (bounds element)))
        (T
         (destructure-extent (:x lx :y ly :w lw :h lh :to-px T) (bounds layout)
           (destructure-extent (:x ex :y ey :w ew :h eh :to-px T) (bounds element)
             (let ((l (min lx ex))
                   (b (min ly ey))
                   (r (max (+ lx lw) (+ ex ew)))
                   (u (max (+ ly lh) (+ ey eh))))
               (setf (slot-value layout 'bounds)
                     (px-extent l b (- r l) (- u b)))))))))

(defmethod suggest-bounds (extent (layout fixed-layout))
  extent)

(defmethod enter ((element layout-element) (layout fixed-layout) &key x y w h extent)
  (call-next-method)
  (let ((e (bounds element)))
    (when (layout-tree layout)
      (with-unit-parent layout
        (setf (bounds element)
              (px-extent (or x (when extent (extent-x extent)) (extent-x e))
                         (or y (when extent (extent-y extent)) (extent-y e))
                         (or w (when extent (extent-w extent)) (extent-w e))
                         (or h (when extent (extent-h extent)) (extent-h e))))))
    element))

(defmethod leave :after ((element layout-element) (layout fixed-layout))
  (when (= 0 (element-count layout))
    (setf (slot-value layout 'bounds) (px-extent))))

(defmethod update ((element layout-element) (layout fixed-layout) &key x y w h extent)
  (call-next-method)
  (let ((e (bounds element)))
    (with-unit-parent layout
      (setf (bounds element)
            (px-extent (or x (when extent (extent-x extent)) (extent-x e))
                       (or y (when extent (extent-y extent)) (extent-y e))
                       (or w (when extent (extent-w extent)) (extent-w e))
                       (or h (when extent (extent-h extent)) (extent-h e)))))
    element))

(defmethod ensure-visible :before ((element layout-element) (layout fixed-layout))
  ;; Find parent
  (loop until (or (eq layout (layout-parent element))
                  (eq element (layout-parent element)))
        do (setf element (layout-parent element)))
  (when (eq layout (layout-parent element))
    ;; Shuffle to ensure element is last, and thus drawn on top.
    (rotatef (aref (elements layout) (1- (length (elements layout))))
             (aref (elements layout) (position element (elements layout))))))
