*"* use this source file for your ABAP unit test classes
CLASS lcl_about_abapunit DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      "! We shall contemplate truth by testing reality, via asserts.
      assert_true FOR TESTING,
      "! Sometimes we will ask you to fill in the values.
      fill_in_values FOR TESTING,
      "! Ensure the validity of the reference
      assert_bound FOR TESTING,
      "! Ensure that character string fits to simple pattern
      assert_char_cp FOR TESTING,
      "! Ensure that character string does not fit to simple pattern
      assert_char_np FOR TESTING,
      "! Ensure that data objects have distinct values
      assert_differs FOR TESTING,
      "! Ensure equality of two data objects
      assert_equals  FOR TESTING,
      "! Ensure approximate consistency of 2 floating point numbers
      assert_equals_float FOR TESTING,
      "! Ensure that boolean equals ABAP_FALSE
      assert_false  FOR TESTING,
      "! Ensure that data object value is initial
      assert_initial  FOR TESTING,
      "! Ensure invalidity of the reference of a reference variable
      assert_not_bound  FOR TESTING,
      "! Ensure that value of data object is not initial
      assert_not_initial  FOR TESTING,
      "! Ensure that number is in given range
      assert_number_between  FOR TESTING,
      "! Ensure specific value of return code
      assert_subrc  FOR TESTING,
      "! Ensure that data is contained as line within internal table
      assert_table_contains  FOR TESTING,
      "! Ensure that data is not contained as line in internal table
      assert_table_not_contains  FOR TESTING,
      "! Ensure that text matches regular expression
      assert_text_matches FOR TESTING,
      "! Ensure that a constraint is met by data object
      assert_that  FOR TESTING.

    CONSTANTS:
       default_control_flow TYPE aunit_flowctrl VALUE if_aunit_constants=>class.

ENDCLASS.

CLASS lcl_about_abapunit IMPLEMENTATION.

  METHOD assert_bound.
    DATA: book_ref TYPE REF TO cl_book_ppf.

    cl_abap_unit_assert=>assert_bound(
      act              = book_ref
      msg              = |Sometimes you need to make some Objects alive... Just think about the reference|
      quit             = default_control_flow ).

  ENDMETHOD.

  METHOD assert_char_cp.

    cl_abap_unit_assert=>assert_char_cp(
      act              = |abcd|
      exp              = || "this should be replaced properly
      msg              = 'Sometimes you need to make some Objects alive... Just think about the reference'
      quit             = default_control_flow ) .

  ENDMETHOD.

  METHOD assert_char_np.

    cl_abap_unit_assert=>assert_char_np(
      act  = ||
      exp  = || "this should be replaced properly
      msg  = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_differs.

    cl_abap_unit_assert=>assert_differs(
      act              = ||
      exp              = || "this should be replaced properly
      msg              = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_equals.

    cl_abap_unit_assert=>assert_equals(
      act =  1
      exp =  || "this should be replaced properly
      msg  = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_equals_float.
    DATA: float_value TYPE decfloat16 VALUE '1.9'.

    cl_abap_unit_assert=>assert_equals_float(
      act  =  float_value
      exp  =  CONV decfloat16( 2 ) "this should be replaced properly
      msg  = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_false.

    cl_abap_unit_assert=>assert_false(
      act  =  |X|  "this should be replaced properly
      msg  =  ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_initial.

    cl_abap_unit_assert=>assert_initial(
      act  = |X|  "this should be replaced properly
      msg  = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_not_bound.
    DATA: book_ref TYPE REF TO cl_book_ppf.

    book_ref = NEW #( ). "Here should something be done

    cl_abap_unit_assert=>assert_not_bound(
      act  =  book_ref
      msg  =  ||
      quit = default_control_flow ) .

  ENDMETHOD.

  METHOD assert_not_initial.

    cl_abap_unit_assert=>assert_not_initial(
      act  =  || "this should be replaced properly
      msg  =  ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_number_between.

    cl_abap_unit_assert=>assert_number_between(
      lower  = 1
      upper  = 3
      number = 4 "this should be replaced properly
      msg    = ||
      quit   = default_control_flow ).

  ENDMETHOD.

  METHOD assert_subrc.

    cl_abap_unit_assert=>assert_subrc(
      exp  = 1
      act  = sy-subrc "this should be replaced properly
      msg  = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_table_contains.
    TYPES tyt_integer TYPE TABLE OF i WITH NON-UNIQUE KEY table_line.
    DATA(dref) = NEW tyt_integer( ( 1 ) ( 2 ) ( 3 ) ).
    ASSIGN dref->* TO FIELD-SYMBOL(<itab>).

    cl_abap_unit_assert=>assert_table_contains(
      line  = || "this should be replaced properly
      table = <itab>
      msg   = ||
      quit  = default_control_flow ).

  ENDMETHOD.

  METHOD assert_table_not_contains.
    TYPES tyt_integer TYPE TABLE OF i WITH NON-UNIQUE KEY table_line.
    DATA(dref) = NEW tyt_integer( ( 1 ) ( 2 ) ( 3 ) ).
    ASSIGN dref->* TO FIELD-SYMBOL(<itab>).

    cl_abap_unit_assert=>assert_table_not_contains(
      line             = 3 "this should be replaced properly
      table            = <itab>
      msg              = ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_text_matches.

    cl_abap_unit_assert=>assert_text_matches(
        pattern          = |\\D|
        text             = |123| "this should be replaced properly
        msg              = ||
        quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_that.
    DATA(abap_koans_constraint) = NEW lcl_koans_demo_constraint( ).

    cl_abap_unit_assert=>assert_that(
      act              =   || "this should be replaced properly
      exp              =   abap_koans_constraint
      msg              =   ||
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD assert_true.

    cl_abap_unit_assert=>assert_true(
      act  = || "this should be replaced properly
      msg  = |The \|\| are an attempt to communicate the need to fill in an answer|
      quit = default_control_flow ).

  ENDMETHOD.

  METHOD fill_in_values.

    cl_abap_unit_assert=>assert_equals(
      exp  = 1 + 1
      act  = VALUE i(  ) "this should be replaced properly
      quit = default_control_flow ).

  ENDMETHOD.

ENDCLASS.