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

def unique_count(cart)
  temp = []
  
  index = 0
  while index < cart.size do
    if !temp.include?(cart[index][:item])
      temp << cart[index][:item]
    else
      cart[index][:count] += 1
    end
    index += 1
  end
  
  return cart.uniq
end

def consolidate_cart(cart)
  
  index = 0
  while index < cart.size do
    cart[index][:count] = 1
    index += 1
  end
  
  return unique_count(cart)
end

def apply_coupons(cart, coupons)
  temp = cart
  
  index = 0
  while index < coupons.size do
    discounted_price = coupons[index][:cost] / coupons[index][:num]
    
    i = 0
    while i < cart.size do
      if coupons[index][:item] == temp[i][:item] && temp[i][:count] >= coupons[index][:num]
        temp[i][:count] -= coupons[index][:num]
        temp << { item: "#{temp[i][:item]} W/COUPON", price: discounted_price, clearance: temp[i][:clearance], count: coupons[index][:num] }
      end
      i += 1
    end
    
    index += 1
  end
  pp temp
  return temp
end

def apply_clearance(cart)
  
  index = 0
  while index < cart.size do
    
    index += 1
  end
  
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  apply_coupons(consolidated_cart, coupons)
end
