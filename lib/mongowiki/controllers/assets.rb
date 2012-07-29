class AssetsController < Happy::Controller

  def route
    layout false
    on('application.css') { serve_css }
    on('application.js') { serve_js }
  end

  def serve_css
    bundled_css = get_asset_bundle('css', '*.css')
    serve! bundled_css, :content_type => 'text/css'
  end

  def serve_js
    bundled_js = get_asset_bundle('js', '*.js')
    packed_js = pack_javascript(bundled_js)
    serve! packed_js, :content_type => 'text/javascript'
  end
  
  private 
  def get_asset_bundle(bundle_dir, file)
    assets_path = File.join(settings[:views], 'assets')
    bundle_path = File.join(assets_path, bundle_dir)
    code = Dir[File.join(bundle_path, file)].map do |filename|
      File.read(filename)
    end
    code.join("\n")
  end
  
  def pack_javascript(plain_js)
    Packr.pack(plain_js, :minify => true, :shrink_vars => true, :private => true)
  end
  
end