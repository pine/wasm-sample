(module
  (memory 17
    (segment 4 "\10\00\10\00")
  )
  (export "memory" memory)
  (export "add" $add)
  (func $add (param $0 i32) (param $1 i32) (result i32)
    (local $2 i32)
    (i32.store offset=12
      (set_local $2
        (i32.sub
          (i32.load offset=4
            (i32.const 0)
          )
          (i32.const 16)
        )
      )
      (get_local $0)
    )
    (i32.store offset=8
      (get_local $2)
      (get_local $1)
    )
    (i32.add
      (i32.load offset=12
        (get_local $2)
      )
      (get_local $1)
    )
  )
)
