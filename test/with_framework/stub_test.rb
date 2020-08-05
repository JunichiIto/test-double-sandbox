require 'minitest/autorun'

module WithFramework
  class StubTest < Minitest::Test
    # このメソッドはstubに置き換えられるため、実際には呼ばれない
    def 外部メソッド
      raise "Don't call me!"
    end

    def テスト対象
      # ...
      answer = 外部メソッド
      # ...
      answer * 2
    end

    def test_テストコード
      stub(:外部メソッド, 100) do
        期待値 = 200
        assert_equal 期待値, テスト対象
      end
    end
  end
end
