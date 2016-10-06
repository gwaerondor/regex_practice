-module(string_tests).

-record(test, {testcase, input, action, expected}).

assertEqual(Expected, Result) ->
    Expected = Result.

string_can_be_reversed_test() ->
    Testcase = "Check that string can be reversed",
    Input = "Reversed text!",
    Expected = "!txet desreveR",
    Result = stringlib:reverse(Input),
    assertEqual(Expected, Result),
    success(Testcase).

string_can_be_capitalised_test() ->
    Test = #test{
	      testcase   = "Check that strings can be converted to upper case",
	      input      = "capitalise me plz",
	      action     = to_upper,
	      expected   = "CAPITALISE ME PLZ"
	     },
    execute(Test).

string_can_be_converted_to_lower_case_test() ->
    TC="Check that strings can be converted to lower case",
    Input="WHY AM I SO LOUD?",
    Expected="why am i so loud?",
    Result=stringlib:to_lower(Input),
    assertEqual(Expected, Result),
    success(TC).

string_can_be_camel_cased() ->
    Tc             = "Check that strings can be camel cased",
    Input          = "I want to be a camel",
    Expected       = "iWantToBeACamel",
    Result         = stringlib:camel_case(Input),
    assertEqual(Expected, Result),
    success(Tc).

success(Testcase) ->
    io:format("Testcase passed: ~p~n", [Testcase]).

execute(Test) when is_record(test, Test) ->
    I = Test#test.input,
    A = Test#test.action,
    E = Test#test.expected,
    Result = stringlib:A(I),
    assertEqual(E, Result),
    success(Test#test.testcase).
