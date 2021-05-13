CheckAssertionFailed := Exception clone

Assertion := Object clone do(
    name := nil
    code := nil
    failMessage := ""
    run := nil
    result := method(
      try(
        isValid := run()
        if(isValid,
          nil, 
          CheckAssertionFailed raise("Assertion " .. code .. " was failed! " .. failMessage)
          )
        )
      )
    )
Assertion assert := method( 
    assertion := Assertion clone
    assertion code := call message code
    assertion caller := call sender
    assertion msg := call message argAt(0)
    assertion run := method(caller doMessage(msg))
    assertion
    )

Object assert := Assertion getSlot("assert")

Sequence in := method(assertion, 
    assertion name = call target
    assertion
    )

Suite := Object clone
Suite runTest := method(assertion,
    name := assertion name
    result := assertion result
    if(result == nil,
      ("+ " .. name .. " is ok") println, 
      ("- " .. name .. " is failed:\n" .. result) println
      )   
    )
Suite runAll := method(
      call evalArgs foreach(a, runTest(a))
      )
