<!-- new_payment_gift_certificate_block.tpl -->
<form method="post" action="index.php?page=payment:new&invoice_id={$invoice_id}">
    <table width="100%" cellpadding="4" cellspacing="0" border="0" >
        <tr>
            <td class="menuhead2">&nbsp;{$translate_payment_gift}</td>
        </tr>
        <tr>
            <td class="menutd2">
                <table width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                    <tr class="olotd4">
                        <td class="row2"></td>                        
                        <td class="row2"><b>{$translate_payment_gift_code}</b></td>
                    </tr>
                    <tr class="olotd4">
                        <td></td>                        
                        <td><input type="text" name="giftcert_code" size="16" class="olotd4"><br>{$translate_payment_gift_code_2}</td>
                    </tr>
                    <tr>
                        <td valign="top"><b>{$translate_payment_memo}</b></td>
                        <td colspan="2"><textarea name="memo" cols="60" rows="4" class="olotd4"></textarea></td>
                    </tr>                    
                </table>
                <p>
                    <input type="hidden" name="type" value="4">                    
                    <button type="submit" name="submit" value="submit">Submit Gift Certificate</button>
                </p>
            </td>
        </tr>
    </table>
</form>