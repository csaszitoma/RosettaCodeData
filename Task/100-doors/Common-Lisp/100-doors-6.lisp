(let  ((i 0))
    (mapcar (lambda (x)
                (if (zerop (mod (sqrt (incf i)) 1))
                    "_" "#"))
            (make-list 100)))