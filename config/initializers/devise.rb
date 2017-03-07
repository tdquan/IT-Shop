Devise.secret_key = "7621d1f75ed5655ec31dfd82c09cb2e207571411c2df075af174fdc1b547d9f9d12ff5952b2097cb3d5622001f7c1408bde4"

Devise.setup do |config|
  # Required so users don't lose their carts when they need to confirm.
  config.allow_unconfirmed_access_for = 1.days

  # Fixes the bug where Confirmation errors result in a broken page.
  config.router_name = :spree

  # Add any other devise configurations here, as they will override the defaults provided by spree_auth_devise.
end
