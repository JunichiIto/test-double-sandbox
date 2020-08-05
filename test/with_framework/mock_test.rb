require 'minitest/autorun'

module WithFramework
  class MockTest < Minitest::Test
    class Foo
      # このメソッドはmockに置き換えられるため、実際には呼ばれない
      def 外部メソッド(input)
        raise "Don't call me!"
      end
    end

    def テスト対象(foo)
      # ...
      x = 999
      foo.外部メソッド(x)
      # ...
    end

    def test_テストコード
      mock_foo = MiniTest::Mock.new
      モックの戻り値 = nil
      期待する間接出力値 = [999]
      mock_foo.expect(:外部メソッド, モックの戻り値, 期待する間接出力値)
      テスト対象(mock_foo)
      mock_foo.verify
    end
  end
end
