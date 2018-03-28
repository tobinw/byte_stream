include (CTest)

function(easy_test name file)
  add_executable(${name} ${file})
  add_test(NAME ${name} COMMAND "./" ${test_parameters})
endfunction(easy_test)


easy_test(byte_test test.cc)