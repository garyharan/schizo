defmodule SchizoTest do
  use ExUnit.Case

  test "uppercase doesn't change the first word" do
    assert(Schizo.uppercase("foo") == "foo")
  end

  test "uppercase converst the second word to uppercase" do
    assert(Schizo.uppercase("foo bar") == "foo BAR")
  end

  test "uppercase converts every other word to uppercase" do
    assert(Schizo.uppercase("foo bar baz") == "foo BAR baz")
  end

  test "unvowel doesn't change the first word" do
    assert(Schizo.unvowel("foo") == "foo")
  end

  test "unvowel converst the second word to uppercase" do
    assert(Schizo.unvowel("foo bar") == "foo br")
  end

  test "unvowel every other word to uppercase" do
    assert(Schizo.unvowel("foo bar baz wee") == "foo br baz w")
  end
end
