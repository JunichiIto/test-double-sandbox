require 'minitest/autorun'

class SpyTest < Minitest::Test
  # Test Spyとして動作する代替関数
  def 外部メソッド(input)
    @間接出力値 = input
  end

  def テスト対象
    # ...
    x = 100
    外部メソッド(x)
    # ...
  end

  def test_テストコード
    テスト対象
    期待値 = 100
    assert_equal 期待値, @間接出力値 # Test Spyに記録させておいた間接出力値を比較検証する
  end
end
