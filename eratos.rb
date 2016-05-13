# require 'active_support/core_ext/string/strip'


module PrimeNumber

  # 素数探索（エラトステネスの篩）
  # @param limit 探索する範囲（最大の整数）
  # @return [Array] 素数配列
  def self.eratosthenes(limit)
    # 探索リスト
    search_list = Array(2..limit)
    # p search_list

    # 探索結果（素数配列）
    primes = []

    # 最後に見つかった素数がコレを越えたら探索終了（残りは全て素数）
    root_limit = Math.sqrt(limit)

    loop do
      # 探索リストの先頭は必ず素数
      prime = search_list.shift
      primes << prime

      # primeが√limit を越えたら、残りは全て素数
      if root_limit < prime
        primes.concat(search_list)
        break
      end

      # primeの倍数を全て除去
      search_list.reject! { |i| i % prime == 0 }
    end

    primes
  end


  def self.eratosthenes2(limit)
    # 探索リスト
    search_list = []
    3.upto limit do |i|
      search_list << i if i.odd?
    end
    # p search_list

    # 探索結果（素数配列）
    primes = [2]

    # 最後に見つかった素数がコレを越えたら探索終了（残りは全て素数）
    root_limit = Math.sqrt(limit)

    while prime = search_list.shift do
      # 探索リストの先頭は必ず素数
      primes << prime

      # primeが√limit を越えたら、残りは全て素数
      if root_limit < prime
        primes.concat(search_list)
        break
      end

      # primeの倍数を全て除去
      search_list.reject! { |i| i % prime == 0 }
    end

    primes
  end


end

####################################################################
###
### Main
###
if $0 == __FILE__
  limit = 0
  if ARGV.size != 1 || (limit = ARGV[0].to_i) < 2
    puts "引数エラー"
    puts <<-"EOS"

素数探索スクリプト
USAGE:
   ruby #{File.basename($0)} {探索する最大の整数(2以上を指定)}
    EOS
    exit
  end

  puts PrimeNumber.eratosthenes(limit).join(", ")

end


