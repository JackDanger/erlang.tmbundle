#!/usr/bin/env ruby

helper_path = ENV['TM_BUNDLE_SUPPORT'].gsub(/\\/, '') + "/shell_helper.scpt"
source_path, source_file, eunit = ARGV
ebin_path = "#{source_path}/../ebin"

eunit_module = eunit == 'eunit' ? File.basename(source_file).sub(/\.erl$/,'') : nil

compile_path = File.exists?(ebin_path) ? ebin_path : source_path

osascript_args = [helper_path, source_path, source_file, compile_path]
osascript_args << eunit_module if eunit_module

system("/usr/bin/osascript", *osascript_args)
