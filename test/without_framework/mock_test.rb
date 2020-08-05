require 'minitest/autorun'

module WithoutFramework
  class MockTest < Minitest::Test
    # Mock Objectとして動作する代替関数
    def 外部メソッド(input)
      if @期待する間接出力値 == input
        @テスト成功フラグ = true
        return
      end
      @テスト成功フラグ = false
    end

    def テスト対象
      # ...
      x = 999
      外部メソッド(x)
      # ...
    end

    def test_テストコード
      @期待する間接出力値 = 999 # Mock内で比較に用いる期待値
      テスト対象
      assert @テスト成功フラグ # Mock内で検証した結果をチェック
    end
  end
end
