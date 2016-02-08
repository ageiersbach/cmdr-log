if Rails.env.development?
  GemFresh::Config.configure do |gems|
    gems.with_system_wide_impact %w(
      foundation-rails
      jbuilder
      jquery-rails
      haml-rails
      sass-rails
      spring
      sqlite3
      rspec-rails
    )

    gems.with_local_impact %w(
      factory_girl_rails
      gem_fresh
      shoulda-matchers
      uglifier
      turbolinks
      web-console
    )

    gems.with_minimal_impact %w(
      byebug
      sdoc
    )

    gems.that_are_private %w()
  end
end
