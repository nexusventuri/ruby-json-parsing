# frozen_string_literal: true

module Bench
  class Parsing
    def run(json_string, n)
      puts '**************************************************'
      puts '*                    Parsing                     *'
      puts '**************************************************'

      puts ''
      puts '## Benchmark'
      puts ''
      Benchmark.bm do |x|
        x.report('Parsing:') do
          n.times do |_y|
            JSON.parse(json_string)
          end
        end

        x.report('Oj Parsing:') do
          n.times do |_y|
            Oj.load(json_string)
          end
        end
      end

      puts ''
      puts '## IPS'
      puts ''

      Benchmark.ips do |x|
        x.report('Parsing:') do
          n.times do |_y|
            JSON.parse(json_string)
          end
        end

        x.report('Oj Parsing:') do
          n.times do |_y|
            Oj.load(json_string)
          end
        end
        x.compare!
      end

      puts ''
      puts '## Memory'
      puts ''

      Benchmark.memory do |x|
        x.report('Parsing:') do
          n.times do |_y|
            JSON.parse(json_string)
          end
        end

        x.report('Oj Parsing:') do
          n.times do |_y|
            Oj.load(json_string)
          end
        end
        x.compare!
      end
    end
  end
end
