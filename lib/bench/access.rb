module Bench
  class Access
    def self.run(json_string, n, access_times)
      puts '**************************************************'
      puts '*                   Accessing                    *'
      puts '**************************************************'
      parsed = Oj.load(json_string)
      struct = OpenStruct.new(parsed)
      o_object = OpenObject.new(parsed)
      e_object = EnhancedOpenObject.new(parsed)
      p_object = PromiseOpenObject.new(parsed)
      b_object = PromiseOpenObject.new { parsed }
      b_object.wait_for_response

      #puts ''
      #puts '## Ips'
      #puts ''
      #Benchmark.ips do |x|
      #  x.report('Hash gets:') do
      #    n.times do |y|
      #      access_times.times do
      #        hash_access(parsed)
      #      end
      #    end
      #  end

      #  x.report('Ostruct gets:') do
      #    n.times do |y|
      #      access_times.times do
      #        access(struct)
      #        hash_access(struct)
      #      end
      #    end
      #  end

      #  x.report('OO gets:') do
      #    n.times do |y|
      #      access_times.times do
      #        access(o_object)
      #        hash_access(o_object)
      #      end
      #    end
      #  end

      #  x.report('EO gets:') do
      #    n.times do |y|
      #      access_times.times do
      #        access(e_object)
      #        hash_access(e_object)
      #      end
      #    end
      #  end

      #  #x.report('PO gets:') do
      #  #  n.times do |y|
      #  #    access(p_object)
      #  #    hash_access(p_object)
      #  #  end
      #  #end

      #  #x.report('PB gets:') do
      #  #  n.times do |y|
      #  #    access(b_object)
      #  #    hash_access(b_object)
      #  #  end
      #  #end
      #  x.compare!
      #end

      puts ''
      puts '## Memory'
      puts ''
      Benchmark.memory do |x|
        x.report('Hash gets:') do
          n.times do |y|
            access_times.times do
              hash_access(parsed)
            end
          end
        end

        x.report('Ostruct gets:') do
          n.times do |y|
            access_times.times do
              access(struct)
              hash_access(struct)
            end
          end
        end

        x.report('OO gets:') do
          n.times do |y|
            access_times.times do
              access(o_object)
              hash_access(o_object)
            end
          end
        end

        x.report('EO gets:') do
          n.times do |y|
            access_times.times do
              access(e_object)
              hash_access(e_object)
            end
          end
        end

        #x.report('PO gets:') do
        #  n.times do |y|
        #    access(p_object)
        #    hash_access(p_object)
        #  end
        #end

        #x.report('PB gets:') do
        #  n.times do |y|
        #    access(b_object)
        #    hash_access(b_object)
        #  end
        #end
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
  end
end
