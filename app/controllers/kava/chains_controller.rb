class Kava::ChainsController < Common::ChainsController
  def broadcast
    tx = { tx: params[:payload], mode: 'sync' }
    r = @chain.syncer(5000).broadcast_tx( tx )
    ok = !r.has_key?('code') && !r.has_key?('error')
    Rails.logger.error "\n\nBROADCAST RESULT: #{r.inspect}\n\n"
    render json: { ok: ok }.merge(r)
  end
end
