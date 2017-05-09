<!-- new_gift.tpl -->
<script src="{$theme_js_dir}tinymce/tinymce.min.js"></script>
<script src="{$theme_js_dir}editor-config.js"></script>
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/jscal2.css" />
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/steel/steel.css" />
<script src="{$theme_js_dir}jscal2/jscal2.js"></script>
<script src="{$theme_js_dir}jscal2/unicode-letter.js"></script>
<script>{include file="`$theme_js_dir_finc`jscal2/language.js"}</script>

<table width="700" border="0" cellpadding="20" cellspacing="5">
    <tr>
        <td>
            <table width="100%" cellpadding="4" cellspacing="0" border="0">
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{$translate_payment_new_gift} {$customer_id}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle"></td>
                </tr>
                <tr>
                    <td class="olotd5" colspan="2">     
                        <table width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                            <tr>
                                <td class="olotd4">
                                    {$translate_payment_gift_note_3} {$customer_name} {$translate_payment_gift_note_4}
                                    <form method="post" action="index.php?page=giftcert:new&customer_id={$customer_id}" name="gift" id="gift">
                                        <table>
                                            <tr>
                                                <td><b>{$translate_payment_customer_name}</b></td>
                                                <td>{$customer_id}</td>
                                            </tr>
                                            <tr>
                                                <td><b>{$translate_payment_exp}</b></td>
                                                <td>
                                                    <input class="olotd5" size="10" name="date_expires" type="text" id="date_expires" class="olotd4"/>
                                                    <input type="button" id="date_expires_button" value="+">
                                                    <script>                                                       
                                                        Calendar.setup( {
                                                            trigger     : "date_expires_button",
                                                            inputField  : "date_expires",
                                                            dateFormat  : "{$date_format}"
                                                        } );                                                     
                                                    </script>                                                                                                        
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>{$translate_payment_amount}</b></td>
                                                <td>{$currency_sym}<input type="text" name="amount" class="olotd5" size="6" ></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>{$translate_payment_note}:</b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><textarea class="olotd5" rows="15" cols="70" name="note"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">                                                    
                                                    <input type="submit" name="submit" value="Submit">
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