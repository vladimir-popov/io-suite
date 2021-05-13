Suite runAll(
    "check that 2 == 2" in(
        assert(2 ==2)
    ),
    "check that 2 == 3" in(
      assert(2 == 3)
      ),
    "check with error" in(
      assert(Exception raise("test error"))    
      )
    )
