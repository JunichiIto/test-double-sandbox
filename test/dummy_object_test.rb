require 'minitest/autorun'

class DummyObjectTest < Minitest::Test
  class Foo
  end

  def テスト対象(foo)
    10
  end

  def test_テストコード
    foo = Foo.new # Dummy Object
    期待値 = 10
    assert_equal 期待値, テスト対象(foo)
  end
end
