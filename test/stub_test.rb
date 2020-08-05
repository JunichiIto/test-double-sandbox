require 'minitest/autorun'

class StubTest < Minitest::Test
  # Test Stubとして動作する代替関数
  def 外部メソッド
    @間接入力値
  end

  def テスト対象
    # ...
    answer = 外部メソッド
    # ...
    answer * 2
  end

  def test_テストコード()
    @間接入力値 = 100 # 外部メソッドがテストにとって望ましい値をテスト対象に返すようセット
    期待値 = 200
    assert_equal 期待値, テスト対象
  end
end
