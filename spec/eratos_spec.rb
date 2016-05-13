require 'rspec'


require_relative '../eratos'

describe '素数探索' do

  # eratosthenesの引数は2以上の整数を前提にしているので、それ以外が渡された場合の振る舞いは不定とする。
  # よってspecはコメントに。
  # it { expect {PrimeNumber.eratosthenes("a")}.to raise_error(ArgumentError) }
  # it { expect {PrimeNumber.eratosthenes(1)}.to raise_error(ArgumentError) }
  # it { expect(PrimeNumber.eratosthenes(5.5)).to eq [2, 3, 5] }

  it { expect(PrimeNumber.eratosthenes(2)).to eq [2] }
  it { expect(PrimeNumber.eratosthenes(30)).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }

  it { expect(PrimeNumber.eratosthenes2(2)).to eq [2] }
  it { expect(PrimeNumber.eratosthenes2(30)).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }

  require 'benchmark'
  # 素朴実装: 1.1秒
  result = Benchmark.realtime { PrimeNumber.eratosthenes(100_000) }
  puts "処理概要1 #{result} 秒"

  # 2の倍数をあらかじめ除去しておくと: 0.3秒
  result = Benchmark.realtime { PrimeNumber.eratosthenes2(100_000) }
  puts "処理概要2 #{result} 秒"

end