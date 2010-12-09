class OperaWatir::Window

  attr_accessor :browser

  def initialize(browser)
    self.browser = browser
  end


  # Navigation

  def back
    driver.navigate.back
  end

  def forward
    driver.navigate.forward
  end

  def stop
    driver.stop
  end

  # FIXME No window management support
  def close
    driver.close
  end

  def refresh
    driver.navigate.refresh
  end

  def title
    driver.getTitle
  end

  def url
    driver.getCurrentUrl
  end

  def url=(url)
    driver.get(url)
  end
  alias_method :goto, :url=  # deprecate?

  def text
    driver.getText
  end

  def html
    driver.getPageSource
  end

  # TODO: Expose window querying from driver
  def exists?
    url != ''
  end

  def document
  end

  def eval_js(js)
    object = driver.executeScript(js, [].to_java(:string))
  end
  alias_method :execute_script, :eval_js


  # Keyboard

  def key(key)
    driver.key(key)
  end

  def key_down(key)
    driver.keyDown(key)
  end

  def key_up(key)
    driver.keyUp(key)
  end

  def type(text)
    driver.type(text)
  end


  # Opera-specific

  def screenshot(file_name, hashes=[], time_out=2)
    driver.saveScreenshot(file_name, time_out, hashes.to_java(:string))
  end

  def visual_hash(time_out=50)
    document.visual_hash timeout
  end

  def method_missing(tag, *args)
    OperaWatir::Collection.new(self).tap do |c|
      c.selector.tag tag
      c.add_selector_from_arguments args
    end
  end

  def tag(name)
    OperaWatir::Collection.new(self).tap do |c|
      c.selector.tag name
    end
  end

  def elements
    tag('*')
  end


private

  # Locate elements by id.
  #
  # @return [Array] an array of found elements.
  def find_elements_by_id(value)
    driver.findElementsById(value).to_a.map do |node|
      OperaWatir::Element.new(node)
    end
  end

  # Locate elements by class.
  #
  # @return [Array] an array of found elements.
  def find_elements_by_class_name(value)
    driver.findElementsByClassName(value).to_a.map do |node|
      OperaWatir::Element.new(node)
    end
  end

  # Locate elements by tag name.
  #
  # @return [Array] an array of found elements.
  def find_elements_by_tag_name(value)
    driver.findElementsByTagName(value).to_a.map do |node|
      OperaWatir::Element.new(node)
    end
  end

  # Locate elements by CSS selector.
  #
  # @returns [Array] an array of found elements.
  def find_elements_by_css(value)
    driver.findElementsByCssSelector(value).to_a.map do |node|
      OperaWatir::Element.new(node)
    end
  end

  # Locate elements by XPath expression.
  #
  # @returns [Array] an array of found elements.
  def find_elements_by_xpath(value)
    driver.findElementsByXPath(value).to_a.map do |node|
      OperaWatir::Element.new(node)
    end
  end

  # @private
  # @return [Object] the driver instance.
  def driver
    browser.driver
  end

end
