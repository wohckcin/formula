# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Formula::Application.initialize!

# Site configuration
SITE_NAME = 'CodeName: Formula'
SITE_VERSION = 'VERSION: 1.0.0-' + Rails.env