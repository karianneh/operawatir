# -*- coding: utf-8 -*-
module OperaWatir
  class DesktopBrowser < Browser
    include DesktopContainer
    include DesktopCommon

    ConditionTimeout = 10.0

    LoadActions = ["Open url in new page", "Open url in current page", "Open url in new background page",
      "Open url in new window", "New private page", "Paste and go", "Paste and go background",
      "Hotclick search", "Duplicate page", "Reopen page", "Back", "Forward", "Help", "Autocomplete server name"]

    # @private
    def initialize
      OperaWatir.compatibility! unless OperaWatir.api >= 3

      self.driver        = OperaDesktopDriver.new(self.class.desired_capabilities(true))
      self.active_window = OperaWatir::Window.new(self)
      self.preferences   = OperaWatir::Preferences.new(self)
      self.keys          = OperaWatir::Keys.new(self)
      self.spatnav       = OperaWatir::Spatnav.new(self)
    end

    #def running?
    #  driver.isOperaRunning()
    #end

    # @private
    # Hack overload to allow for timing of the OnLoaded event that can cause
    # dialogs to autoclose in Dialog.cpp when then OnUrlChanged is fired
    # after a dialog is opened
    def goto(url = "")
      active_window.url = url
      sleep(1)
    end

    ######################################################################
    # Quits Opera
    #
    def quit_opera
      driver.quitOpera
    end

    ######################################################################
    # Restarts Opera
    #
    def restart
      driver.quitOpera
      driver.startOpera
    end

    ######################################################################
    # Quits the driver without exiting Opera
    #
    def quit_driver
      driver.quitDriver
    end

    ######################################################################
    #
    # Get ID of active Desktop UI window
    #
    def active_quick_window_id
      driver.getActiveQuickWindowID()
    end

    ######################################################################
    # Executes the action given by action_name, and waits for
    # the window with window name win_name to be shown
    #
    # @example
    #   browser.open_window_with_action("New Preferences Dialog", "Show preferences")
    #   browser.open_window_with_action("New Preferences Dialog", "Show preferences", "1")
    #
    # @param [String] win_name    name of the window that will be opened (Pass a blank string for any window)
    # @param [String] action_name name of the action to execute to open the window
    #                             the action cannot be a load action, see LoadActions
    # @param [String] param       optional parameter(s) to be supplied with the Opera action.
    #
    # @return [int] Window ID of the window shown or 0 if no window is shown
    def open_window_with_action(win_name, action_name, *params)
      if LoadActions.include?(action_name) then
        raise(DesktopExceptions::UnsupportedActionException, "Action #{action_name} not supported")
      end

      wait_start
      opera_desktop_action(action_name, *params)
      wait_for_window_shown(win_name)
    end

    alias_method :open_dialog_with_action, :open_window_with_action

    ######################################################################
    # Executes the action given by action_name, and waits for
    # the window with window name win_name to be loaded
    #
    # @example
    #   browser.load_window_with_action("Document Window", "Open url in new page", "http://elg.no")
    #
    # @param [String] win_name    name of the window that will be opened (Pass a blank string for any window)
    # @param [String] action_name name of the action to execute to open the window
    #                             the action has to be one of those in LoadActions
    # @param [String] param       optional parameter(s) to be supplied with the Opera action.
    #
    # @return [int] Window ID of the window shown or 0 if no window is shown
    def load_window_with_action(win_name, action_name, *params)
      if LoadActions.include?(action_name)
        wait_start
        opera_desktop_action(action_name, *params)
        wait_for_window_loaded(win_name)
      else
        raise(DesktopExceptions::UnsupportedActionException, "Action #{action_name} not supported")
      end
    end

    ######################################################################
    # Presses the key, with optional modifiers, and waits for
    # the window with window name win_name to be shown
    #
    # @example
    #   browser.open_window_with_key_press("New Preferences Dialog", "F12")
    #   browser.open_window_with_key_press("New Preferences Dialog", "F12", :ctrl, :shift)
    #
    # @param [String]  win_name    name of the window that will be opened (Pass a blank string for any window)
    # @param [String]  key         key to press (e.g. "a" or "backspace")
    # @param [Symbol]  modifiers   optional modifier(s) to hold down while pressing the key (e.g. :shift, :ctrl, :alt, :meta)
    #
    # @return [int] Window ID of the window shown or 0 if no window is shown
    #
    def open_window_with_key_press(win_name, key, *modifiers)
      wait_start
      key_press_direct(key, *modifiers)
      wait_for_window_shown(win_name)
    end

    alias_method :open_dialog_with_key_press, :open_window_with_key_press

    ######################################################################
    # Clicks the key and modifiers and waits for a new tab to be activated
    #
    # @example
    #     browser.activate_tab_with_key_press("F6", :ctrl)
    #
    # @param [String]  key         key to press (e.g. "a" or "backspace")
    # @param [Symbol]  modifiers   optional modifier(s) to hold down while pressing
    #                                the key (e.g. :shift, :ctrl, :alt, :meta)
    #
    # @return [int] Window ID of the document window (tab) that is activated, or 0 if no tab
    #   is being activated
    #
    def activate_tab_with_key_press(key, *modifiers)
      wait_start
      # TODO: FIXME. key_down and up are not yet implemented on mac and windows
      if linux?
        key_down_direct(key,*modifiers)
        key_up_direct(key, *modifiers)
      else
        key_press_direct(key, *modifiers)
      end
      wait_for_window_activated("Document Window")
     end

    ######################################################################
    # Opens a new tab and loads the url entered, then waits for
    # a dialog to be shown based on the url entered
    #
    # @example
    #     browser.open_dialog_with_url("Setup Apply Dialog Confirm Dialog", \
    #              "http://t/platforms/desktop/bts/DSK-316777/001-1.ini")
    #
    # @param [String] dialog_name name of the dialog that will be opened
    #                       (Pass a blank string for any window)
    # @param [String] url to load
    #
    # @return [int] Window ID of the dialog opened or 0 if no window is opened
    #
    def open_dialog_with_url(dialog_name, url)
      wait_start
      opera_desktop_action("Open url in new page", url)
      # The loading of the page will happen first then the dialog will be shown
      wait_for_window_shown(dialog_name)
    end

    ######################################################################
    # Executes the action given by action_name, and waits for
    # the window with window name win_name to close
    #
    # @example
    #   browser.close_window_with_action("New Preferences Dialog", "Cancel")
    #   browser.close_window_with_action("New Preferences Dialog", "Cancel", "1")
    #
    # @param [String] win_name    name of the window that will be closed (Pass a blank string for any window)
    # @param [String] action_name name of the action to execute to close the window
    # @param [String] param       optional parameter(s) to be supplied with the Opera action.
    #
    # @return [int] Window ID of the window closed or 0 if no window is closed
    #
    def close_window_with_action(win_name, action_name, *params)
      wait_start
      opera_desktop_action(action_name, *params)
      wait_for_window_close(win_name)
    end

    alias_method :close_dialog_with_action, :close_window_with_action

    ######################################################################
    # Presses the key, with optional modifiers, and waits for
    # the window with window name win_name to close
    #
    # @example
    #   browser.close_window_with_key_press("New Preferences Dialog", "Esc")
    #   browser.close_window_with_key_press("New Preferences Dialog", "w", :ctrl)
    #
    # @param [String]  win_name    name of the window that will be closed (Pass a blank string for any window)
    # @param [String]  key         key to press (e.g. "a" or "backspace")
    # @param [Symbol]  modifiers   optional modifier(s) to hold down while pressing the key (e.g. :shift, :ctrl, :alt, :meta)
    #
    # @return [int] Window ID of the window closed or 0 if no window is closed
    #
    def close_window_with_key_press(win_name, key, *opts)
      wait_start
      key_press_direct(key, *opts)
      wait_for_window_close(win_name)
    end

    alias_method :close_dialog_with_key_press, :close_window_with_key_press

    ######################################################################
    # Close the dialog with name dialog_name, using the "Cancel" action
    #
    # @example
    #   browser.close_dialog("New Preferences Dialog")
    #
    # @param [String] dialog_name name of the dialog that will be closed
    #                 (Pass a blank string for any window)
    #
    # @return [int] Window ID of the dialog closed or 0 if no window is closed
    #
    def close_dialog(dialog_name)
      wait_start
      opera_desktop_action("Cancel")
      wait_for_window_close(dialog_name)
    end

    ######################################################################
    # Sets the alignment of a toolbar or panel
    #
    # @param [String] toobar_name name of the panel or toolbar to change
    #                 the alignment of
    # @param [int] alignment of the toolbar to set
    #
    def set_alignment_with_action(toolbar_name, alignment)
      opera_desktop_action("Set alignment", toolbar_name, alignment)
      sleep(0.1)
    end

    ######################################################################
    # Retrieves an array of all widgets in the window with window
    # name win_name
    #
    # @example
    #   browser.widgets(window_name).each do |quick_widget|
    #       puts quick_widget.to_s
    #   end
    #
    # @param window [String] name or [int] id of the window to retrieve the list of widgets from,
    #
    # @return [Array] Array of widgets retrieved from the window
    #
    def widgets(window)

      # If window specifies window name, and the active window has this name
      # use its id to get the widgets,
      if window.is_a? String
        active_win_id = driver.getActiveQuickWindowID()
        active_win_name = driver.getQuickWindowName(active_win_id)

        #If the active window is of same type, then grab that one, not first
        if active_win_name == window #e.g. Both Document Window
          window = active_win_id
        end
      end
      driver.getQuickWidgetList(window).map do |java_widget|
        case java_widget.getType
          when QuickWidget::WIDGET_ENUM_MAP[:button]
            QuickButton.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:checkbox]
            QuickCheckbox.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:dialogtab]
            QuickDialogTab.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:dropdown]
            QuickDropdown.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:editfield]
            QuickEditField.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:label]
            QuickLabel.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:radiobutton]
            QuickRadioButton.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:treeview]
            QuickTreeView.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:treeitem]
            QuickTreeItem.new(self,java_widget)
          when QuickWidget::WIDGET_ENUM_MAP[:thumbnail]
            QuickTreeItem.new(self,java_widget)
        else
          QuickWidget.new(self,java_widget)
        end
      end.to_a
    end

    alias_method :quick_widgets, :widgets

    ####################################################
    # Retrieves an array of all windows
    #
    # @example
    #     browser.quick_windows.each { |win| puts win.to_s }
    #
    # @return [Array] Array of windows
    #
    def quick_windows
      driver.getQuickWindowList.map do |java_window|
        QuickWindow.new(self,java_window)
      end.to_a
    end

    ####################################################
    # Retrieves an array of all tabs (Document Windows)
    #
    # @example
    #    browser.open_pages.length.should == 2
    #
    # @return [Array] Array of windows
    #
    def open_pages
      quick_windows.select { |win| win.name == "Document Window" }
    end

    #@private
    # Not needed as quick_tabs is def. below
    #def tab_buttons
    #  widgets("Browser Window").select { | w | w.type == :tabbutton }
    #end

