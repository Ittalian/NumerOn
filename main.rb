def yourTurn(comNum, yourClaim, order)
  eat = 0
  bite = 0
  comFirst = (comNum / 100) % 10
  comSecond = (comNum / 10) % 10
  comThird = comNum % 10
  yourClaimFirst = (yourClaim / 100) % 10
  yourClaimSecond = (yourClaim / 10) % 10
  yourClaimThird = yourClaim % 10
  comNums = []

  comNums[0] = comFirst
  comNums[1] = comSecond
  comNums[2] = comThird

  if comNums.include?(yourClaimFirst)
    if comNums[0] == yourClaimFirst
      eat += 1
    else
      bite += 1
    end
  end

  if comNums.include?(yourClaimSecond)
    if comNums[1] == yourClaimSecond
      eat += 1
    else
      bite += 1
    end
  end

  if comNums.include?(yourClaimThird)
    if comNums[2] == yourClaimThird
      eat += 1
    else
      bite += 1
    end
  end

  puts ""
  puts "あなたの宣言した数字は#{eat}イート#{bite}バイトです"
  puts ""
  
  if order == 1 && eat == 3
    puts "-----------------"
    puts "あなたの勝利です!"
    puts "-----------------"
    exit
  elsif order == 0 && eat == 3
    puts "あなたはリーチです"
    $yourReach = 1
  elsif eat != 3 && $comReach == 1
    puts "-------------"
    puts "COMの勝利です"
    puts "-------------"
    exit
  end
end

def comTurn(yourNum, comClaim, order)

  puts "---------------"
  puts "COMのターンです"
  puts "---------------"

  eat = 0
  bite = 0
  yourFirst = (yourNum / 100) % 10
  yourSecond = (yourNum / 10) % 10
  yourThird = yourNum % 10
  comClaimFirst = (comClaim / 100) % 10
  comClaimSecond = (comClaim / 10) % 10
  comClaimThird = comClaim % 10
  yourNums = []

  yourNums[0] = yourFirst
  yourNums[1] = yourSecond
  yourNums[2] = yourThird

  if yourNums.include?(comClaimFirst)
    if yourNums[0] == comClaimFirst
      eat += 1
    else
      bite += 1
    end
  end

  if yourNums.include?(comClaimSecond)
    if yourNums[1] == comClaimSecond
      eat += 1
    else
      bite += 1
    end
  end

  if yourNums.include?(comClaimThird)
    if yourNums[2] == comClaimThird
      eat += 1
    else
      bite += 1
    end
  end

  puts "COMは#{comClaim}と宣言しました(push Enter)"
  pushEnter = gets
  puts "COMの宣言した数字は#{eat}イート#{bite}バイトです"
  puts ""

  if order == 0 && eat == 3 #COMが後攻
    puts "-------------"
    puts "COMの勝利です"
    puts "-------------"
    exit
  elsif order == 1 && eat == 3 #あなたが後攻
    puts "warn:COMはリーチです"
    $comReach = 1
  elsif eat != 3 && $yourReach == 1 # あなたが先行で成功し、COMが失敗する
    puts "-----------------"
    puts "あなたの勝利です!"
    puts "-----------------"
    exit
  end
end


puts 'Game start!'
puts ''
puts 'あなたが使う3桁の数字を入力してください(重複なし)'

$comReach = 0
$yourReach = 0
level = 0
turn = 0 # 0:自分のターン 1:相手のターン

yourNum = gets.to_i
yourFirst = (yourNum / 100) % 10
yourSecond = (yourNum / 10) % 10
yourThird = yourNum % 10

while yourNum.to_s.length != 3
  puts "無効な数字です、もう1度入力してください"
  yourNum = gets.to_i
end

while yourFirst == yourSecond || yourSecond == yourThird || yourThird == yourFirst
  puts "数字が重複しています、もう1度入力してください"
  yourNum = gets.to_i
  yourFirst = (yourNum / 100) % 10
  yourSecond = (yourNum / 10) % 10
  yourThird = yourNum % 10
end

comFirst = rand(4..8)
comSecond = rand(0..4)
comThird = rand(8..10)

comNum = comFirst * 100 + comSecond * 10 + comThird

order = rand(2)
puts ""

if order == 0
  puts "あなたは先行です"
  puts ""
else
  puts "あなたは後攻です"
  puts ""
  
  comClaimFirst = rand(4..8)
  comClaimSecond = rand(0..4)
  comClaimThird = rand(8..10)

  comClaim = comClaimFirst * 100 + comClaimSecond * 10 + comClaimThird
  
  if comClaim 
  comTurn(yourNum, comClaim, order)
  level += 1
  end
end

while turn == 0
  
  puts "------------------"
  puts "あなたのターンです"
  puts "------------------"
  puts "数字を宣言してください(重複なし)"
  
  yourClaim = gets.to_i
  yourClaimFirst = (yourClaim / 100) % 10
  yourClaimSecond = (yourClaim / 10) % 10
  yourClaimThird = yourClaim % 10
  
  while yourClaim.to_s.length != 3
  puts "無効な数字です、もう1度入力してください"
  yourClaim = gets.to_i
  end

  while yourClaimFirst == yourClaimSecond || yourClaimSecond == yourClaimThird || yourClaimThird == yourClaimFirst
  puts "数字が重複しています、もう1度入力してください"
  yourClaim = gets.to_i
  yourClaimFirst = (yourClaim / 100) % 10
  yourClaimSecond = (yourClaim / 10) % 10
  yourClaimThird = yourClaim % 10
  end
  
  yourTurn(comNum, yourClaim, order)
  turn = 1

   while turn == 1
    # ここにif文(多分)
    comClaimFirst = rand(4..8)
    comClaimSecond = rand(0..4)
    comClaimThird = rand(8..10)

    comClaim = comClaimFirst * 100 + comClaimSecond * 10 + comClaimThird
     
     if level == 4
       comClaim = rand((yourNum / 100) % 10 * 100..(yourNum / 100) % 10 * 100 + 99)
     elsif level == 5
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10
     elsif level == 6
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 1
     elsif level == 7
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 2
     elsif level == 8
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 3
     elsif level == 9
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 4
     elsif level == 10
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 5
     elsif level == 11
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 6
     elsif level == 12
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 7
     elsif level == 13
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 8
     elsif level == 14
       comClaim = (yourNum / 100) % 10 * 100 + (yourNum / 10) % 10 * 10 + 9
     end
    comTurn(yourNum, comClaim, order)
    level += 1
    turn = 0
  end
end