defmodule ErrorHandlingBlogpostTest do
  @moduledoc """
  Running this test file will result in a lot of errors and failing tests and
  that is expected.  Most of these tests are about proving that certain
  combinations of errors and error handling are not compatible.

  This is just a way to organize the handlers (rescue, catch) against the
  triggers (raise, throw, etc).
  """
  use ExUnit.Case

  describe "catch/2" do
    # raise & catch - compatible
    test "is compatible with raise" do
      try do
        raise "raise error"
      catch
        :error, %RuntimeError{message: "raise error"} ->
          :ok
      end
    end

    # throw & catch - compatible
    test "is compatible with throw" do
      try do
        throw "throw error"
      catch
        :throw, "throw error" ->
          :ok
      end
    end

    # exit & catch - compatible
    test "is compatible with exit" do
      try do
        exit("exiting")
      catch
        :exit, "exiting" ->
          :ok
      end
    end

    # :erlang.error & catch - compatible
    test "is compatible with :erlang.error" do
      try do
        :erlang.error("erlang error")
      catch
        :error, "erlang error" ->
          :ok
      end
    end
  end


  describe "rescue/1" do
    # raise & rescue - compatible
    test "is compatible with raise" do
      try do
        raise "raise error"
      rescue
        e ->
          %RuntimeError{message: "raise error"} = e
          :ok
      end
    end

    # throw & rescue - not compatible
    test "is not compatible with throw" do
      try do
        throw "throw error"
      rescue
        _e ->
          # Never going to reach here
          nil
      end
    end

    # exit & rescue - not compatible
    test "is not compatible with exit" do
      try do
        exit("exiting")
      rescue
        _e ->
          # Never going to reach here
          nil
      end
    end

    # :erlang.error & rescue - compatible
    test "is compatible with :erlang.error" do
      try do
        :erlang.error("erlang error")
      rescue
        e ->
          %ErlangError{original: "erlang error"} = e
          :ok
      end
    end
  end


  describe "catch/1" do
    # raise & catch - not compatible
    test "is not compatible with raise" do
      try do
        raise "raise error"
      catch
        _e ->
          # Never going to reach here
          nil
      end
    end

    # throw & catch - compatible
    test "is compatible with throw" do
      try do
        throw "throw error"
      catch
        "throw error" ->
          :ok
      end
    end

    # exit & catch - not compatible
    test "is not compatible with exit" do
      try do
        exit("exiting")
      catch
        _e ->
          # Never going to reach here
          nil
      end
    end

    # :erlang.error & catch - not compatible
    test "is not compatible with :erlang.error" do
      try do
        :erlang.error("erlang error")
      catch
        _e ->
          # Never going to reach here
          nil
      end
    end
  end
end
