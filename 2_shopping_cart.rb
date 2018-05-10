# Does not run. Just an example to show real world version. Code that Jeff worked on for Braintree client.

def handle_purchase(cart, credit_card)  # Took 2 arguments
  logger.info("Starting transaction at #{DateTime.now}")
  success_flag = nil

  total = cart.calculate_total
  if charge_card(credit_card, total) # Calculate total and charge the card.
    cart.complete = true
    cart.save_to_database
    success_flag = true
  else
    cart.complete = false
    success_flag = false
  end

  logger.info("Finished transaction at #{DateTime.now}")
  return success_flag
end

def charge_card(card, amount)
  logger.info("Starting to charge the card at #{DateTime.now}")
  result = PaymentGateway.charge(card.number, amount)   # Only PaymentGateway class had to be updated when Paypal bought it.

  if result.status == 'complete'  # If the status was complete we return transaction code othrwise return false.
    logger.info("Successfully charged card.  Trans Code = #{result.transaction_code}")
    return result.transaction_code
  else
    logger.info("Failed to charge card. Error Code = #{result.error_code}")
    return false
  end
end
