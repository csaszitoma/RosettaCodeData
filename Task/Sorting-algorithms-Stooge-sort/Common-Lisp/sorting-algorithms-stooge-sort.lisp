(defun stooge-sort (vector &optional (i 0) (j (1- (length vector))))
  (when (> (aref vector i) (aref vector j))
    (rotatef (aref vector i) (aref vector j)))
  (when (> (- j i) 1)
    (let ((third (floor (1+ (- j i)) 3)))
      (stooge-sort vector i (- j third))
      (stooge-sort vector (+ i third) j)
      (stooge-sort vector i (- j third))))
  vector)
