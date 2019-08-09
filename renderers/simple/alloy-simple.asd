#|
 This file is a part of Alloy
 (c) 2019 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(asdf:defsystem alloy-simple
  :version "0.0.0"
  :license "zlib"
  :author "Nicolas Hafner <shinmera@tymoon.eu>"
  :maintainer "Nicolas Hafner <shinmera@tymoon.eu>"
  :description ""
  :homepage "https://github.com/Shirakumo/alloy"
  :serial T
  :components ((:file "package")
               (:file "protocol")
               (:file "style")
               (:file "transforms")
               (:file "presentation")
               (:module "look-and-feels"
                :components ((:file "gray")))
               (:file "documentation"))
  :depends-on (:documentation-utils
               :alloy)
  :in-order-to ((asdf:test-op (asdf:test-op :alloy-test))))
