module Bench
  class CreationAndAccess
    def self.run(json_string, n)
      puts '**************************************************'
      puts '*                   Accessing                    *'
      puts '**************************************************'

      puts ''
      puts '## Benchmark'
      puts ''
      Benchmark.bm do |x|
        run_tests(json_string, n, x)
      end

      puts ''
      puts '## Ips'
      puts ''
      Benchmark.ips do |x|
        run_tests(json_string, n, x)
        x.compare!
      end

      puts ''
      puts '## Memory'
      puts ''
      Benchmark.memory do |x|
        run_tests(json_string, n, x)
        x.compare!
      end
    end

    def self.access(data)
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

    def self.hash_access(data)
      data["id"]
      data["name"]
      data["engine_name"]
      data["cc"]
      data["bhp"]
      data["acceleration"]
      data["mpg_combined"]
      data["tax_rate"]
      data["price"]
      data["full_name"]
      data["fuel_long"]
      data["fuel_long_simplified"]
      data["transmission_long"]
      data["doors"]
      data["doors_simplified"]
      data["basic_price_inc_vat"]
      data["fees"]
      data["basic_price"]
      data["best_price"]
      data["vat"]
      data["delivery_cost"]
      data["first_year_tax_rate"]
      data["simplified_name"]
      data["date_introduced"]
      data["date_discontinued"]
      data["co2_emissions"]
      data["top_speed"]
      data["kml_combined"]
      data["efficiency_label"]
      data["model_full_name"]
      data["model_slug"]
      data["make_slug"]
      data["model_name"]
      data["make_name"]
      data["on_the_market?"]
      data["fuel"]
      data["transmission"]
      data["discontinued?"]
      data["discontinued_recently?"]
      data["trim"]
      data["cap_options"]
      data["cap_options_rules"]
      data["option_rule_expressions"]
      data["cap_code"]
    end

    def self.run_tests(json_string, n, x)
      parsed = Oj.load(json_string)

      x.report('Hash gets:') do
        n.times do |y|
          hash_access(parsed)
        end
      end

      x.report('Ostruct gets:') do
        n.times do |y|
          struct = OpenStruct.new(parsed)
          access(struct)
        end
      end

      x.report('OO gets:') do
        n.times do |y|
          o_object = OpenObject.new(parsed)
          access(o_object)
        end
      end

      x.report('EO gets:') do
        n.times do |y|
          e_object = EnhancedOpenObject.new(parsed)
          access(e_object)
        end
      end

      x.report('PO gets:') do
        n.times do |y|
          p_object = PromiseOpenObject.new(parsed)
          access(p_object)
        end
      end

      x.report('PB gets:') do
        n.times do |y|
          b_object = PromiseOpenObject.new { parsed }
          access(b_object)
        end
      end
    end
  end
end
