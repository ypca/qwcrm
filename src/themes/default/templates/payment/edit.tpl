<!-- edit.tpl -->
{*
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
*}
<script src="{$theme_js_dir}tinymce/tinymce.min.js"></script>
<script>{include file="`$theme_js_dir_finc`editor-config.js"}</script>
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/jscal2.css" />
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/steel/steel.css" />
<script src="{$theme_js_dir}jscal2/jscal2.js"></script>
<script src="{$theme_js_dir}jscal2/unicode-letter.js"></script>
<script>{include file="`$theme_js_dir_finc`jscal2/language.js"}</script>

<table width="100%" border="0" cellpadding="20" cellspacing="0">
    <tr>
        <td>
            <table width="700" cellpadding="5" cellspacing="0" border="0" >
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{t}Payment Edit Page{/t}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle">
                        <a>
                            <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}PAYMENT_EDIT_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}PAYMENT_EDIT_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="menutd2" colspan="2">
                        <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                            <tr>
                                <td width="100%" valign="top" >
                                    <table class="menutable" width="100%" border="0" cellpadding="0" cellspacing="0" >
                                     <tr>
                                         <td>                                                                                           
                                            <form method="post" action="index.php?component=payment&page_tpl=edit&payment_id={$payment_details.payment_id}" name="edit_payment" id="edit_payment">                                                
                                                <table width="100%" cellpadding="2" cellspacing="2" border="0">                                                    
                                                    <tr>
                                                        <td align="right"><b>{t}Payment ID{/t}</b></td>
                                                        <td colspan="3">{$payment_details.payment_id}</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Employee{/t}</b></td>
                                                        <td colspan="3">
                                                            <a href="index.php?component=user&page_tpl=details&user_id={$payment_details.employee_id}">{$employee_display_name}</a>
                                                            <input name="employee_id" value="{$payment_details.employee_id}" type="hidden">                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Client{/t}</b></td>
                                                        <td colspan="3">
                                                            <a href="index.php?component=client&page_tpl=details&client_id={$payment_details.client_id}">{$client_display_name}</a>
                                                            <input name="client_id" value="{$payment_details.client_id}" type="hidden">                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Workorder ID{/t}</b></td>
                                                        <td colspan="3">
                                                            <a href="index.php?component=invoice&page_tpl=details&invoice_id={$payment_details.workorder_id}">{$payment_details.workorder_id}</a>
                                                            <input name="workorder_id" value="{$payment_details.workorder_id}" type="hidden">                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Invoice ID{/t}</b></td>
                                                        <td colspan="3">
                                                            <a href="index.php?component=invoice&page_tpl=details&invoice_id={$payment_details.invoice_id}">{$payment_details.invoice_id}</a>
                                                            <input name="invoice_id" value="{$payment_details.invoice_id}" type="hidden">                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Date{/t}</b><span style="color: #ff0000"> *</span></td>
                                                        <td>
                                                            <input id="date" name="date" class="olotd5" size="10" value="{$payment_details.date|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{2,4}(?:\/|-)[0-9]{2}(?:\/|-)[0-9]{2,4}${/literal}" required onkeydown="return onlyDate(event);">
                                                            <button type="button" id="date_button">+</button>
                                                            <script>                                                                
                                                                Calendar.setup( {
                                                                    trigger     : "date_button",
                                                                    inputField  : "date",
                                                                    dateFormat  : "{$date_format}"                                                                                            
                                                                } );                                                                  
                                                            </script>                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Type{/t}</b></td>
                                                        <td colspan="3">
                                                            {section name=t loop=$payment_types}    
                                                                {if $payment_details.type == $payment_types[t].payment_type_id}{t}{$payment_types[t].display_name}{/t}{/if}                    
                                                            {/section}
                                                            <input name="type" value="{$payment_details.type}" type="hidden"> 
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Payment Method{/t}</b><span style="color: #ff0000"> *</span></td>
                                                        <td>
                                                            <select id="method" name="method" class="olotd5">
                                                                {section name=s loop=$payment_methods}    
                                                                    <option value="{$payment_methods[s].payment_method_id}"{if $payment_details.method == $payment_methods[s].payment_method_id} selected{/if}>{t}{$payment_methods[s].display_name}{/t}</option>
                                                                {/section}
                                                                <input name="method" value="{$payment_details.method}" type="hidden"> 
                                                            </select>
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td align="right"><b>{t}Status{/t}</b></td>
                                                        <td colspan="3">
                                                            {section name=t loop=$payment_statuses}    
                                                                {if $payment_details.status == $payment_statuses[t].status_key}{t}{$payment_statuses[t].display_name}{/t}{/if}                    
                                                            {/section}
                                                            <input name="status" value="{$payment_details.status}" type="hidden"> 
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td align="right"><b>{t}Amount{/t}</b><span style="color: #ff0000"> *</span></td>
                                                        <td><input name="amount" class="olotd5" size="10" value="{$payment_details.amount}" type="text" maxlength="10" pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumberPeriod(event);"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><b>{t}Note{/t}</b></td>
                                                        <td><textarea name="note" class="olotd5" cols="50" rows="15">{$payment_details.note}</textarea></td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">
                                                            <button type="submit" name="submit" value="submit">{t}Update{/t}</button>
                                                            <button type="button" class="olotd4" onclick="window.location.href='index.php?component=payment&page_tpl=details&payment_id={$payment_id}';">{t}Cancel{/t}</button>
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
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>