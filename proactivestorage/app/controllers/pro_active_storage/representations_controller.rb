# frozen_string_literal: true

# Take a signed permanent reference for a blob representation and turn it into an expiring service URL for download.
# Note: These URLs are publicly accessible. If you need to enforce access protection beyond the
# security-through-obscurity factor of the signed blob and variation reference, you'll need to implement your own
# authenticated redirection controller.
class ProActiveStorage::RepresentationsController < ProActiveStorage::BaseController
  include ProActiveStorage::SetBlob

  def show
    expires_in ProActiveStorage.service_urls_expire_in
    redirect_to @blob.representation(params[:variation_key]).processed.service_url(disposition: params[:disposition])
  end
end
