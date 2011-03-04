# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{operawatir}
  s.version = "0.4.1.pre1"
  s.platform = %q{jruby}

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andreas Tolf Tolfsen", "Chris Lloyd", "Stuart Knightley", "Deniz Turkoglu"]
  s.date = %q{2011-03-04}
  s.description = %q{    OperaWatir is a part of the Watir (pronounced water) family of
    free software Ruby libraries for automating web
    browsers.  OperaWatir provides a querying engine and Ruby bindings
    for a backend Java library, OperaDriver, for driving the Opera web
    browser.  It aims for full compliancy with the watirspec
    specification.
}
  s.email = ["andreastt@opera.com", "christopherl@opera.com", "stuartk@opera.com", "dturkoglu@opera.com"]
  s.executables = ["desktopwatir", "operawatir"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gitmodules",
    ".yardopts",
    "AUTHORS",
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/desktopwatir",
    "bin/operawatir",
    "lib/operadriver/APACHE_2.0_LICENSE.txt",
    "lib/operadriver/NEW_BSD_LICENSE.txt",
    "lib/operadriver/commons-io-2.0.1.jar",
    "lib/operadriver/commons-jxpath-1.3.jar",
    "lib/operadriver/protobuf-java-2.3.0.jar",
    "lib/operadriver/selenium-common.jar",
    "lib/operadriver/webdriver-opera.jar",
    "lib/operawatir.rb",
    "lib/operawatir/browser.rb",
    "lib/operawatir/collection.rb",
    "lib/operawatir/compat.rb",
    "lib/operawatir/compat/browser.rb",
    "lib/operawatir/compat/collection.rb",
    "lib/operawatir/compat/element.rb",
    "lib/operawatir/compat/element_finders.rb",
    "lib/operawatir/compat/window.rb",
    "lib/operawatir/desktop-waiter.rb",
    "lib/operawatir/desktop_browser.rb",
    "lib/operawatir/desktop_common.rb",
    "lib/operawatir/desktop_container.rb",
    "lib/operawatir/desktop_enums.rb",
    "lib/operawatir/desktop_exceptions.rb",
    "lib/operawatir/desktop_helper.rb",
    "lib/operawatir/element.rb",
    "lib/operawatir/exceptions.rb",
    "lib/operawatir/helper.rb",
    "lib/operawatir/keys.rb",
    "lib/operawatir/platform.rb",
    "lib/operawatir/preferences.rb",
    "lib/operawatir/quickwidgets.rb",
    "lib/operawatir/quickwidgets/quick_addressfield.rb",
    "lib/operawatir/quickwidgets/quick_button.rb",
    "lib/operawatir/quickwidgets/quick_checkbox.rb",
    "lib/operawatir/quickwidgets/quick_dialogtab.rb",
    "lib/operawatir/quickwidgets/quick_dropdown.rb",
    "lib/operawatir/quickwidgets/quick_editfield.rb",
    "lib/operawatir/quickwidgets/quick_label.rb",
    "lib/operawatir/quickwidgets/quick_radiobutton.rb",
    "lib/operawatir/quickwidgets/quick_searchfield.rb",
    "lib/operawatir/quickwidgets/quick_tab.rb",
    "lib/operawatir/quickwidgets/quick_thumbnail.rb",
    "lib/operawatir/quickwidgets/quick_toolbar.rb",
    "lib/operawatir/quickwidgets/quick_treeitem.rb",
    "lib/operawatir/quickwidgets/quick_treeview.rb",
    "lib/operawatir/quickwidgets/quick_widget.rb",
    "lib/operawatir/quickwidgets/quick_window.rb",
    "lib/operawatir/selector.rb",
    "lib/operawatir/spatnav.rb",
    "lib/operawatir/version.rb",
    "lib/operawatir/window.rb",
    "operawatir.gemspec",
    "spec/fire_event/fire_event.rb",
    "spec/fire_event/interactive/onBlur.html",
    "spec/fire_event/interactive/onChange.html",
    "spec/fire_event/interactive/onClick.html",
    "spec/fire_event/interactive/onDblClick.html",
    "spec/fire_event/interactive/onFocus.html",
    "spec/fire_event/interactive/onMouseDown.html",
    "spec/fire_event/interactive/onMouseMove.html",
    "spec/fire_event/interactive/onMouseOut.html",
    "spec/fire_event/interactive/onMouseOver.html",
    "spec/fire_event/interactive/onMouseUp.html",
    "spec/fire_event/interactive/onScroll.html",
    "spec/operawatir/README.md",
    "spec/operawatir/core/browser_spec.rb",
    "spec/operawatir/core/element_spec.rb",
    "spec/operawatir/core/preferences_spec.rb",
    "spec/operawatir/core/spatnav_spec.rb",
    "spec/operawatir/core/window_spec.rb",
    "spec/operawatir/fixtures/boxes.html",
    "spec/operawatir/fixtures/grid.html",
    "spec/operawatir/fixtures/input_fields_value.html",
    "spec/operawatir/fixtures/onclick.html",
    "spec/operawatir/fixtures/paragraphs.html",
    "spec/operawatir/fixtures/two_input_fields.html",
    "spec/operawatir/guards.rb",
    "spec/operawatir/server.rb",
    "spec/operawatir/watirspec.rake",
    "spec/operawatir/watirspec_helper.rb",
    "spec/watir2/area_spec.rb",
    "spec/watir2/areas_spec.rb",
    "spec/watir2/browser_spec.rb",
    "spec/watir2/button_spec.rb",
    "spec/watir2/buttons_spec.rb",
    "spec/watir2/checkbox_spec.rb",
    "spec/watir2/checkboxes_spec.rb",
    "spec/watir2/collections_spec.rb",
    "spec/watir2/dd_spec.rb",
    "spec/watir2/dds_spec.rb",
    "spec/watir2/del_spec.rb",
    "spec/watir2/dels_spec.rb",
    "spec/watir2/div_spec.rb",
    "spec/watir2/divs_spec.rb",
    "spec/watir2/dl_spec.rb",
    "spec/watir2/dls_spec.rb",
    "spec/watir2/dt_spec.rb",
    "spec/watir2/dts_spec.rb",
    "spec/watir2/element_spec.rb",
    "spec/watir2/em_spec.rb",
    "spec/watir2/ems_spec.rb",
    "spec/watir2/filefield_spec.rb",
    "spec/watir2/filefields_spec.rb",
    "spec/watir2/fixtures/2000_spans.html",
    "spec/watir2/fixtures/bug_duplicate_attributes.html",
    "spec/watir2/fixtures/bug_javascript_001.html",
    "spec/watir2/fixtures/buttons_with_duplicate_ids.html",
    "spec/watir2/fixtures/collections.html",
    "spec/watir2/fixtures/definition_lists.html",
    "spec/watir2/fixtures/euc-jp_text.html",
    "spec/watir2/fixtures/forms_with_input_elements.html",
    "spec/watir2/fixtures/frame_1.html",
    "spec/watir2/fixtures/frame_2.html",
    "spec/watir2/fixtures/frames.html",
    "spec/watir2/fixtures/iframes.html",
    "spec/watir2/fixtures/images.html",
    "spec/watir2/fixtures/images/1.gif",
    "spec/watir2/fixtures/images/2.gif",
    "spec/watir2/fixtures/images/3.gif",
    "spec/watir2/fixtures/images/button.jpg",
    "spec/watir2/fixtures/images/circle.jpg",
    "spec/watir2/fixtures/images/map.gif",
    "spec/watir2/fixtures/images/map2.gif",
    "spec/watir2/fixtures/images/minus.gif",
    "spec/watir2/fixtures/images/originaltriangle.jpg",
    "spec/watir2/fixtures/images/plus.gif",
    "spec/watir2/fixtures/images/square.jpg",
    "spec/watir2/fixtures/images/triangle.jpg",
    "spec/watir2/fixtures/iso-2022-jp_text.html",
    "spec/watir2/fixtures/javascript/helpers.js",
    "spec/watir2/fixtures/jquery.html",
    "spec/watir2/fixtures/latin1_text.html",
    "spec/watir2/fixtures/multiple_ids.html",
    "spec/watir2/fixtures/non_control_elements.html",
    "spec/watir2/fixtures/parser_bug_001.html",
    "spec/watir2/fixtures/prevent_form_submit.html",
    "spec/watir2/fixtures/right_click.html",
    "spec/watir2/fixtures/shift_jis_text.html",
    "spec/watir2/fixtures/tables.html",
    "spec/watir2/fixtures/timeout.html",
    "spec/watir2/fixtures/timeout_window_location.html",
    "spec/watir2/fixtures/tiny_mce.html",
    "spec/watir2/fixtures/utf8_text.html",
    "spec/watir2/fixtures/watirspec.css",
    "spec/watir2/form_spec.rb",
    "spec/watir2/forms_spec.rb",
    "spec/watir2/frame_spec.rb",
    "spec/watir2/frames_spec.rb",
    "spec/watir2/guards.rb",
    "spec/watir2/hidden_spec.rb",
    "spec/watir2/hiddens_spec.rb",
    "spec/watir2/hn_spec.rb",
    "spec/watir2/hns_spec.rb",
    "spec/watir2/image_spec.rb",
    "spec/watir2/images_spec.rb",
    "spec/watir2/ins_spec.rb",
    "spec/watir2/inses_spec.rb",
    "spec/watir2/label_spec.rb",
    "spec/watir2/labels_spec.rb",
    "spec/watir2/li_spec.rb",
    "spec/watir2/link_spec.rb",
    "spec/watir2/links_spec.rb",
    "spec/watir2/lis_spec.rb",
    "spec/watir2/map_spec.rb",
    "spec/watir2/maps_spec.rb",
    "spec/watir2/meta_spec.rb",
    "spec/watir2/metas_spec.rb",
    "spec/watir2/ol_spec.rb",
    "spec/watir2/ols_spec.rb",
    "spec/watir2/option_spec.rb",
    "spec/watir2/p_spec.rb",
    "spec/watir2/pre_spec.rb",
    "spec/watir2/pres_spec.rb",
    "spec/watir2/ps_spec.rb",
    "spec/watir2/radio_spec.rb",
    "spec/watir2/radios_spec.rb",
    "spec/watir2/select_list_spec.rb",
    "spec/watir2/select_lists_spec.rb",
    "spec/watir2/server.rb",
    "spec/watir2/span_spec.rb",
    "spec/watir2/spans_spec.rb",
    "spec/watir2/spec_helper.rb",
    "spec/watir2/strong_spec.rb",
    "spec/watir2/strongs_spec.rb",
    "spec/watir2/table_bodies_spec.rb",
    "spec/watir2/table_body_spec.rb",
    "spec/watir2/table_cell_spec.rb",
    "spec/watir2/table_cells_spec.rb",
    "spec/watir2/table_footer_spec.rb",
    "spec/watir2/table_footers_spec.rb",
    "spec/watir2/table_header_spec.rb",
    "spec/watir2/table_headers_spec.rb",
    "spec/watir2/table_row_spec.rb",
    "spec/watir2/table_rows_spec.rb",
    "spec/watir2/table_spec.rb",
    "spec/watir2/tables_spec.rb",
    "spec/watir2/text_field_spec.rb",
    "spec/watir2/text_fields_spec.rb",
    "spec/watir2/ul_spec.rb",
    "spec/watir2/uls_spec.rb",
    "spec/watir2/watir_compatibility_spec.rb",
    "spec/watir2/watirspec_helper.rb",
    "utils/Rakefile",
    "utils/formatters/operahelper_formatter.rb",
    "utils/formatters/spartan_formatter.rb"
  ]
  s.homepage = %q{http://www.opera.com/developer/tools/operawatir/}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = %q{operawatir}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Toolkit for automating interactions with the Opera web browser.}
  s.test_files = [
    "spec/fire_event/fire_event.rb",
    "spec/operawatir/core/browser_spec.rb",
    "spec/operawatir/core/element_spec.rb",
    "spec/operawatir/core/preferences_spec.rb",
    "spec/operawatir/core/spatnav_spec.rb",
    "spec/operawatir/core/window_spec.rb",
    "spec/operawatir/guards.rb",
    "spec/operawatir/server.rb",
    "spec/operawatir/watirspec_helper.rb",
    "spec/watir2/area_spec.rb",
    "spec/watir2/areas_spec.rb",
    "spec/watir2/browser_spec.rb",
    "spec/watir2/button_spec.rb",
    "spec/watir2/buttons_spec.rb",
    "spec/watir2/checkbox_spec.rb",
    "spec/watir2/checkboxes_spec.rb",
    "spec/watir2/collections_spec.rb",
    "spec/watir2/dd_spec.rb",
    "spec/watir2/dds_spec.rb",
    "spec/watir2/del_spec.rb",
    "spec/watir2/dels_spec.rb",
    "spec/watir2/div_spec.rb",
    "spec/watir2/divs_spec.rb",
    "spec/watir2/dl_spec.rb",
    "spec/watir2/dls_spec.rb",
    "spec/watir2/dt_spec.rb",
    "spec/watir2/dts_spec.rb",
    "spec/watir2/element_spec.rb",
    "spec/watir2/em_spec.rb",
    "spec/watir2/ems_spec.rb",
    "spec/watir2/filefield_spec.rb",
    "spec/watir2/filefields_spec.rb",
    "spec/watir2/form_spec.rb",
    "spec/watir2/forms_spec.rb",
    "spec/watir2/frame_spec.rb",
    "spec/watir2/frames_spec.rb",
    "spec/watir2/guards.rb",
    "spec/watir2/hidden_spec.rb",
    "spec/watir2/hiddens_spec.rb",
    "spec/watir2/hn_spec.rb",
    "spec/watir2/hns_spec.rb",
    "spec/watir2/image_spec.rb",
    "spec/watir2/images_spec.rb",
    "spec/watir2/ins_spec.rb",
    "spec/watir2/inses_spec.rb",
    "spec/watir2/label_spec.rb",
    "spec/watir2/labels_spec.rb",
    "spec/watir2/li_spec.rb",
    "spec/watir2/link_spec.rb",
    "spec/watir2/links_spec.rb",
    "spec/watir2/lis_spec.rb",
    "spec/watir2/map_spec.rb",
    "spec/watir2/maps_spec.rb",
    "spec/watir2/meta_spec.rb",
    "spec/watir2/metas_spec.rb",
    "spec/watir2/ol_spec.rb",
    "spec/watir2/ols_spec.rb",
    "spec/watir2/option_spec.rb",
    "spec/watir2/p_spec.rb",
    "spec/watir2/pre_spec.rb",
    "spec/watir2/pres_spec.rb",
    "spec/watir2/ps_spec.rb",
    "spec/watir2/radio_spec.rb",
    "spec/watir2/radios_spec.rb",
    "spec/watir2/select_list_spec.rb",
    "spec/watir2/select_lists_spec.rb",
    "spec/watir2/server.rb",
    "spec/watir2/span_spec.rb",
    "spec/watir2/spans_spec.rb",
    "spec/watir2/spec_helper.rb",
    "spec/watir2/strong_spec.rb",
    "spec/watir2/strongs_spec.rb",
    "spec/watir2/table_bodies_spec.rb",
    "spec/watir2/table_body_spec.rb",
    "spec/watir2/table_cell_spec.rb",
    "spec/watir2/table_cells_spec.rb",
    "spec/watir2/table_footer_spec.rb",
    "spec/watir2/table_footers_spec.rb",
    "spec/watir2/table_header_spec.rb",
    "spec/watir2/table_headers_spec.rb",
    "spec/watir2/table_row_spec.rb",
    "spec/watir2/table_rows_spec.rb",
    "spec/watir2/table_spec.rb",
    "spec/watir2/tables_spec.rb",
    "spec/watir2/text_field_spec.rb",
    "spec/watir2/text_fields_spec.rb",
    "spec/watir2/ul_spec.rb",
    "spec/watir2/uls_spec.rb",
    "spec/watir2/watir_compatibility_spec.rb",
    "spec/watir2/watirspec_helper.rb",
    "spec/watir3/browser_spec.rb",
    "spec/watir3/clipboard_spec.rb",
    "spec/watir3/collection_spec.rb",
    "spec/watir3/element_spec.rb",
    "spec/watir3/guards.rb",
    "spec/watir3/keys_spec.rb",
    "spec/watir3/server.rb",
    "spec/watir3/watirspec_helper.rb",
    "spec/watir3/window_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<BlueCloth>, ["= 1.0.1"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<mongrel>, [">= 1.1.5"])
      s.add_development_dependency(%q<sinatra>, [">= 1.1"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<clipboard>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, ["= 2.4"])
      s.add_runtime_dependency(%q<deprecated>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<BlueCloth>, ["= 1.0.1"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<mongrel>, [">= 1.1.5"])
      s.add_development_dependency(%q<sinatra>, [">= 1.1"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<clipboard>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<BlueCloth>, ["= 1.0.1"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<mongrel>, [">= 1.1.5"])
      s.add_dependency(%q<sinatra>, [">= 1.1"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<clipboard>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 2.4"])
      s.add_dependency(%q<deprecated>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<BlueCloth>, ["= 1.0.1"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<mongrel>, [">= 1.1.5"])
      s.add_dependency(%q<sinatra>, [">= 1.1"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<clipboard>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<BlueCloth>, ["= 1.0.1"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<mongrel>, [">= 1.1.5"])
    s.add_dependency(%q<sinatra>, [">= 1.1"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<clipboard>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 2.4"])
    s.add_dependency(%q<deprecated>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<BlueCloth>, ["= 1.0.1"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<mongrel>, [">= 1.1.5"])
    s.add_dependency(%q<sinatra>, [">= 1.1"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<clipboard>, [">= 0"])
  end
end

