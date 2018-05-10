# Code does not run it is just an example.

def handle_purchase(cart, credit_card)
  logger.info("Starting transaction at #{DateTime.now}")
  success_flag = nil

  total = cart.calculate_total
  if charge_card(credit_card, total)
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
  result = PaymentGateway.charge(card.number, amount)

  if result.status == 'complete'  # if transaction was a success return the code otherwise return false.
    logger.info("Successfully charged card.  Trans Code = #{result.transaction_code}")
    return result.transaction_code
  else
    logger.info("Failed to charge card. Error Code = #{result.error_code}")
    return false
  end
end
