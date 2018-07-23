module DecorpotExtension

  # ----------------------------------------------------------------------------
  # Development Configuration

  DECORPOT_DEV   = false
  DECORPOT_LOCAL = false 
  DECORPOT_HIDE  = false  
  DECORPOT_SHORT_CIRCUIT = false

  # ----------------------------------------------------------------------------
  # General

  DECORPOT_TITLE = 'Decorpot'

  PANEL_ID_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  PANEL_ID_ALPHABET_LENGTH = PANEL_ID_ALPHABET.length
  
  # ----------------------------------------------------------------------------
  # Paths

  #if DECORPOT_LOCAL
   #DECORPOT_SERVER = 'http://localhost:8080'
  #else
  #  DECORPOT_SERVER = 'http://wikihouse-cc.appspot.com'
  #end
  
  DECORPOT_DOWNLOAD_PATH = '/library/sketchup'
  DECORPOT_UPLOAD_PATH   = '/library/designs/add/sketchup'
  DECORPOT_DOWNLOAD_URL  = DECORPOT_SERVER + DECORPOT_DOWNLOAD_PATH
  DECORPOT_UPLOAD_URL    = DECORPOT_SERVER + DECORPOT_UPLOAD_PATH
  

  # ----------------------------------------------------------------------------
  # Settings
  
  # Set WikiHouse Panel Dimensions
  decorpot_sheet_height  = 1200.mm
  decorpot_sheet_width   = 2400.mm
  decorpot_sheet_depth   = 18.mm
  decorpot_panel_padding = 25.mm / 2
  decorpot_sheet_margin  = 15.mm - decorpot_panel_padding
  decorpot_font_height   = 30.mm
  decorpot_sheet_inner_height = decorpot_sheet_height - (2 * decorpot_sheet_margin)
  decorpot_sheet_inner_width  = decorpot_sheet_width - (2 * decorpot_sheet_margin)
  
  # Store the actual values as length objects (in inches)
  @settings = {
    'sheet_height'       => decorpot_sheet_height,
    'sheet_inner_height' => decorpot_sheet_inner_height,
    'sheet_width'        => decorpot_sheet_width, 
    'sheet_inner_width'  => decorpot_sheet_inner_width,
    'sheet_depth'        => decorpot_sheet_depth, 
    'padding'            => decorpot_panel_padding,
    'margin'             => decorpot_sheet_margin,
    'font_height'        => decorpot_font_height,
  }

  class << self
    attr_accessor :settings
  end

  # Store default values for resetting.
  DEFAULT_SETTINGS = Hash[@settings]

  # ----------------------------------------------------------------------------
  # UI Configuration

  unless file_loaded?(__FILE__)

    # Initialise the data containers.
    WIKIHOUSE_DOWNLOADS = Hash.new
    WIKIHOUSE_UPLOADS = Hash.new

    # Initialise the downloads counter.
    @downloads_id = 0
    class << self
      attr_accessor :downloads_id
    end

    # Initialise the core commands.    
    DECORPOT_SETTINGS = UI::Command.new('Settings...') {
      self.load_wikihouse_settings
    }

    # Register a new submenu of the standard Plugins menu with the commands.
    DECORPOT_MENU = UI.menu('Plugins').add_submenu(DECORPOT_TITLE)
    DECORPOT_MENU.add_item(DECORPOT_SETTINGS)

    # Add our custom AppObserver.
    Sketchup.add_observer(WikiHouseAppObserver.new)

  end # if file_loaded?

end # module


# ------------------------------------------------------------------------------
# Debug

# Display the Ruby Console in dev mode.
if WikiHouseExtension::WIKIHOUSE_DEV && !file_loaded?(__FILE__)
  Sketchup.send_action('showRubyPanel:')
  
  puts ""
  puts "#{WikiHouseExtension::WIKIHOUSE_TITLE} Extension Successfully Loaded."
  puts ""
  
  # Interactive utilities
  def mod
    return Sketchup.active_model
  end
  def ent
    return Sketchup.active_model.entities
  end
  def sel 
    return Sketchup.active_model.selection
  end
end


file_loaded(__FILE__)
