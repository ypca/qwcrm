<!-- display_payment_methods_block.tpl -->
{*
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
*}
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/jscal2.css" />
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/steel/steel.css" />
<script src="{$theme_js_dir}jscal2/jscal2.js"></script>
<script src="{$theme_js_dir}jscal2/unicode-letter.js"></script>
<script>{include file="../`$theme_js_dir_finc`jscal2/language.js"}</script>
<script>
    
    // If the page is reloaded by the system we need to enable the select payment method
    {if $payment_method}
        $(document).ready(function() {
            selectPaymentMethod();
        } );    
    {/if}
    
    // Show selected Payment Method
    function selectPaymentMethod() { 

        // Get the selected payment method name
        var paymentMethod = document.getElementById("method").value;
        
        // Hide the other payment methods
        $(".paymentMethod").hide();
        
        // Disable all input fields
        $(".paymentInput").prop("disabled", true);
        
        // Unhide the selected payment method               
        $("#" + paymentMethod).show();
        
        // Enable selected input fields
        $("#" + paymentMethod + " .paymentInput").prop("disabled", false);
        
    }

</script>

<table width="700" border="0" cellpadding="20" cellspacing="5">
    <tr>
        <td>
            <table width="100%" cellpadding="4" cellspacing="0" border="0">
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{t}Payments for{/t} {t}Invoice{/t} {$invoice_details.invoice_id} - {$client_details.display_name}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle">
                        <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}PAYMENT_NEW_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}PAYMENT_NEW_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                    </td>
                </tr>
                <tr>
                    <td class="olotd5" colspan="2">
                        <form method="post" action="index.php?component=payment&page_tpl=new&invoice_id={$invoice_id}">
                            <table width="100%" border="0" cellpadding="10" cellspacing="0" class="olotable">

                                <!-- Payment Type -->
                                <tr>
                                    <td>
                                        {t}Payment Type{/t}:&nbsp;
                                        {section name=t loop=$payment_types}    
                                            {if $payment_type == $payment_types[t].payment_type_id}{t}{$payment_types[t].display_name}{/t}{/if}                    
                                        {/section}
                                    </td>
                                </tr>
                                
                                <!-- Select Payment Method -->
                                {if $payment_methods}
                                    <tr>
                                        <td>
                                            <p>{t}Select Payment Method{/t}</p>
                                            <select id="method" name="qpayment[method]" class="olotd4" onChange="selectPaymentMethod();" required>                                            
                                                <option selected hidden disabled></option>
                                                {section name=s loop=$payment_methods}
                                                    <option value="{$payment_methods[s].payment_method_id}"{if $payment_methods[s].payment_method_id === $payment_method} selected{/if}>{t}{$payment_methods[s].display_name}{/t}</option>
                                                {/section} 
                                            </select>
                                        </td> 
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span style="color: red;">{t}There are no payment methods available.{/t}</td>
                                    </tr>
                                {/if}

                                <!-- Payment Methods -->
                                <tr>
                                    <td>

                                        <!-- Bank Transfer -->
                                        <div id="bank_transfer" class="paymentMethod"{if $payment_method !== 'bank_transfer'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Bank Transfer{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}Transfer Reference{/t}:</b></td>
                                                                <td class="row2"><b>{t}Amount{/t}:</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="bank_transfer_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="bank_transfer_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "bank_transfer_date_button",
                                                                            inputField  : "bank_transfer_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td><input name="qpayment[transfer_reference]" class="paymentInput olotd5" type="text" maxlength="35" required onkeydown="return onlyAlphaNumericPunctuation(event);" disabled></td>
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" required maxlength="10" pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="3" ><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>   
                                                                
                                        <!-- Cash -->
                                        <div id="cash" class="paymentMethod"{if $payment_method !== 'cash'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Cash{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}Amount{/t}</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="cash_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="cash_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "cash_date_button",
                                                                            inputField  : "cash_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" maxlength="10" required pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="3"><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <!-- Cheque -->
                                        <div id="cheque" class="paymentMethod"{if $payment_method !== 'cheque'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Cheque{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}Cheque Number{/t}:</b></td>
                                                                <td class="row2"><b>{t}Amount{/t}</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="cheque_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="cheque_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "cheque_date_button",
                                                                            inputField  : "cheque_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td><input name="qpayment[cheque_number]" class="paymentInput olotd5" type="text" maxlength="15" required onkeydown="return onlyNumber(event);"></td>                        
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" maxlength="10" required pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="3" ><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div> 

                                        <!-- Card -->
                                        <div id="card" class="paymentMethod"{if $payment_method !== 'card'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Card{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}type{/t}:</b></td>
                                                                <td class="row2"><b>{t}Name on Card{/t}:</b></td>                        
                                                                <td class="row2"><b>{t}Amount{/t}:</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="card_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="card_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "card_date_button",
                                                                            inputField  : "card_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td>
                                                                    <select name="qpayment[card_type]" class="paymentInput olotd4" required disabled>
                                                                        <option selected hidden disabled></option>
                                                                        {section name=c loop=$payment_active_card_types}
                                                                            <option value="{$payment_active_card_types[c].card_key}">{$payment_active_card_types[c].display_name}</option>
                                                                        {/section}
                                                                    </select>
                                                                </td>                        
                                                                <td><input name="qpayment[name_on_card]" class="paymentInput olotd5" type="text" maxlength="20" required onkeydown="return onlyAlpha(event);" disabled></td>
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" maxlength="10" required pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="4"><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <!-- Direct Debit -->
                                        <div id="direct_debit" class="paymentMethod"{if $payment_method !== 'direct_debit'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Direct Debit{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}DD Reference{/t}:</b></td>
                                                                <td class="row2"><b>{t}Amount{/t}:</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="direct_debit_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="bank_transfer_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "direct_debit_date_button",
                                                                            inputField  : "direct_debit_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td><input name="qpayment[dd_reference]" class="paymentInput olotd5" type="text" maxlength="35" required onkeydown="return onlyAlphaNumericPunctuation(event);" disabled></td>
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" required maxlength="10" pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="3" ><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>                                    

                                        <!-- Gift Certificate -->
                                        <div id="gift_certificate" class="paymentMethod"{if $payment_method !== 'gift_certificate'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Gift Certificate{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}Gift Code{/t}</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="giftcert_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="giftcert_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "giftcert_date_button",
                                                                            inputField  : "giftcert_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td><input name="qpayment[giftcert_code]" class="paymentInput olotd5" type="text" maxlength="16" required onkeydown="return onlyGiftCertCode(event);" disabled></td> 
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="2"><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>                    
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                                                
                                        <!-- Other -->
                                        <div id="other" class="paymentMethod"{if $payment_method !== 'other'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Other{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td>
                                                                <td class="row2"><b>{t}Amount{/t}</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="cash_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="cash_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "other_date_button",
                                                                            inputField  : "other_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" maxlength="10" required pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="3"><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <!-- PayPal -->
                                        <div id="paypal" class="paymentMethod"{if $payment_method !== 'paypal'} hidden{/if}>
                                            <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="menuhead2">&nbsp;{t}Paypal{/t}</td>
                                                </tr>
                                                <tr>
                                                    <td class="menutd2">
                                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                            <tr class="olotd4">
                                                                <td class="row2"></td>
                                                                <td class="row2"><b>{t}Date{/t}</b></td> 
                                                                <td class="row2"><b>{t}Transaction ID{/t}:</b></td>
                                                                <td class="row2"><b>{t}Amount{/t}:</b></td>
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td></td>
                                                                <td>
                                                                    <input id="paypal_date" name="qpayment[date]" class="paymentInput olotd4" size="10" value="{$smarty.now|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);" disabled>
                                                                    <button type="button" id="paypal_date_button">+</button>
                                                                    <script>                                                        
                                                                        Calendar.setup( {
                                                                            trigger     : "paypal_date_button",
                                                                            inputField  : "paypal_date",
                                                                            dateFormat  : "{$date_format}"                                                                                            
                                                                        } );                                                        
                                                                    </script>                                                    
                                                                </td>
                                                                <td><input name="qpayment[paypal_payment_id]" class="paymentInput olotd5" type="text" maxlength="20" required onkeydown="return onlyAlphaNumeric(event);" disabled></td>
                                                                <td>{$currency_sym}<input name="qpayment[amount]" class="paymentInput olotd5" size="10" value="{$invoice_details.balance|string_format:"%.2f"}" type="text" maxlength="10" required pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>{t}Note{/t}</b></td>
                                                                <td colspan="4"><textarea name="qpayment[note]" cols="60" rows="4" class="paymentInput olotd4" disabled></textarea></td>
                                                            </tr>                    
                                                        </table>                                                        
                                                    </td>
                                                </tr>                                                
                                            </table>                                                  
                                        </div>                                        
                                                                
                                        <!-- Hidden Variables -->                                                
                                        <div hidden> 
                                            <input type="hidden" name="qpayment[invoice_id]" value="{$invoice_id}">
                                            <input type="hidden" name="qpayment[type]" value="{$payment_type}">                                                    
                                        </div>

                                    </td>
                                </tr>
                                
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>