require 'ostruct'
require 'oj'
require 'benchmark'
require 'json'
require_relative 'open_object'
require_relative 'enhanced_open_object'

n = 10000

json_string = File.read('derivative_with_options.json')
parsed = Oj.load(json_string)
struct = OpenStruct.new(parsed)
o_object = OpenObject.new(parsed)
e_object = EnhancedOpenObject.new(parsed)

Benchmark.bm do |x|
  x.report('Parsing:') do
    n.times do |y|
      JSON.parse(json_string)
    end
  end

  x.report('Oj Parsing:') do
    n.times do |y|
      Oj.load(json_string)
    end
  end

  x.report('Hash gets:') do
    n.times do |y|
      parsed["id"]
      parsed["name"]
      parsed["engine_name"]
      parsed["cc"]
      parsed["bhp"]
      parsed["acceleration"]
      parsed["mpg_combined"]
      parsed["tax_rate"]
      parsed["price"]
      parsed["full_name"]
      parsed["fuel_long"]
      parsed["fuel_long_simplified"]
      parsed["transmission_long"]
      parsed["doors"]
      parsed["doors_simplified"]
      parsed["basic_price_inc_vat"]
      parsed["fees"]
      parsed["basic_price"]
      parsed["best_price"]
      parsed["vat"]
      parsed["delivery_cost"]
      parsed["first_year_tax_rate"]
      parsed["simplified_name"]
      parsed["date_introduced"]
      parsed["date_discontinued"]
      parsed["co2_emissions"]
      parsed["top_speed"]
      parsed["kml_combined"]
      parsed["efficiency_label"]
      parsed["model_full_name"]
      parsed["model_slug"]
      parsed["make_slug"]
      parsed["model_name"]
      parsed["make_name"]
      parsed["on_the_market?"]
      parsed["fuel"]
      parsed["transmission"]
      parsed["discontinued?"]
      parsed["discontinued_recently?"]
      parsed["trim"]
      parsed["cap_options"]
      parsed["cap_options_rules"]
      parsed["option_rule_expressions"]
      parsed["cap_code"]
    end
  end

  x.report('Create Ostruct:') do
    n.times do |y|
      OpenStruct.new(parsed)
    end
  end

  x.report('Ostruct gets:') do
    n.times do |y|
      struct.id
      struct.name
      struct.engine_name
      struct.cc
      struct.bhp
      struct.acceleration
      struct.mpg_combined
      struct.tax_rate
      struct.price
      struct.full_name
      struct.fuel_long
      struct.fuel_long_simplified
      struct.transmission_long
      struct.doors
      struct.doors_simplified
      struct.basic_price_inc_vat
      struct.fees
      struct.basic_price
      struct.best_price
      struct.vat
      struct.delivery_cost
      struct.first_year_tax_rate
      struct.simplified_name
      struct.date_introduced
      struct.date_discontinued
      struct.co2_emissions
      struct.top_speed
      struct.kml_combined
      struct.efficiency_label
      struct.model_full_name
      struct.model_slug
      struct.make_slug
      struct.model_name
      struct.make_name
      struct.on_the_market?
      struct.fuel
      struct.transmission
      struct.discontinued?
      struct.discontinued_recently?
      struct.trim
      struct.cap_options
      struct.cap_options_rules
      struct.option_rule_expressions
      struct.cap_code
    end
  end

  x.report('Create OO:') do
    n.times do |y|
      OpenObject.new(parsed)
    end
  end

  x.report('OO gets:') do
    n.times do |y|
      o_object.id
      o_object.name
      o_object.engine_name
      o_object.cc
      o_object.bhp
      o_object.acceleration
      o_object.mpg_combined
      o_object.tax_rate
      o_object.price
      o_object.full_name
      o_object.fuel_long
      o_object.fuel_long_simplified
      o_object.transmission_long
      o_object.doors
      o_object.doors_simplified
      o_object.basic_price_inc_vat
      o_object.fees
      o_object.basic_price
      o_object.best_price
      o_object.vat
      o_object.delivery_cost
      o_object.first_year_tax_rate
      o_object.simplified_name
      o_object.date_introduced
      o_object.date_discontinued
      o_object.co2_emissions
      o_object.top_speed
      o_object.kml_combined
      o_object.efficiency_label
      o_object.model_full_name
      o_object.model_slug
      o_object.make_slug
      o_object.model_name
      o_object.make_name
      o_object.on_the_market?
      o_object.fuel
      o_object.transmission
      o_object.discontinued?
      o_object.discontinued_recently?
      o_object.trim
      o_object.cap_options
      o_object.cap_options_rules
      o_object.option_rule_expressions
      o_object.cap_code
    end
  end

  x.report('Create EO:') do
    n.times do |y|
      EnhancedOpenObject.new(parsed)
    end
  end

  x.report('EO gets:') do
    n.times do |y|
      e_object.id
      e_object.name
      e_object.engine_name
      e_object.cc
      e_object.bhp
      e_object.acceleration
      e_object.mpg_combined
      e_object.tax_rate
      e_object.price
      e_object.full_name
      e_object.fuel_long
      e_object.fuel_long_simplified
      e_object.transmission_long
      e_object.doors
      e_object.doors_simplified
      e_object.basic_price_inc_vat
      e_object.fees
      e_object.basic_price
      e_object.best_price
      e_object.vat
      e_object.delivery_cost
      e_object.first_year_tax_rate
      e_object.simplified_name
      e_object.date_introduced
      e_object.date_discontinued
      e_object.co2_emissions
      e_object.top_speed
      e_object.kml_combined
      e_object.efficiency_label
      e_object.model_full_name
      e_object.model_slug
      e_object.make_slug
      e_object.model_name
      e_object.make_name
      e_object.on_the_market?
      e_object.fuel
      e_object.transmission
      e_object.discontinued?
      e_object.discontinued_recently?
      e_object.trim
      e_object.cap_options
      e_object.cap_options_rules
      e_object.option_rule_expressions
      e_object.cap_code
    end
  end
