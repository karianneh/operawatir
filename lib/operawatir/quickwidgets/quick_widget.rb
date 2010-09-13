module OperaWatir
  class QuickWidget

    def initialize(container, method, selector)
      @container = container
      @method    = method
      @selector  = selector
    end

     # Checks if the provided text matches with the contents of text
     # field.  Text can be a string or regular expression.
     #
     # Input:
     # target::  text to be verified.
     #
     # Output:
     #   True if provided text matches with the contents of text field,
     #   false otherwise.
     def contains?(target)
       return false unless exists?
       text = element.getText
       return false if text.nil?
       text.include?(target)
     end
 
     alias_method :verify_contains, :contains?

    # Checks whether element exists or not.
    #
    # Raises:
    # NoSuchElementException::  if element is is not found.
    def exist?
      !!element
    rescue NoSuchElementException
      false
    end
    alias_method :exists?, :exist?
    
    # Returns true if the element is enabled, false if it isn't.  First
    # checks if element exists or not.  Then checks if element is enabled
    # or not.
    #
    # Output: 
    #   Returns true if element exists and is enabled, else returns
    #   false.
    #
    # Raises:
    # NoSuchElementException:  if element is not found.
    def enabled?
      element.isEnabled
    end
      

    # Checks if element is enabled or not.
    #
    # Raises:
    # ObjectDisabledException::  if element is disabled and you are attempting to use it.
    def assert_enabled
      raise ObjectDisabledException, "Element #{@method} and #{@selector} is disabled" unless enabled?
    end

    # Return the text of the widget
    #
    # Raises:
    # NoSuchElementException::   if the element is not found.
    def text
      element.getText
    end

private
  
    # Return the element
    #
    # Raises:
    # NoSuchElementException::   if the element is not found.
    def element
      @elm ||= find || raise(NoSuchElementException, "Element #{@selector} not found using #{@method}")
    end

    # Finds the element on the page.  Elements can be located using one
    # of the following selectors:
    #
    # * name
    #
    # Raises:
    # NoSuchElementException:  if element is not found.
    def find
      case @method
      when :name
        @element = @container.driver.findWidgetByName(-1, @selector)
      end
    end

    
  end
end

