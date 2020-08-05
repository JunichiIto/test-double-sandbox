require 'minitest/autorun'
require 'spy/integration'

module WithFramework
  class SpyTest < Minitest::Test
    # このメソッドはspyに置き換えられるため、実際には呼ばれない
    def 外部メソッド(input)
      raise "Don't call me!"
    end

    def テスト対象
      # ...
      x = 100
      外部メソッド(x)
      # ...
    end

    def test_テストコード
      Spy.on(self, :外部メソッド)
      テスト対象
      期待値 = 100
      assert_received_with self, :外部メソッド, 期待値
    end
  end
end
