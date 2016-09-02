(module
  (memory 17
    (segment 4 " \00\10\00")
    (segment 16 "Hello World!\n\00")
  )
  (export "memory" memory)
  (type $FUNCSIG$vi (func (param i32)))
  (import $alert "env" "alert" (param i32))
  (export "hello" $hello)
  (func $hello
    (call_import $alert
      (i32.const 16)
    )
  )
)
