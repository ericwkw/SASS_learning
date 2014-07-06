# Require any additional compass plugins here.
# -----------------------------------------------------------------------------
project_path = File.expand_path("..",File.dirname(__FILE__))


# Set this to the root of your project when deployed:
# -----------------------------------------------------------------------------

http_path = "/"
css_dir = "assets/css"
sass_dir = "assets/css"
images_dir = "assets/img"
javascripts_dir = "assets/js"
#svg_dir = "assets/svg"
#fonts_dir = "assets/fonts"

# Output style and comments
# -----------------------------------------------------------------------------

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
# Over-ride with force compile to change output style with: compass compile --output-style compressed --force
output_style = :expanded

line_comments = false
cache = true
color_output = false # required for Mixture

require 'sass-globbing'


# SASS core
# -----------------------------------------------------------------------------

# Chrome needs a precision of 7 to round properly
Sass::Script::Number.precision = 7


# Output min files with .min added to filenames
# -----------------------------------------------------------------------------

# Output the correct .min files
require 'fileutils'

on_stylesheet_saved do |file|

  if file.match('.min') == nil

    require 'compass'

    Compass.add_configuration(
        {
            :project_path => File.dirname(File.dirname(file)),
            :sass_dir => File.basename(File.dirname(file)),
            :css_path => File.basename(File.dirname(file)),
            :output_style => :compressed
        },
        'alwaysmin' # A name for the configuration, can be anything you want
    )
    Compass.compiler.compile(File.dirname(file) + "/" + File.basename(file, '.css') + '.scss', File.dirname(file) + "/" + File.basename(file, '.css') + ".min.css")

  end

end
