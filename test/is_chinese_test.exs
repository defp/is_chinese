defmodule IsChineseTest do
  use ExUnit.Case
  doctest IsChinese

  test "verify? function" do
    assert IsChinese.verify?("你好")  == true
    assert IsChinese.verify?("a你好")  == false
    assert IsChinese.verify?("abc")  == false
    assert IsChinese.verify?("中国ssabc")  == false
    assert IsChinese.verify?("一") == true
  end
end
