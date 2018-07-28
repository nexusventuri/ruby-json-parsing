# frozen_string_literal: true

require 'ostruct'
require 'oj'
require 'benchmark'
require 'json'
require_relative 'open_object'
require_relative 'enhanced_open_object'

require 'concurrent'
require 'open-uri'
require_relative 'promise_open_object'

require 'benchmark/memory'
require 'benchmark/ips'
require_relative 'bench/parsing'
require_relative 'bench/access'
