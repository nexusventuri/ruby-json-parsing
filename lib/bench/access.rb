# frozen_string_literal: true

module Bench
  class Access
    attr_reader :parsed, :access_per_iteration
    def run(json_string, n, access_per_iteration:, hash_access:, hash_symbol_access:, creation:)
      puts '***************************************************'
      puts "*             Executing #{n} times".ljust(50) + '*'
      puts "*             Accessing #{access_per_iteration} times".ljust(50) + '*'
      puts '***************************************************'
      puts "params: hash_access #{hash_access}, hash_symbol_access: #{hash_symbol_access}, creation: #{creation}"
      @parsed = Oj.load(json_string)
      @struct = OpenStruct.new(parsed)
      @o_object = OpenObject.new(parsed)
      @e_object = EnhancedOpenObject.new(parsed)
      @p_object = PromiseOpenObject.new { parsed }
      @access_per_iteration = access_per_iteration

      puts ''
      puts '## Ips'
      puts ''
      Benchmark.ips do |x|
        run_reports(x, n, hash_access: hash_access, hash_symbol_access: hash_symbol_access, creation: creation)
        x.compare!
      end

      puts ''
      puts '## Memory'
      puts ''
      Benchmark.memory do |x|
        run_reports(x, n, hash_access: hash_access, hash_symbol_access: hash_symbol_access, creation: creation)
        x.compare!
      end
    end

    def run_reports(x, n, hash_access:, hash_symbol_access:, creation:)
      x.report('Hash gets:') do
        n.times do |_y|
          access_per_iteration.times do
            hash_access(parsed)
          end
        end
      end

      x.report('Ostruct gets:') do
        n.times do |_y|
          @struct = OpenStruct.new(parsed) if creation

          access_per_iteration.times do
            access(@struct)
            hash_access(@struct) if hash_access
            hash_symbol_access(@struct) if hash_symbol_access
          end
        end
      end

      x.report('OO gets:') do
        n.times do |_y|
          @o_object = OpenObject.new(parsed) if creation

          access_per_iteration.times do
            access(@o_object)
            hash_access(@o_object) if hash_access
            hash_symbol_access(@o_object) if hash_symbol_access
          end
        end
      end

      x.report('EO gets:') do
        n.times do |_y|
          @e_object = EnhancedOpenObject.new(parsed) if creation

          access_per_iteration.times do
            access(@e_object)
            hash_access(@e_object) if hash_access
            hash_symbol_access(@e_object) if hash_symbol_access
          end
        end
      end

      x.report('PO gets:') do
        n.times do |_y|
          if creation
            @p_object = PromiseOpenObject.new { parsed }
            @p_object.wait_for_response
          end

          access_per_iteration.times do
            access(@p_object)
            hash_access(@p_object) if hash_access
            hash_symbol_access(@p_object) if hash_symbol_access
          end
        end
      end
    end

    def access(data)
      data.id
      data.name
      data.engine_name
      data.cc
      data.bhp
      data.acceleration
      data.mpg_combined
      data.tax_rate
      data.price
      data.full_name
      data.fuel_long
      data.fuel_long_simplified
      data.transmission_long
      data.doors
      data.doors_simplified
      data.basic_price_inc_vat
      data.fees
      data.basic_price
      data.best_price
      data.vat
      data.delivery_cost
      data.first_year_tax_rate
      data.simplified_name
      data.date_introduced
      data.date_discontinued
      data.co2_emissions
      data.top_speed
      data.kml_combined
      data.efficiency_label
      data.model_full_name
      data.model_slug
      data.make_slug
      data.model_name
      data.make_name
      data.on_the_market?
      data.fuel
      data.transmission
      data.discontinued?
      data.discontinued_recently?
      data.trim
      data.cap_options
      data.cap_options_rules
      data.option_rule_expressions
      data.cap_code
    end

    def hash_access(data)
      data['id']
      data['name']
      data['engine_name']
      data['cc']
      data['bhp']
      data['acceleration']
      data['mpg_combined']
      data['tax_rate']
      data['price']
      data['full_name']
      data['fuel_long']
      data['fuel_long_simplified']
      data['transmission_long']
      data['doors']
      data['doors_simplified']
      data['basic_price_inc_vat']
      data['fees']
      data['basic_price']
      data['best_price']
      data['vat']
      data['delivery_cost']
      data['first_year_tax_rate']
      data['simplified_name']
      data['date_introduced']
      data['date_discontinued']
      data['co2_emissions']
      data['top_speed']
      data['kml_combined']
      data['efficiency_label']
      data['model_full_name']
      data['model_slug']
      data['make_slug']
      data['model_name']
      data['make_name']
      data['on_the_market?']
      data['fuel']
      data['transmission']
      data['discontinued?']
      data['discontinued_recently?']
      data['trim']
      data['cap_options']
      data['cap_options_rules']
      data['option_rule_expressions']
      data['cap_code']
    end

    def hash_symbol_access(data)
      data[:id]
      data[:name]
      data[:engine_name]
      data[:cc]
      data[:bhp]
      data[:acceleration]
      data[:mpg_combined]
      data[:tax_rate]
      data[:price]
      data[:full_name]
      data[:fuel_long]
      data[:fuel_long_simplified]
      data[:transmission_long]
      data[:doors]
      data[:doors_simplified]
      data[:basic_price_inc_vat]
      data[:fees]
      data[:basic_price]
      data[:best_price]
      data[:vat]
      data[:delivery_cost]
      data[:first_year_tax_rate]
      data[:simplified_name]
      data[:date_introduced]
      data[:date_discontinued]
      data[:co2_emissions]
      data[:top_speed]
      data[:kml_combined]
      data[:efficiency_label]
      data[:model_full_name]
      data[:model_slug]
      data[:make_slug]
      data[:model_name]
      data[:make_name]
      data[:on_the_market?]
      data[:fuel]
      data[:transmission]
      data[:discontinued?]
      data[:discontinued_recently?]
      data[:trim]
      data[:cap_options]
      data[:cap_options_rules]
      data[:option_rule_expressions]
      data[:cap_code]
    end
  end
end
