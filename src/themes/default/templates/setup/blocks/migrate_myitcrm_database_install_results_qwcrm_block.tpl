<!-- migrate_myitcrm_database_install_results_qwcrm_block.tpl -->
{*
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
*}
<form method="post" action="index.php?component=setup&page_tpl=migrate">                   
    <table width="600" cellpadding="5" cellspacing="0" border="0">
        <tr>
            <td class="menuhead2" width="80%">&nbsp;{t}QWcrm Database Installation Results{/t}</td>
            {*<td class="menuhead2" width="20%" align="right" valign="middle">  <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}ADMINISTRATOR_CONFIG_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}ADMINISTRATOR_CONFIG_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();"></td>*}
        </tr>
        <tr>
            <td class="menutd2">
                <table width="600" class="olotable" cellpadding="5" cellspacing="0" border="0">
                    <tr>
                        <td style="text-align: center;">
                            {$executed_sql_results}
                        </td>
                    </tr> 
                    <tr>
                        {if !$setup_error_flag}
                        <td colspan="2" style="text-align: center;">
                            <button class="olotd5" type="submit" name="submit" value="database_install_results_qwcrm">{t}Next{/t}</button>
                        </td>
                        {else}
                        <td colspan="2" style="text-align: center;">
                            <strong><span style="color: red">{t}You cannot continue because there was a fault with the database installation.{/t}</span></strong>
                        </td>
                        {/if}
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>