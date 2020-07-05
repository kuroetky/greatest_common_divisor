#!/bin/sh

# /////////////////
# // 関数
# /////////////////

# エラー表示
ERROR_EXIT () {
  echo "$1" >&2
  rm -f /tmp/$$-test*
  exit 1
}


# /////////////////
# // テスト本体
# /////////////////

# 1 正常テスト
# 引数同じ
./calc.sh 1 1 >> /tmp/$$-test || ERROR_EXIT "test error 1-1" 
# 引数大小逆
./calc.sh 4 2 >> /tmp/$$-test || ERRPR_EXIT "test eror 1-2"
# 引数最大値 
./calc.sh 4 128 >> /tmp/$$-test || ERRPR_EXIT "test eror 1-3"
./calc.sh 4 516 >> /tmp/$$-test || ERRPR_EXIT "test eror 1-4"
./calc.sh 4 1028 >> /tmp/$$-test || ERRPR_EXIT "test eror 1-5"

# 2 異常テスト
# 引数なし
./calc.sh >> /tmp/$$-test ||  ERROR_EXIT "test error 2-1"
# 引数1つ
./calc.sh 2 >> /tmp/$$-test ||  ERROR_EXIT "test error 2-2"
# 引数3つ
./calc.sh 2 4 8 >> /tmp/$$-test ||  ERROR_EXIT "test error 2-3"

# 引数が負の数
./calc.sh -1 2 >> /tmp/$$-test || ERRPR_EXIT "test eror 2-4"
./calc.sh 1 -2 >> /tmp/$$-test || ERRPR_EXIT "test eror 2-5"

# 引数が小数
./calc.sh 1.2 2 >> /tmp/$$-test || ERRPR_EXIT "test eror 2-6"
./calc.sh 2 1.2 >> /tmp/$$-test || ERRPR_EXIT "test eror 2-7"

# 引数が文字列
./calc.sh aa 2 >> /tmp/$$-test || ERRPR_EXIT "test eror 2-8"
./calc.sh 2 aa >> /tmp/$$-test || ERRPR_EXIT "test eror 2-9"
