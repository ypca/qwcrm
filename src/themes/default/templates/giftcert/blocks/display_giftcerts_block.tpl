<!-- display_giftcerts_block.tpl -->
{*
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
*}
<b>{$block_title}</b>
<table class="olotable" width="100%" cellpadding="5" celspacing="0" border="0" summary="Work order display">
    <tr>
        <td class="olohead">{t}ID{/t}</td>
        <td class="olohead">{t}Employee{/t}</td>
        <td class="olohead">{t}WO ID{/t}</td>
        <td class="olohead">{t}Inv ID{/t}</td>
        <td class="olohead">{t}Payment ID{/t}</td>
        <td class="olohead">{t}Code{/t}</td>
        <td class="olohead">{t}Client{/t}</td>
        <td class="olohead">{t}Expires{/t}</td>
        <td class="olohead">{t}Date Redeemed{/t}</td>        
        <td class="olohead">{t}Status{/t}</td>
        <td class="olohead">{t}Blocked{/t}</td>                
        <td class="olohead">{t}Amount{/t}</td>        
        <td class="olohead">{t}Redeemed By{/t}</td>
        <td class="olohead">{t}Redeemed Invoice{/t}</td>
        <td class="olohead">{t}Note{/t}</td>        
        <td class="olohead">{t}Action{/t}</td>
    </tr>
    {section name=g loop=$display_giftcerts}
        <tr onmouseover="this.className='row2';" onmouseout="this.className='row1';" {if $display_giftcerts[g].status != 'deleted'}onDblClick="window.location='index.php?component=giftcert&page_tpl=details&giftcert_id={$display_giftcerts[g].giftcert_id}';"{/if} class="row1">
            <td class="olotd4">{if $display_giftcerts[g].status != 'deleted'}<a href="index.php?component=giftcert&page_tpl=details&giftcert_id={$display_giftcerts[g].giftcert_id}">{$display_giftcerts[g].giftcert_id}</a>{else}{$display_giftcerts[g].giftcert_id}{/if}</td>
            <td class="olotd4"><a href="index.php?component=user&page_tpl=details&user_id={$display_giftcerts[g].employee_id}">{$display_giftcerts[g].employee_display_name}</a></td>
            <td class="olotd4"><a href="index.php?component=workorder&page_tpl=details&workorder_id={$display_giftcerts[g].workorder_id}">{$display_giftcerts[g].workorder_id}</a></td>
            <td class="olotd4"><a href="index.php?component=invoice&page_tpl=details&invoice_id={$display_giftcerts[g].invoice_id}">{$display_giftcerts[g].invoice_id}</a></td>            
            <td class="olotd4"><a href="index.php?component=payment&page_tpl=details&payment_id={$display_giftcerts[g].payment_id}">{$display_giftcerts[g].payment_id}</a></td>            
            <td class="olotd4">{$display_giftcerts[g].giftcert_code}</td>
            <td class="olotd4"><a href="index.php?component=client&page_tpl=details&client_id={$display_giftcerts[g].client_id}">{$display_giftcerts[g].client_display_name}</a></td>
            <td class="olotd4">{$display_giftcerts[g].date_expires|date_format:$date_format}</td>
            <td class="olotd4">
                {if $display_giftcerts[g].date_redeemed}
                    {$display_giftcerts[g].date_redeemed|date_format:$date_format}
                {/if}
            </td>
            <td class="olotd4" nowrap>
                {section name=s loop=$giftcert_statuses}    
                    {if $display_giftcerts[g].status == $giftcert_statuses[s].status_key}{t}{$giftcert_statuses[s].display_name}{/t}{/if}        
                {/section} 
            </td> 
            <td class="olotd4">
                {if $display_giftcerts[g].blocked == '0'}{t}No{/t}{/if}
                {if $display_giftcerts[g].blocked == '1'}{t}Yes{/t}{/if}
            </td>
            <td class="olotd4">{$currency_sym} {$display_giftcerts[g].amount}</td>            
            <td class="olotd4"><a href="index.php?component=client&page_tpl=details&client_id={$display_giftcerts[g].redeemed_client_id}">{$display_giftcerts[g].redeemed_client_display_name}</a></td>
            <td class="olotd4"><a href="index.php?component=invoice&page_tpl=details&invoice_id={$display_giftcerts[g].redeemed_invoice_id}">{$display_giftcerts[g].redeemed_invoice_id}</a></td>
            <td class="olotd4" nowrap>
                {if $display_giftcerts[g].note != ''}
                    <img src="{$theme_images_dir}icons/16x16/view.gif" border="0" alt="" onMouseOver="ddrivetip('<div><strong>{t}Note{/t}</strong></div><hr><div>{$display_giftcerts[g].note|htmlentities|regex_replace:"/[\t\r\n']/":" "}</div>');" onMouseOut="hideddrivetip();">
                {/if}
            </td>
            <td class="olotd4">
                {if $display_giftcerts[g].status != 'deleted'}
                    <a href="index.php?component=giftcert&page_tpl=details&giftcert_id={$display_giftcerts[g].giftcert_id}"><img src="{$theme_images_dir}icons/16x16/viewmag.gif"  border="0" onMouseOver="ddrivetip('{t}View Details{/t}');" onMouseOut="hideddrivetip();"></a>&nbsp;
                    <a href="index.php?component=giftcert&page_tpl=edit&giftcert_id={$display_giftcerts[g].giftcert_id}"><img src="{$theme_images_dir}icons/16x16/small_edit_employee.gif" border="0" onMouseOver="ddrivetip('{t}Edit{/t}');" onMouseOut="hideddrivetip();"></a>&nbsp;
                    <a href="index.php?component=giftcert&page_tpl=print&giftcert_id={$display_giftcerts[g].giftcert_id}&print_content=gift_certificate&print_type=print_html&theme=print" target="_blank"> 
                        <img src="{$theme_images_dir}icons/16x16/fileprint.gif" border="0" onMouseOver="ddrivetip('{t}Print the Gift Certificate{/t}');" onMouseOut="hideddrivetip();">
                    </a>
                {/if}
            </td>
        </tr>
    {sectionelse}
        <tr>
            <td colspan="16" class="error">{t}There are no gift certificates.{/t}</td>
        </tr>        
    {/section}
</table>