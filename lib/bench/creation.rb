module Bench
  class Creation
    def self.run(json_string, n)
      parsed = Oj.load(json_string)

      puts '**************************************************'
      puts '*                 Instatiating                   *'
      puts '**************************************************'
      puts ''
      puts '## Benchmark'
      puts ''
      Benchmark.bm do |x|
        x.report('Create Ostruct:') do
          n.times do |y|
            OpenStruct.new(parsed)
          end
        end

        x.report('Create OO:') do
          n.times do |y|
            OpenObject.new(parsed)
          end
        end

        x.report('Create EOO:') do
          n.times do |y|
            EnhancedOpenObject.new(parsed)
          end
        end

        x.report('P block:') do
          n.times do |y|
            PromiseOpenObject.new { parsed }
          end
        end

        x.report('P wait:') do
          n.times do |y|
            (PromiseOpenObject.new { parsed }).wait_for_response
          end
        end

        x.report('P data:') do
          n.times do |y|
            PromiseOpenObject.new(parsed)
          end
        end
      end

      puts ''
      puts '## IPS'
      puts ''

      Benchmark.ips do |x|
        x.report('Create Ostruct:') do
          n.times do |y|
            OpenStruct.new(parsed)
          end
        end
        x.report('Create OO:') do
          n.times do |y|
            OpenObject.new(parsed)
          end
        end
        x.report('Create EO:') do
          n.times do |y|
            EnhancedOpenObject.new(parsed)
          end
        end

        x.report('P block:') do
          n.times do |y|
            PromiseOpenObject.new { parsed }
          end
        end

        x.report('P wait:') do
          n.times do |y|
            (PromiseOpenObject.new { parsed }).wait_for_response
          end
        end

        x.report('P data:') do
          n.times do |y|
            PromiseOpenObject.new(parsed)
          end
        end
        x.compare!
      end

      puts ''
      puts '## Memory'
      puts ''

      Benchmark.memory do |x|
        x.report('Create Ostruct:') do
          n.times do |y|
            OpenStruct.new(parsed)
          end
        end

        x.report('Create OO:') do
          n.times do |y|
            OpenObject.new(parsed)
          end
        end

        x.report('Create EO:') do
          n.times do |y|
            EnhancedOpenObject.new(parsed)
          end
        end

        x.report('P block:') do
          n.times do |y|
            PromiseOpenObject.new { parsed }
          end
        end

        x.report('P wait:') do
          n.times do |y|
            (PromiseOpenObject.new { parsed }).wait_for_response
          end
        end

        x.report('P data:') do
          n.times do |y|
            PromiseOpenObject.new(parsed)
          end
        end

        x.compare!
      end

    end
  end
end
