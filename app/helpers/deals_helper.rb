module DealsHelper
  def bip(deal,attr,options=nil)
    if options.nil?
      options = {type: :input}
    end
    best_in_place_if can?(:update,deal),deal,attr,options 
  end
end
