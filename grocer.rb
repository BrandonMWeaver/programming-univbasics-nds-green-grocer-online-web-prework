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
  
  return cart
end

def consolidate_cart(cart)
  
  index = 0
  while index < cart.size do
    cart[index][:count] = 1
    index += 1
  end
  
  unique_count(cart)
  
  pp cart
  return cart
end

def apply_coupons(cart, coupons)
  temp = []
  
  index = 0
  while index < coupons.size do
    item = coupons[index][:item]
    if cart[item][:count] >= coupons[index][:num]
      cart[item][:count] -= coupons[index][:num]
      new_price = coupons[index][:cost] / coupons[index][:num]
      temp << { item: "#{item} W/COUPON", price: new_price, clearance: cart[item][:clearance], count: coupons[index][:num] }
      if cart[item][:count] == 0
        cart[item].remove
      else
        temp << { item: item, price: cart[item][:price], clearance: cart[item][:clearance], count: cart[item][:count] }
      end
    else
      temp << { item: item, price: cart[item][:price], clearance: cart[item][:clearance], count: cart[item][:count] }
    end
    index += 1
  end
  
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