#=begin
    # Return collection for each widget type
    # example browser.quick_buttons
    #         browser.quick_treeitems
    #         ....
    #
    WIDGET_ENUM_MAP.keys.each do |widget_type|
      my_type = "quick_" << widget_type.to_s
      type = my_type
      if my_type == "quick_search" || my_type == "quick_checkbox"
        my_type << "es"
      else
        my_type << "s"
      end
      define_method(my_type.to_sym) do |win|
        widgets(win).select { |w| w.type == widget_type}
      end
    end
#=end

    #TODO
    def quick_menus
      driver.getQuickMenuList().map do |java_menu|
        QuickMenu.new(self, java_menu)
      end.to_a
    end

    #TODO
    def quick_menuitems
      driver.getQuickMenuItemList().map do |java_item|
        QuickMenuItem.new(self, java_item)
      end.to_a
    end

    #####################################################################
    #
    # Closes the active menu
    #
    def close_active_menu
      wait_start

      menus = quick_menus
      main = menus.select {|menu| menu.name == "Main Menu"}
      main_open = main.length > 0
      real_submenu = main_open ? (menus.length > 2) : menus.length > 1

      if real_submenu
        key_press_direct("Left")
      else
        close_menu
      end

      wait_for_menu_closed("")
    end

    #####################################################################
    #
    # Closes all open menus
    # (Note: On mac one esc closes all menus)
    def close_all_menus
      i = 6 #Just some number
      while quick_menus.delete_if { |menu| menu.name == "Main Menu" }.length > 0
         close_menu
         i-=1
         break if i == 0
      end
    end

    ######################################################################
    #
    # @return [Array] with all tabs (quick_tab)
    #
    def quick_tabs
      quick_tabbuttons
    end

    ######################################################################
    # Retrieves the name of a window based on it's id
    #
    # @param [int] win_id Window ID to retrieve the name for
    #
    # @return [String] Name of the window
    #
    def window_name(win_id)
      driver.getQuickWindowName(win_id)
    end

    ######################################################################
    # Presses the key, with optional modifiers, and waits for loaded event
    #
    # @example
    #   browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").\n
    #                          type_text(text_to_type).should == text_to_type
    #   browser.load_page_with_key_press("Enter").should > 0
    #
    # @param [String]  key         key to press (e.g. "a" or "backspace")
    # @param [Symbol]  modifiers   optional modifier(s) to hold down while pressing the key (e.g. :shift, :ctrl, :alt, :meta)
    #
    # @return [int] Window ID of the window loaded or 0 if no window is loaded
    #
    def load_page_with_key_press(key, *modifiers)
         wait_start
         key_press_direct(key, *modifiers)
         wait_for_window_loaded("")
    end

    ######################################################################
    # Clicks the element and waits for the menu with menu_name as given
    # opens
    #
    # @param [String]  element     Web page element to click (a link, an image ..)
    # @param [Symbol]  menu_name   Name of menu that should open when clicking the element
    #
    # @return [String] name of menu opened if it matches menu_name given as
    #          parameter, otherwise empty string
    #
    def open_menu_with_rightclick(element, menu_name)
      wait_start
      element.right_click
      wait_for_menu_shown(menu_name)
    end

    #####################################################################
    #
    # Presses key and waits for the menu to show
    #
    # @param [String] menu_name  Name of the menu that should be opened
    # @param [String] key        Key to press
    #
    # @return [String] name of menu that was opened, or empty
    #
    def open_menu_with_key_press(menu_name, key, *modifiers)
      wait_start
      key_press_direct(key, *modifiers)
      wait_for_menu_shown(menu_name)
    end

    #####################################################################
    #
    # Presses key and waits for the menu to close
    #
    # @param [String] menu_name  Name of the menu that should be opened
    # @param [String] key        Key to press
    #
    # @return [String] name of menu that was closed, or empty string
    #
    def close_menu_with_key_press(menu_name, key, *modifiers)
      wait_start
      key_press_direct(key, *modifiers)
      wait_for_menu_closed(menu_name)
    end


