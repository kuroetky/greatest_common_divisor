#!/bin/sh

# /* 関数 */
# 小数判定
IsDecimal(){
  P1=0

  # 文字列の長さが0より大きい
  if [ ! -z $1 ]; then
    P1=$1
  fi 
  
  expr $P1 + 1 > /dev/null 2>&1
  RET=$?
 
  if [ $RET -gt 1 ];then
    echo "ERROR : argument is not integer"
    exit 1
  fi
}

# /* 変数 */
NUM1=$1
NUM2=$2
TEP=0

# /* 引数の判定処理 */
# 引数の数
if [ $# -ne 2 ]; then
  echo "ERROR : argument number is invalid !!"
  exit 1
fi

# 整数判定
IsDecimal $NUM1
IsDecimal $NUM2

# 自然数判定
if [ $NUM1 -lt 1 ] || [ $NUM2 -lt 1 ]; then
  echo "ERROR : argument is not natural number!!"
  exit 1
fi

# ユークリッドの互除法による計算
if [ $NUM1 -lt $NUM2 ]; then
  TMP=$NUM1
  NUM1=$NUM2
  NUM2=$TMP
fi


R=$((NUM1%NUM2))
while [ $R -ne 0 ]
do
  NUM1=$NUM2
  NUM2=$R
  R=$((NUM1%NUM2))
done

echo "Greatest common is ${NUM2}"
exit