end

Benchmark.ips do |x|
  x.report('Parsing:') do
    n.times do |y|
      JSON.parse(json_string)
    end
  end

  x.report('Oj Parsing:') do
    n.times do |y|
      Oj.load(json_string)
    end
  end

  x.report('Hash gets:') do
    n.times do |y|
      parsed["id"]
      parsed["name"]
      parsed["engine_name"]
      parsed["cc"]
      parsed["bhp"]
      parsed["acceleration"]
      parsed["mpg_combined"]
      parsed["tax_rate"]
      parsed["price"]
      parsed["full_name"]
      parsed["fuel_long"]
      parsed["fuel_long_simplified"]
      parsed["transmission_long"]
      parsed["doors"]
      parsed["doors_simplified"]
      parsed["basic_price_inc_vat"]
      parsed["fees"]
      parsed["basic_price"]
      parsed["best_price"]
      parsed["vat"]
      parsed["delivery_cost"]
      parsed["first_year_tax_rate"]
      parsed["simplified_name"]
      parsed["date_introduced"]
      parsed["date_discontinued"]
      parsed["co2_emissions"]
      parsed["top_speed"]
      parsed["kml_combined"]
      parsed["efficiency_label"]
      parsed["model_full_name"]
      parsed["model_slug"]
      parsed["make_slug"]
      parsed["model_name"]
      parsed["make_name"]
      parsed["on_the_market?"]
      parsed["fuel"]
      parsed["transmission"]
      parsed["discontinued?"]
      parsed["discontinued_recently?"]
      parsed["trim"]
      parsed["cap_options"]
      parsed["cap_options_rules"]
      parsed["option_rule_expressions"]
      parsed["cap_code"]
    end
  end

  x.report('Create Ostruct:') do
    n.times do |y|
      OpenStruct.new(parsed)
    end
  end

  x.report('Ostruct gets:') do
    n.times do |y|
      struct.id
      struct.name
      struct.engine_name
      struct.cc
      struct.bhp
      struct.acceleration
      struct.mpg_combined
      struct.tax_rate
      struct.price
      struct.full_name
      struct.fuel_long
      struct.fuel_long_simplified
      struct.transmission_long
      struct.doors
      struct.doors_simplified
      struct.basic_price_inc_vat
      struct.fees
      struct.basic_price
      struct.best_price
      struct.vat
      struct.delivery_cost
      struct.first_year_tax_rate
      struct.simplified_name
      struct.date_introduced
      struct.date_discontinued
      struct.co2_emissions
      struct.top_speed
      struct.kml_combined
      struct.efficiency_label
      struct.model_full_name
      struct.model_slug
      struct.make_slug
      struct.model_name
      struct.make_name
      struct.on_the_market?
      struct.fuel
      struct.transmission
      struct.discontinued?
      struct.discontinued_recently?
      struct.trim
      struct.cap_options
      struct.cap_options_rules
      struct.option_rule_expressions
      struct.cap_code
    end
  end

  x.report('Create OO:') do
    n.times do |y|
      OpenObject.new(parsed)
    end
  end

  x.report('OO gets:') do
    n.times do |y|
      o_object.id
      o_object.name
      o_object.engine_name
      o_object.cc
      o_object.bhp
      o_object.acceleration
      o_object.mpg_combined
      o_object.tax_rate
      o_object.price
      o_object.full_name
      o_object.fuel_long
      o_object.fuel_long_simplified
      o_object.transmission_long
      o_object.doors
      o_object.doors_simplified
      o_object.basic_price_inc_vat
      o_object.fees
      o_object.basic_price
      o_object.best_price
      o_object.vat
      o_object.delivery_cost
      o_object.first_year_tax_rate
      o_object.simplified_name
      o_object.date_introduced
      o_object.date_discontinued
      o_object.co2_emissions
      o_object.top_speed
      o_object.kml_combined
      o_object.efficiency_label
      o_object.model_full_name
      o_object.model_slug
      o_object.make_slug
      o_object.model_name
      o_object.make_name
      o_object.on_the_market?
      o_object.fuel
      o_object.transmission
      o_object.discontinued?
      o_object.discontinued_recently?
      o_object.trim
      o_object.cap_options
      o_object.cap_options_rules
      o_object.option_rule_expressions
      o_object.cap_code
    end
  end

  x.report('Create EO:') do
    n.times do |y|
      EnhancedOpenObject.new(parsed)
    end
  end

  x.report('EO gets:') do
    n.times do |y|
      e_object.id
      e_object.name
      e_object.engine_name
      e_object.cc
      e_object.bhp
      e_object.acceleration
      e_object.mpg_combined
      e_object.tax_rate
      e_object.price
      e_object.full_name
      e_object.fuel_long
      e_object.fuel_long_simplified
      e_object.transmission_long
      e_object.doors
      e_object.doors_simplified
      e_object.basic_price_inc_vat
      e_object.fees
      e_object.basic_price
      e_object.best_price
      e_object.vat
      e_object.delivery_cost
      e_object.first_year_tax_rate
      e_object.simplified_name
      e_object.date_introduced
      e_object.date_discontinued
      e_object.co2_emissions
      e_object.top_speed
      e_object.kml_combined
      e_object.efficiency_label
      e_object.model_full_name
      e_object.model_slug
      e_object.make_slug
      e_object.model_name
      e_object.make_name
      e_object.on_the_market?
      e_object.fuel
      e_object.transmission
      e_object.discontinued?
      e_object.discontinued_recently?
      e_object.trim
      e_object.cap_options
      e_object.cap_options_rules
      e_object.option_rule_expressions
      e_object.cap_code
    end
  end
  x.compare!
