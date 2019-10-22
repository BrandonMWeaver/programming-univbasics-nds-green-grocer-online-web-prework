def find_item_by_name_in_collection(name, collection)
  
  index = 0
  while index < collection.size do
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
  
  return nil
end

def consolidate_cart(cart)
  items = {}
  
  index = 0
  while index < cart.size do
    if !items.include?(cart[index][:item])
      items[cart[index][:item]] = { price: cart[index][:price], clearance: cart[index][:clearance], count: 1 }
    else
      items[cart[index][:item]][:count] += 1
    end
    index += 1
  end
  
  return items
end

def apply_coupons(cart, coupons)
  temp = []
  
  index = 0
  while index < coupons.size do
    item = coupons[index][:item]
    if cart[item] != nil && cart[item][:count] >= coupons[index][:num]
      cart[item][:count] -= coupons[index][:num]
      if cart[item][:count] != 0
        cart[item][:item] = item
        temp << cart[item]
        new_price = coupons[index][:cost] / coupons[index][:num]
        temp << { price: 20, clearance: cart[item][:clearance], count: coupons[index][:num], item: "#{item}, W/COUPON" }
      end
    end
    index += 1
  end
  
  pp temp
  return temp
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
end