=begin
    ##############################################################################
    # Clicks the element specified by method and selector,
    # and waits for the window with name win_name to be shown
    #
    # @param [WebElement]  element   element to click
    # @param [String]    win_name    Name of window to be shown
    #
    # @return [int] Window ID of the window shown or 0 if no window is shown
    #
#=begin
    # or open_dialog_with_click(type, method, selector, win_name)
    # open_dialog_with_click(:button, :id, "text", win_name)
#=end
    def open_dialog_with_click(method, selector, win_name)
      wait_start
      OperaWatir::WebElement.new(self, method, selector).click
      wait_for_window_shown(win_name)
    end
=end

    ######################################################################
    # Returns the full path to the Opera executable
    #
    # @return [String] Full path to the opera executable
    #
    def path
      driver.getOperaPath()
    end

    ######################################################################
    # Returns the full path to the Opera large preferences folder
    #
    # @return [String] Full path to the large preferences folder
    #
    def large_preferences_path
      driver.getLargePreferencesPath()
    end

    ######################################################################
    # Returns the full path to the Opera small preferences folder
    #
    # @return [String] Full path to the small preferences folder
    #
    def small_preferences_path
      driver.getSmallPreferencesPath()
    end

    ######################################################################
    # Returns the full path to the Opera cache preferences folder
    #
    # @return [String] Full path to the cache preferences folder
    #
    def cache_preferences_path
      driver.getCachePreferencesPath()
    end

    ######################################################################
    # Returns the language string corresponding to the string_id provided
    #
    # @param string_id the string_id to convert to the corresponding
    #                  language string
    # @param skip_ampersand if false, then leave string as is, else
    #                  (default) remove any ampersand in string
    #
    #
    # @example
    #   browser.string("D_NEW_PREFERENCES_GENERAL")
    #
    # @return [String] the language string corresponding to the string_id
    #
    def string(string_id, skip_ampersand = true)
      string = driver.getString(string_id, skip_ampersand)
    end

    ######################################################################
    # Returns true if the test is running on Mac
    #
    # @return [Boolean] true we the operating system is Mac, otherwise false
    #
    def mac?
      mac_internal?
    end

    ######################################################################
    # Returns true if the test is running on Linux
    #
    # @return [Boolean] true we the operating system is Linux, otherwise false
    #
    def linux?
      linux_internal?
     end

    # @private
    # Special method to access the driver
    attr_reader :driver

    ######################################################################
    # Clear all private data (as in Delete Private Data Dialog)
    #
    # @return [int] 0 if operation failed, else > 0
    #
    def clear_all_private_data

      #FIXME: Set CheckFlags to uncheck to prevent storing the settings used here

      win_id = open_dialog_with_action("Clear Private Data Dialog", "Delete private data")
      return 0 if win_id == 0

      #Ensure is Expanded
      if quick_button(:name, "Details_expand").value == 0
        quick_button(:name, "Details_expand").toggle_with_click
      end

      quick_checkboxes("Clear Private Data Dialog").each do |box|
        box.toggle_with_click unless box.checked?
      end

      #Delete all
      win_id = quick_button(:name, "button_OK").close_dialog_with_click("Clear Private Data Dialog")

      #FIXME: Reset CheckFlags

      win_id
    end

    ######################################################################
    # Clear typed and visited history
    #
    def clear_history
      #TODO: Use Delete Private Data Dialog?
      opera_desktop_action("Clear visited history")
      opera_desktop_action("Clear typed in history")
    end

    ######################################################################
    #
    # Clear disk cache
    #
    def clear_cache
      #TODO: Use Delete Private Data Dialog?
      opera_desktop_action("Clear disk cache")
    end

    ######################################################################
    #
    # Close all open tabs (except last one)
    #
    def close_all_tabs
      #The collection has the activate tab first and then the rest sorted on number, so resort to get on descending position
      quick_tabbuttons("Browser Window").sort {|t1, t2| (t2.position <=> t1.position) }.each do |btn|
        #Tab button is in Browser window which is prob not the active window,
        #so we cannot do this the easy way
        #btn.quick_button(:name, "pb_CloseButton").close_window_with_click("Document Window") unless btn.position == 0
        #puts "Current tab = #{btn}"
        if btn.position != 0 or btn.value > 1 then
          quick_window(:name, "Browser Window").quick_tab(:pos, btn.position).quick_button(:name, "pb_CloseButton").close_window_with_click("Document Window")
        end
      end
    end

    #####################################################################
    #
    # Close all open dialogs
    #
    def close_all_dialogs
      win_id = driver.getActiveQuickWindowID()
      until quick_window(:id, win_id).type != :dialog do
        win = quick_window(:id, driver.getActiveQuickWindowID())
        if win.type == :dialog
          close_dialog(win.name)
          if (driver.getActiveQuickWindowID() != win_id)
            win_id = driver.getActiveQuickWindowID()
          else
            break
          end
        end
      end
    end

    ###############################################################
    #
    # key_press_with_condition(key, modifiers) { block } → res
    #
    #
    # Performs the keypress specified and waits until block evaluates to true or timeout is hit
    #
    # @param [String] key - key to press
    # @param *modifiers - modifier(s) to hold while pressing key
    #
    # @return value of block, or false if no block provided
    #
    def key_press_with_condition(key, *modifiers)
      return false unless block_given?

      key_press_direct(key, *modifiers)

      start = Time.now
      until res = yield rescue false do
        if Time.now - start > ConditionTimeout
          return false
        end
        sleep 0.1
      end
      res
    end

    ###############################################################
    #
    # action_with_condition { block } → res
    #
    #
    # Executes action and waits until block evaluates to true or timeout is hit.
    #
    # @param [String] action_name - name of action to execute
    # @param *params - parameters to the action
    #
    # @return value of block, or false if no block provided
    #
    def action_with_condition(action_name, *params)
      return false unless block_given?

      opera_desktop_action(action_name, *params)

      start = Time.now
      until res = yield rescue false do
        if Time.now - start > ConditionTimeout
           return false
        end
        sleep 0.1
      end
      res
    end

    ############################################################################
    #
    # Reset prefs
    #
    # Quits Opera and copies prefs from src to dest, then restarts Opera with the
    # new Prefs
    #
    def reset_prefs(new_prefs)
      driver.resetOperaPrefs(new_prefs)
    end

    ##############################################################################
    #
    # Deletes profile for the connected Opera instance.
    # Should only be called after quitting (and before starting) Opera.
    #
    #
    def delete_profile
      driver.deleteOperaPrefs
    end

    # Set preference pref in prefs section prefs_section to value
    # specified.
    #
    # @param [String] prefs_section The prefs section the pref belongs to
    # @param [String] pref          The preference to set
    # @param [String] value         The value to set the preference to
    def set_preference(prefs_section, pref, value)
      driver.setPref(prefs_section, pref, value.to_s)
    end

    # Get value of preference pref in prefs section prefs_section.
    #
    # @param [String] prefs_section The prefs section the pref belongs to
    # @param [String] pref          The preference to get
    #
    # @return [String] The value of the preference
    def get_preference(prefs_section, pref)
      driver.getPref(prefs_section, pref)
    end

    # Get default value of preference pref in prefs section
    # prefs_section.
    #
    # @param [String] prefs_section The prefs section the pref belongs to
    # @param [String] pref          The preference to get
    #
    # @return [String] The value of the preference
    def get_default_preference(prefs_section, pref)
      driver.getDefaultPref(prefs_section, pref)
    end

    # @private
    def start_opera
      driver.startOpera
    end

    # Is attached browser instance of type internal build or public
    # desktop?
    #
    # @return [Boolean] True if browser attached is of type desktop,
    #   false otherwise.
    def desktop?
      true # Not nice, but if you're running desktopbrowser, assume running desktop
    end

private

    def close_menu
      wait_start
      key_press_direct("Esc")
      wait_for_menu_closed("")
    end

    # Gets the parent widget name of which there is none here
    def parent_widget
      nil
    end

    # Gets the window id to use for the search
    def window_id
      -1
    end
  end

end