end

Benchmark.memory do |x|
  x.report('Parsing:') do
    n.times do |y|
      JSON.parse(json_string)
    end
  end

  x.report('Oj Parsing:') do
    n.times do |y|
      Oj.load(json_string)
    end
  end

  x.report('Hash gets:') do
    n.times do |y|
      parsed["id"]
      parsed["name"]
      parsed["engine_name"]
      parsed["cc"]
      parsed["bhp"]
      parsed["acceleration"]
      parsed["mpg_combined"]
      parsed["tax_rate"]
      parsed["price"]
      parsed["full_name"]
      parsed["fuel_long"]
      parsed["fuel_long_simplified"]
      parsed["transmission_long"]
      parsed["doors"]
      parsed["doors_simplified"]
      parsed["basic_price_inc_vat"]
      parsed["fees"]
      parsed["basic_price"]
      parsed["best_price"]
      parsed["vat"]
      parsed["delivery_cost"]
      parsed["first_year_tax_rate"]
      parsed["simplified_name"]
      parsed["date_introduced"]
      parsed["date_discontinued"]
      parsed["co2_emissions"]
      parsed["top_speed"]
      parsed["kml_combined"]
      parsed["efficiency_label"]
      parsed["model_full_name"]
      parsed["model_slug"]
      parsed["make_slug"]
      parsed["model_name"]
      parsed["make_name"]
      parsed["on_the_market?"]
      parsed["fuel"]
      parsed["transmission"]
      parsed["discontinued?"]
      parsed["discontinued_recently?"]
      parsed["trim"]
      parsed["cap_options"]
      parsed["cap_options_rules"]
      parsed["option_rule_expressions"]
      parsed["cap_code"]
    end
  end

  x.report('Create Ostruct:') do
    n.times do |y|
      OpenStruct.new(parsed)
    end
  end

  x.report('Ostruct gets:') do
    n.times do |y|
      struct.id
      struct.name
      struct.engine_name
      struct.cc
      struct.bhp
      struct.acceleration
      struct.mpg_combined
      struct.tax_rate
      struct.price
      struct.full_name
      struct.fuel_long
      struct.fuel_long_simplified
      struct.transmission_long
      struct.doors
      struct.doors_simplified
      struct.basic_price_inc_vat
      struct.fees
      struct.basic_price
      struct.best_price
      struct.vat
      struct.delivery_cost
      struct.first_year_tax_rate
      struct.simplified_name
      struct.date_introduced
      struct.date_discontinued
      struct.co2_emissions
      struct.top_speed
      struct.kml_combined
      struct.efficiency_label
      struct.model_full_name
      struct.model_slug
      struct.make_slug
      struct.model_name
      struct.make_name
      struct.on_the_market?
      struct.fuel
      struct.transmission
      struct.discontinued?
      struct.discontinued_recently?
      struct.trim
      struct.cap_options
      struct.cap_options_rules
      struct.option_rule_expressions
      struct.cap_code
    end
  end

  x.report('Create OO:') do
    n.times do |y|
      OpenObject.new(parsed)
    end
  end

  x.report('OO gets:') do
    n.times do |y|
      o_object.id
      o_object.name
      o_object.engine_name
      o_object.cc
      o_object.bhp
      o_object.acceleration
      o_object.mpg_combined
      o_object.tax_rate
      o_object.price
      o_object.full_name
      o_object.fuel_long
      o_object.fuel_long_simplified
      o_object.transmission_long
      o_object.doors
      o_object.doors_simplified
      o_object.basic_price_inc_vat
      o_object.fees
      o_object.basic_price
      o_object.best_price
      o_object.vat
      o_object.delivery_cost
      o_object.first_year_tax_rate
      o_object.simplified_name
      o_object.date_introduced
      o_object.date_discontinued
      o_object.co2_emissions
      o_object.top_speed
      o_object.kml_combined
      o_object.efficiency_label
      o_object.model_full_name
      o_object.model_slug
      o_object.make_slug
      o_object.model_name
      o_object.make_name
      o_object.on_the_market?
      o_object.fuel
      o_object.transmission
      o_object.discontinued?
      o_object.discontinued_recently?
      o_object.trim
      o_object.cap_options
      o_object.cap_options_rules
      o_object.option_rule_expressions
      o_object.cap_code
    end
  end

  x.report('Create EO:') do
    n.times do |y|
      EnhancedOpenObject.new(parsed)
    end
  end

  x.report('EO gets:') do
    n.times do |y|
      e_object.id
      e_object.name
      e_object.engine_name
      e_object.cc
      e_object.bhp
      e_object.acceleration
      e_object.mpg_combined
      e_object.tax_rate
      e_object.price
      e_object.full_name
      e_object.fuel_long
      e_object.fuel_long_simplified
      e_object.transmission_long
      e_object.doors
      e_object.doors_simplified
      e_object.basic_price_inc_vat
      e_object.fees
      e_object.basic_price
      e_object.best_price
      e_object.vat
      e_object.delivery_cost
      e_object.first_year_tax_rate
      e_object.simplified_name
      e_object.date_introduced
      e_object.date_discontinued
      e_object.co2_emissions
      e_object.top_speed
      e_object.kml_combined
      e_object.efficiency_label
      e_object.model_full_name
      e_object.model_slug
      e_object.make_slug
      e_object.model_name
      e_object.make_name
      e_object.on_the_market?
      e_object.fuel
      e_object.transmission
      e_object.discontinued?
      e_object.discontinued_recently?
      e_object.trim
      e_object.cap_options
      e_object.cap_options_rules
      e_object.option_rule_expressions
      e_object.cap_code
    end
  end
  x.compare!
end

